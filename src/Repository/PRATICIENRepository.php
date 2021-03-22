<?php

namespace App\Repository;

use App\Entity\praticien;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method PRATICIEN|null find($id, $lockMode = null, $lockVersion = null)
 * @method PRATICIEN|null findOneBy(array $criteria, array $orderBy = null)
 * @method PRATICIEN[]    findAll()
 * @method PRATICIEN[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PRATICIENRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, praticien::class);
    }

    // /**
    //  * @return PRATICIEN[] Returns an array of PRATICIEN objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?PRATICIEN
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
