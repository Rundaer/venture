<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Author;
use App\Repository\AuthorRepository;
use App\Repository\ArticleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\IsNull;

class VentureController extends AbstractController
{
    /**
     * @Route("/articles/", name="venture_getArticles")
     *
     */
    public function getArticles()
    {
        $result = [];
        $em = $this->getDoctrine()->getManager();
        $articles = $em
            ->getRepository(Article::class)
            ->findAll();

        foreach ($articles as $article) {
            $result[] = [
                'id' => $article->getId(),
                'title' => $article->getTitle(),
                'text' => $article->getText()
            ];
        }
        

        $response = new Response();
        $response->setContent(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }

    /**
     * @Route("/articles/{id}", name="venture_getArticleById")
     *
     */
    public function getArticleById(int $id)
    {
        $em = $this->getDoctrine()->getManager();
        $article = $em
            ->getRepository(Article::class)
            ->findOneBy([
                'id' => $id
            ]);

        $result = [
            'id' => $article->getId(),
            'title' => $article->getTitle(),
            'text' => $article->getText(),
            'date' => $article->getCreatedAt()->format('Y/m/d'),
        ];

        foreach ($article->getAuthors()->getValues() as $author) {
            $result['authors'][] = $author->toArray();
        }
        
        $response = new Response();
        $response->setContent(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }

    /**
     * @Route("/authors/", name="venture_getAuthors")
     *
    */
    public function getAuthors(AuthorRepository $authorRepository, Request $request)
    {
        $result = [];
        if ($request->getQueryString()) {
            $queryForNonValues = $this->variablesForQueryString($request->getQueryString());
        } else {
            $queryForNonValues = true;
        }

        // if any of possible query variables else get all
        if ($queryForNonValues) {
            $authors = $authorRepository->findAll();

            foreach ($authors as $author) {
                $articleToArray = [];
                foreach ($author->getArticles()->getValues() as $article) {
                    $articleToArray[] = $article->getId();
                }

                $result[] = [
                    'id' => $author->getId(),
                    'name' => $author->getName(),
                    'articles' => $articleToArray
                ];
            }
        } elseif ($request->get('type') == 'best') {
            $result = $authorRepository->findTheBestOnes(
                $request->get('startDate'),
                $request->get('endDate'),
                $request->get('limit')
            );
        } else {
            $authors = $authorRepository->findBy([], null, $request->get('limit'));
            foreach ($authors as $author) {
                $articleToArray = [];
                foreach ($author->getArticles()->getValues() as $article) {
                    $articleToArray[] = $article->getId();
                }
                $result[] = [
                    'id' => $author->getId(),
                    'name' => $author->getName(),
                    'articles' => $articleToArray
                ];
            }
        }

        $response = new Response();
        $response->setContent(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }


    /**
     * @Route("/authors/{id}", name="venture_getAuthorById")
     */
    public function getAuthorById(int $id)
    {
        $result = [];
        $em = $this->getDoctrine()->getManager();

        $author = $em
            ->getRepository(Author::class)
            ->findOneBy([
                'id' => $id
            ]);

        $articles = $author->getArticles()->getValues();

        
        $result = [
                'id' => $author->getId(),
                'name' => $author->getName()
            ];

        foreach ($articles as $article) {
            $result['articles'][] = [
                'id'    => $article->getId(),
                'title' => $article->getTitle(),
                'text'  => $article->getText(),
                'date'  => $article->getCreatedAt()->format('d/m/Y'),
            ];
        }
        
        $response = new Response();
        $response->setContent(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }



    /**
     * @Route("/authors/{id}/articles", name="venture_getAuthorsArticlesById")
     *
     */
    public function getAuthorsArticlesById(int $id)
    {
        $result = [];
        $em = $this->getDoctrine()->getManager();

        $author = $em
            ->getRepository(Author::class)
            ->findOneBy([
                'id' => $id
            ]);

        foreach ($author->getArticles()->getValues() as $article) {
            $result[] = [
                'id' => $article->getId(),
                'title' => $article->getTitle(),
                'text' => $article->getText(),
                'date' => $article->getCreatedAt()->format('d/m/Y'),
            ];
        }
        
        $response = new Response();
        $response->setContent(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }

    public function variablesForQueryString(string $queryString): bool
    {
        $checkForVars = true;
        // Checks for any url query
        $queries = explode('&', $queryString);
        foreach ($queries as $query) {
            $var = explode('=', $query);
            if (in_array($var[0], Author::QUERY_POSIBILITIES)) {
                $checkForVars = false;
            }
        }

        return $checkForVars;
    }
}
