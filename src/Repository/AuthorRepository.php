<?php

namespace App\Repository;

use App\Entity\Author;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Author|null find($id, $lockMode = null, $lockVersion = null)
 * @method Author|null findOneBy(array $criteria, array $orderBy = null)
 * @method Author[]    findAll()
 * @method Author[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AuthorRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Author::class);
    }

    public function findTheBestOnes($startDate = null, $endDate = null, $limit = null)
    {
        
        //base
        $conn = $this->getEntityManager()->getConnection();
        $sql = "SELECT aut.id, aut.name, count(aut.id) number_of_articles FROM article_author aa
            JOIN article art ON aa.article_id = art.id
            JOIN author aut ON aa.author_id = aut.id";

        //select by date
        if (!is_null($startDate)) {
            $sql .= " WHERE art.created_at > '$startDate'";
            if (is_null($endDate)) {
                $endDate = new DateTime('now');
                $date = str_replace("\"", "'", $endDate->format('Y-m-d')) ;
                $sql .= " AND art.created_at < '$date' ";
            } else {
                $sql .= " AND art.created_at < '$endDate' ";
            }
        }

        
        $sql .= "GROUP BY aut.id ORDER BY number_of_articles DESC ";

        // select with limit
        if (!is_null($limit)) {
            $sql .= "LIMIT $limit ";
        }

        $stmt = $conn->prepare($sql);

        $stmt->execute();

        // returns an array of arrays (i.e. a raw data set)
        return $stmt->fetchAll();
    }
}
