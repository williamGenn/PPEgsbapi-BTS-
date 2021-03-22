<?php

namespace App\Repository;

use App\Entity\typePraticien;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TYPEPRATICIEN|null find($id, $lockMode = null, $lockVersion = null)
 * @method TYPEPRATICIEN|null findOneBy(array $criteria, array $orderBy = null)
 * @method TYPEPRATICIEN[]    findAll()
 * @method TYPEPRATICIEN[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TYPEPRATICIENRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, typePraticien::class);
    }

    // /**
    //  * @return TYPEPRATICIEN[] Returns an array of TYPEPRATICIEN objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TYPEPRATICIEN
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
