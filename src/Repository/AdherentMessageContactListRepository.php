<?php

namespace AppBundle\Repository;

use AppBundle\Entity\Adherent;
use AppBundle\Entity\AdherentMessage\ContactList\AdherentMessageContactList;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

class AdherentMessageContactListRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, AdherentMessageContactList::class);
    }

    public function findOneByOwner(Adherent $adherent): ?AdherentMessageContactList
    {
        return $this->createQueryBuilder('list')
            ->addSelect('contact')
            ->leftJoin('list.contacts', 'contact')
            ->where('list.owner = :owner')
            ->setParameter('owner', $adherent)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
}
