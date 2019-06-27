<?php

namespace AppBundle\Controller\EnMarche\AdherentMessage;

use AppBundle\AdherentMessage\StatisticsAggregator;
use AppBundle\Entity\Adherent;
use AppBundle\Entity\AdherentMessage\AbstractAdherentMessage;
use AppBundle\Entity\AdherentMessage\ContactList\AdherentMessageContactList;
use AppBundle\Mailchimp\Manager;
use AppBundle\Repository\AdherentMessageContactListRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @Route(path="/adherent-message", name="app_message_common_")
 *
 * @Security("is_granted('ROLE_MESSAGE_REDACTOR')")
 */
class CommonMessageController extends AbstractController
{
    /**
     * @Route("/{uuid}/statistics", requirements={"uuid": "%pattern_uuid%"}, condition="request.isXmlHttpRequest()", name="statistics", methods={"GET"})
     *
     * @Security("is_granted('IS_AUTHOR_OF', message)")
     */
    public function getStatisticsAction(AbstractAdherentMessage $message, StatisticsAggregator $aggregator): Response
    {
        return $this->json($aggregator->aggregateData($message));
    }

    /**
     * @Route("/{uuid}/content", requirements={"uuid": "%pattern_uuid%"}, name="content", methods={"GET"})
     *
     * @Security("is_granted('IS_AUTHOR_OF', message)")
     */
    public function getMessageTemplateAction(AbstractAdherentMessage $message, Manager $manager): Response
    {
        return new Response($manager->getCampaignContent(current($message->getMailchimpCampaigns())));
    }

    /**
     * @Route("/creer-contact-liste", name="contact_list_create", methods={"GET"})
     *
     * @param Adherent|UserInterface $adherent
     */
    public function contactListShowAction(
        UserInterface $adherent,
        ObjectManager $manager,
        AdherentMessageContactListRepository $repository
    ): Response {
        if ($repository->findOneByOwner($adherent)) {
            $this->createNotFoundException();
        }

        $manager->persist(new AdherentMessageContactList($adherent, 'default'));

        $this->addFlash('info', 'adherent_message.contact_list.created_successfully');

        return $this->redirectToRoute();
    }
}
