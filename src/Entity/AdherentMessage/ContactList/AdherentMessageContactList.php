<?php

namespace AppBundle\Entity\AdherentMessage\ContactList;

use AppBundle\Entity\Adherent;
use AppBundle\Entity\EntityIdentityTrait;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 */
class AdherentMessageContactList
{
    use EntityIdentityTrait;

    /**
     * @var Adherent
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Adherent")
     */
    private $owner;

    /**
     * @var string|null
     *
     * @ORM\Column
     */
    private $label;

    /**
     * @var string|null
     *
     * @ORM\Column(type="integer", nullable=true)
     */
    private $mailchimpId;

    /**
     * @var Collection|AdherentMessageContact[]
     *
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\AdherentMessage\ContactList\AdherentMessageContact", mappedBy="list")
     */
    private $contacts;

    public function __construct(Adherent $owner, ?string $label)
    {
        $this->owner = $owner;
        $this->label = $label;
    }
}
