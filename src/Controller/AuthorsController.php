<?php

namespace App\Controller;

use App\Entity\Author;
use App\Repository\AuthorRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AuthorsController extends AbstractController
{
    /**
     * @Route("/api/authors/", name="authors_getAuthors")
     *
    */
    public function getAuthorsAction(AuthorRepository $authorRepository, Request $request)
    {
        $result = [];
        $requestParametersToValidate = $request->query->all();
        if (empty($requestParametersToValidate)) {
            $noParameters = true;
        } elseif (empty(array_intersect(array_keys($requestParametersToValidate), Author::QUERY_POSIBILITIES))) {
            $noParameters = true;
        } else {
            $noParameters = false;
        }

        // if any of possible query variables else get all
        if ($noParameters) {
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
        } elseif ($request->get('type') == 'best') { // If search for best authors
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
        if (!empty($result)) {
            $response->setContent(json_encode($result));
            $response->headers->set('Content-Type', 'application/json');
        } else {
            $response->setStatusCode(Response::HTTP_NO_CONTENT);
        }
        
        return $response;
    }


    /**
     * @Route("/api/authors/{id}", name="authors_getAuthorById")
     */
    public function getAuthorByIdAction(int $id)
    {
        $em = $this->getDoctrine()->getManager();
        $author = $em
            ->getRepository(Author::class)
            ->findOneBy([
                'id' => $id
            ]);

        if (!is_null($author)) {
            $result = [];
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
                    'date'  => $article->getCreatedAt()->format('Y/m/d'),
                ];
            }

            $response = new Response();
            $response->setStatusCode(Response::HTTP_OK);
            $response->setContent(json_encode($result));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }
        
        $response = new Response();
        $response->setStatusCode(Response::HTTP_NO_CONTENT);
        return $response;
    }



    /**
     * @Route("/api/authors/{id}/articles", name="authors_getAuthorsArticlesById")
     *
     */
    public function getAuthorsArticlesByIdAction(int $id)
    {
        $em = $this->getDoctrine()->getManager();

        $author = $em
            ->getRepository(Author::class)
            ->findOneBy([
                'id' => $id
            ]);

        if (!is_null($author)) {
            $result = [];
            foreach ($author->getArticles()->getValues() as $article) {
                $result[] = [
                    'id' => $article->getId(),
                    'title' => $article->getTitle(),
                    'text' => $article->getText(),
                    'date' => $article->getCreatedAt()->format('Y/m/d'),
                ];
            }
        
            $response = new Response();
            $response->setStatusCode(Response::HTTP_OK);
            $response->setContent(json_encode($result));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }

        $response = new Response();
        $response->setStatusCode(Response::HTTP_NO_CONTENT);
        return $response;
    }
}
