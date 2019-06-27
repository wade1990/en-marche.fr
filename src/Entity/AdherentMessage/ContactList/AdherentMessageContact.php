<?php

namespace AppBundle\Entity\AdherentMessage\ContactList;

use AppBundle\Entity\Adherent;
use AppBundle\Entity\ApplicationRequest\RunningMateRequest;
use AppBundle\Entity\ApplicationRequest\VolunteerRequest;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 */
class AdherentMessageContact
{
    /**
     * @var int
     *
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue
     */
    private $id;

    /**
     * @var AdherentMessageContactList
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\AdherentMessage\ContactList\AdherentMessageContactList", inversedBy="contacts")
     */
    private $list;

    /**
     * @var Adherent|null
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Adherent")
     */
    private $adherent;

    /**
     * @var RunningMateRequest|null
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ApplicationRequest\RunningMateRequest")
     */
    private $applicationRequestRunningMate;

    /**
     * @var VolunteerRequest|null
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ApplicationRequest\VolunteerRequest")
     */
    private $applicationRequestVolunteer;
}
