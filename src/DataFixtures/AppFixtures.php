<?php

namespace App\DataFixtures;

use App\Entity\Article;
use App\Entity\Author;
use DateTime;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $numberOfAuthors = 5;
        $numberOfPosts = 30;

        $authors = [];

        for ($i = 0; $i < $numberOfAuthors; $i++) {
            $author = new Author();
            $nameGenerator = new \Nubs\RandomNameGenerator\Vgng();
            $author->setName($nameGenerator->getName());
            $manager->persist($author);
            $authors[] = $author;
        }

        for ($i = 0; $i < $numberOfPosts; $i++) {
            $article = new Article();
            $rand = rand(0, count($authors)-1);
            $date = $this->randomDateInRange(new DateTime('2019-01-01'), new DateTime());
            
            $loremGenerator = new \Badcow\LoremIpsum\Generator();
            $article->setText(implode(" ", $loremGenerator->getSentences(5)));
            $article->setTitle(implode(" ", $loremGenerator->getSentences(1)));
            $article->setCreatedAt($date);
            $article->setAuthor($authors[$rand]);
            $manager->persist($article);
        }
        $manager->flush();
    }

    private function randomDateInRange(DateTime $start, DateTime $end)
    {
        $randomTimestamp = mt_rand($start->getTimestamp(), $end->getTimestamp());
        $randomDate = new DateTime();
        $randomDate->setTimestamp($randomTimestamp);
        return $randomDate;
    }
}
