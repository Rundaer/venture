<?php

namespace App\Controller;

use App\Entity\Article;
use App\Form\ArticleFormType;
use App\Repository\AuthorRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ArticlesController extends AbstractController
{
    /**
     * @Route("/api/articles/", name="articles_get", methods={"GET"})
     */
    public function getAction()
    {
        $em = $this->getDoctrine()->getManager();

        $articles = $em
        ->getRepository(Article::class)
        ->findAll();
        if (!is_null($articles)) {
            $result = [];
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

        $response = new Response();
        $response->setStatusCode(Response::HTTP_NO_CONTENT);
        return $response;
    }

    /**
     * @Route("/api/articles/{id}", name="articles_getById", methods={"GET"})
     */
    public function getByIdAction(int $id)
    {
        $em = $this->getDoctrine()->getManager();
        $article = $em
            ->getRepository(Article::class)
            ->findOneBy([
                'id' => $id
            ]);

        if (!is_null($article)) {
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
        
        $response = new Response();
        $response->setStatusCode(Response::HTTP_NO_CONTENT);
        return $response;
    }

    /**
     * @Route("/articles/", name="articles_index", methods={"GET"})
     *
     * @return Response
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $articles = $em
            ->getRepository(Article::class)
            ->findAll();
      
        return $this->render('articles/index.html.twig', ["articles" => $articles]);
    }

    /**
     * @Route("/articles/add", name="articles_add", methods={"POST", "GET"})
     *
     * @param Request $request
     *
     * @return Response
     */
    public function addAction(Request $request, AuthorRepository $authorRepository)
    {
        $article = new Article();

        $form = $this->createForm(ArticleFormType::class, $article);

        if ($request->isMethod('post')) {
            $form->handleRequest($request);

            if ($form->isValid()) {
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($article);
                $entityManager->flush();

                $this->addFlash("success", "Article has been added");

                return $this->redirectToRoute("home_index");
            }

            $this->addFlash("error", "Article hasn't been added");
        }
        return $this->render('articles/add.html.twig', ["form" => $form->createView()]);
    }

    /**
     * @Route("/articles/edit/{id}", name="articles_edit", methods={"GET", "PUT"})
     *
     * @param Request $request
     * @param Auction $auction
     *
     * @return Response
     */
    public function editAction(Request $request, Article $article)
    {
        $form = $this->createForm(ArticleFormType::class, $article, [
            'method' => 'PUT'
        ]);

        if ($request->isMethod("put")) {
            $form->handleRequest($request);

            if ($form->isValid()) {
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($article);
                $entityManager->flush();
    
                $this->addFlash("success", "Article has been edited");
    
                return $this->redirectToRoute("articles_index");
            }

            $this->addFlash("error", "Article hasn't been edited");
        }

        return $this->render('articles/add.html.twig', ["form" => $form->createView()]);
    }
}
