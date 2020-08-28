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
    const QUERY_POSIBILITIES = ['limit', 'orderBy', 'startDate', 'endDate'];

    /**
     * @Route("/articles/", name="venture_getArticles")
     *
     */
    public function getArticles()
    {
        $jsonArticles = [];
        $em = $this->getDoctrine()->getManager();
        $articles = $em
            ->getRepository(Article::class)
            ->findAll();

        foreach ($articles as $article) {
            $jsonArticles[] = [
                'id' => $article->getId(),
                'title' => $article->getTitle(),
                'text' => $article->getText()
            ];
        }
        
        $response = new Response();
        $response->setContent(json_encode($jsonArticles));
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

        $author = $article->getAuthor()->getName();

        $result = [
            'id' => $article->getId(),
            'title' => $article->getTitle(),
            'text' => $article->getText(),
            'date' => $article->getCreatedAt()->format('d/m/Y'),
            'author' => $author
        ];
        
        $response = new Response();
        $response->setContent(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }

    /**
     * @Route("/authors/", name="venture_getAuthors")
     *
    */
    public function getAuthors(AuthorRepository $authorRepository, ArticleRepository $articleRepository, Request $request)
    {
        $result = [
            'msg' => 'nothing'
        ];
        $anyProperValue = true;

        // Checks for any url query
        if ($request->getQueryString()) {
            $queries = explode('&', $request->getQueryString());
            foreach ($queries as $query) {
                $var = explode('=', $query);
                if (in_array($var[0], self::QUERY_POSIBILITIES)) {
                    $anyProperValue = false;
                }
            }
        }
        
        // if any of possible query variables else get all
        if ($anyProperValue) {
            $authors = $authorRepository->findAll();

            foreach ($authors as $author) {
                $articlesOfAuthor = $author->getArticles()->getValues();
                $articles = [];
    
                foreach ($articlesOfAuthor as $article) {
                    $articles[] = [
                        'id' => $article->getId(),
                        'title' => $article->getTitle(),
                        'text' => $article->getText(),
                        'date' => $article->getCreatedAt()->format('d/m/Y'),
                    ];
                }
    
                $result[] = [
                    'id' => $author->getId(),
                    'name' => $author->getName(),
                    'articles' => $articles,
                ];
            }
        } elseif ($request->get('type') == 'best') {
            $articles = $articleRepository->findByDate($request->get('startDate'), $request->get('endDate'));
            if (!empty($articles)) {
                $authors = [];

                foreach ($articles as $article) {
                    $author = $article->getAuthor();
                    if (!isset($authors[$author->getId()])) {
                        $authors[$author->getId()]['numberOfArticles'] = 1;
                        $authors[$author->getId()]['name'] = $author->getName();
                    } else {
                        $authors[$author->getId()]['numberOfArticles'] += 1;
                    }
                }

                $sort = array_reverse($this->multisort($authors, ['numberOfArticles']));

                $result = [$sort[0],$sort[1],$sort[2]];
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
        $jsonArticles = [];
        $em = $this->getDoctrine()->getManager();

        $author = $em
            ->getRepository(Author::class)
            ->findOneBy([
                'id' => $id
            ]);

        $articles = $author->getArticles()->getValues();

        foreach ($articles as $article) {
            $jsonArticles[$article->getId()] = [
                'title' => $article->getTitle(),
                'text' => $article->getText(),
                'date' => $article->getCreatedAt()->format('d/m/Y'),
            ];
        }

        $result[$author->getId()] = [
                'name' => $author->getName(),
                'articles' => $jsonArticles
            ];
        
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
            $result[$article->getId()] = [
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

    public function multisort($array, $sort_by)
    {
        foreach ($array as $key => $value) {
            $evalstring = '';
            foreach ($sort_by as $sort_field) {
                $tmp[$sort_field][$key] = $value[$sort_field];
                $evalstring .= '$tmp[\'' . $sort_field . '\'], ';
            }
        }
        $evalstring .= '$array';
        $evalstring = 'array_multisort(' . $evalstring . ');';
        eval($evalstring);
    
        return $array;
    }
}
