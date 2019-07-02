<?php

namespace AppBundle\Controller\EnMarche;

use AppBundle\Address\GeoCoder;
use AppBundle\Controller\CanaryControllerTrait;
use AppBundle\Entity\Adherent;
use AppBundle\Entity\ApplicationRequest\ApplicationRequest;
use AppBundle\Entity\ApplicationRequest\RunningMateRequest;
use AppBundle\Entity\ApplicationRequest\VolunteerRequest;
use AppBundle\Entity\MunicipalChiefManagedArea;
use AppBundle\Event\EventCommand;
use AppBundle\Event\EventCommandHandler;
use AppBundle\Event\EventRegistrationCommand;
use AppBundle\Event\EventRegistrationCommandHandler;
use AppBundle\Form\ApplicationRequest\ApplicationRequestTagsType;
use AppBundle\Form\EventCommandType;
use AppBundle\Referent\ManagedEventsExporter;
use AppBundle\Repository\AdherentRepository;
use AppBundle\Repository\ApplicationRequest\RunningMateRequestRepository;
use AppBundle\Repository\ApplicationRequest\VolunteerRequestRepository;
use AppBundle\Repository\EventRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @Route(
 *     path="/espace-chef-municipal",
 *     name="app_municipal_chief_"
 * )
 * @Security("is_granted('ROLE_MUNICIPAL_CHIEF')")
 */
class MunicipalChiefController extends Controller
{
    use CanaryControllerTrait;

    /**
     * @Route(
     *     path="/municipale/candidature-colistiers",
     *     name="municipal_running_mate_request",
     *     methods={"GET"},
     * )
     */
    public function municipalRunningMateRequestAction(
        RunningMateRequestRepository $runningMateRequestRepository,
        UserInterface $municipalChief
    ): Response {
        $this->disableInProduction();

        return $this->render('municipal_chief/municipal/running_mate/list.html.twig', [
            'running_mates' => $runningMateRequestRepository->findForMunicipalChief($municipalChief),
        ]);
    }

    /**
     * @Route(
     *     path="/municipale/candidature-benevole",
     *     name="municipal_volunteer_request",
     *     methods={"GET"},
     * )
     */
    public function municipalVolunteerAction(
        VolunteerRequestRepository $volunteerRequestRepository,
        UserInterface $municipalChief
    ): Response {
        $this->disableInProduction();

        return $this->render('municipal_chief/municipal/volunteer/list.html.twig', [
            'volunteers' => $volunteerRequestRepository->findForMunicipalChief($municipalChief),
        ]);
    }

    /**
     * @Route(
     *     path="/municipale/candidature-colistiers/{uuid}/detail",
     *     name="municipal_running_mate_request_detail",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', runningMateRequest)")
     */
    public function municipalRunningMateDetailAction(RunningMateRequest $runningMateRequest): Response
    {
        $this->disableInProduction();

        return $this->render('municipal_chief/municipal/running_mate/detail.html.twig', [
            'runningMateRequest' => $runningMateRequest,
        ]);
    }

    /**
     * @Route(
     *     path="/municipale/candidature-benevole/{uuid}/detail",
     *     name="municipal_volunteer_request_detail",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', volunteerRequest)")
     */
    public function municipalVolunteerDetailAction(VolunteerRequest $volunteerRequest): Response
    {
        $this->disableInProduction();

        return $this->render('municipal_chief/municipal/volunteer/detail.html.twig', [
            'volunteerRequest' => $volunteerRequest,
        ]);
    }

    /**
     * @Route(
     *     path="/municipale/candidature-benevole/{uuid}/ajouter-a-mon-equipe",
     *     name="municipal_volunteer_request_add_to_team",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', volunteerRequest)")
     */
    public function municipalVolunteerAddToTeamAction(
        ObjectManager $objectManager,
        UserInterface $municipalChief,
        VolunteerRequest $volunteerRequest
    ): Response {
        $this->disableInProduction();

        $this->addToTeam($objectManager, $volunteerRequest, $municipalChief->getMunicipalChiefManagedArea());

        return $this->redirectToRoute('app_municipal_chief_municipal_volunteer_request');
    }

    /**
     * @Route(
     *     path="/municipale/candidature-benevole/{uuid}/retirer-de-mon-equipe",
     *     name="municipal_volunteer_request_remove_from_team",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', volunteerRequest)")
     */
    public function municipalVolunteerRemoveFromTeamAction(
        ObjectManager $objectManager,
        UserInterface $municipalChief,
        VolunteerRequest $volunteerRequest
    ): Response {
        $this->disableInProduction();

        $this->removeFromTeam($objectManager, $volunteerRequest, $municipalChief->getMunicipalChiefManagedArea());

        return $this->redirectToRoute('app_municipal_chief_municipal_volunteer_request');
    }

    /**
     * @Route(
     *     path="/municipale/candidature-colistiers/{uuid}/ajouter-a-mon-equipe",
     *     name="municipal_running_mate_request_add_to_team",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', runningMateRequest)")
     */
    public function municipalRunningMateAddToTeamAction(
        ObjectManager $objectManager,
        UserInterface $municipalChief,
        RunningMateRequest $runningMateRequest
    ): Response {
        $this->disableInProduction();

        $this->addToTeam($objectManager, $runningMateRequest, $municipalChief->getMunicipalChiefManagedArea());

        return $this->redirectToRoute('app_municipal_chief_municipal_running_mate_request');
    }

    /**
     * @Route(
     *     path="/municipale/candidature-colistiers/{uuid}/retirer-de-mon-equipe",
     *     name="municipal_running_mate_request_remove_from_team",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', runningMateRequest)")
     */
    public function municipalRunningMateRemoveFromTeamAction(
        ObjectManager $objectManager,
        UserInterface $municipalChief,
        RunningMateRequest $runningMateRequest
    ): Response {
        $this->disableInProduction();

        $this->removeFromTeam($objectManager, $runningMateRequest, $municipalChief->getMunicipalChiefManagedArea());

        return $this->redirectToRoute('app_municipal_chief_municipal_running_mate_request');
    }

    /**
     * @Route(
     *     path="/municipale/candidature-colistiers/{uuid}/editer-tags",
     *     name="municipal_running_mate_request_edit_tags",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET", "POST"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', runningMateRequest)")
     */
    public function municipalRunningMateEditTagsAction(
        ObjectManager $objectManager,
        Request $request,
        RunningMateRequest $runningMateRequest
    ): Response {
        $this->disableInProduction();

        return $this->handleApplicationRequestTagsRequest(
            $objectManager,
            $request,
            $runningMateRequest,
            'municipal_chief/municipal/running_mate/edit_tags.html.twig',
            'app_municipal_chief_municipal_running_mate_request'
        );
    }

    /**
     * @Route(
     *     path="/municipale/candidature-benevole/{uuid}/editer-tags",
     *     name="municipal_volunteer_request_edit_tags",
     *     requirements={
     *         "uuid": "%pattern_uuid%",
     *     },
     *     methods={"GET", "POST"},
     * )
     *
     * @Security("is_granted('MUNICIPAL_CHIEF_OF', volunteerRequest)")
     */
    public function municipalVolunteerEditTagsAction(
        ObjectManager $objectManager,
        Request $request,
        VolunteerRequest $volunteerRequest
    ): Response {
        $this->disableInProduction();

        return $this->handleApplicationRequestTagsRequest(
            $objectManager,
            $request,
            $volunteerRequest,
            'municipal_chief/municipal/volunteer/edit_tags.html.twig',
            'app_municipal_chief_municipal_volunteer_request'
        );
    }

    /**
     * @Route("/evenements", name="events", methods={"GET"})
     */
    public function eventsAction(EventRepository $eventRepository, ManagedEventsExporter $eventsExporter): Response
    {
        return $this->render('municipal_chief/events_list.html.twig', [
            'managedEventsJson' => $eventsExporter->exportAsJson(
                $eventRepository->findEventsByOrganizer($this->getUser())
            ),
        ]);
    }

    /**
     * @Route("/evenements/creer", name="events_create", methods={"GET", "POST"})
     */
    public function eventsCreateAction(
        Request $request,
        GeoCoder $geoCoder,
        EventCommandHandler $eventCommandHandler,
        EventRegistrationCommandHandler $eventRegistrationCommandHandler,
        UserInterface $user
    ): Response {
        /** @var Adherent $user */
        $command = new EventCommand($user);
        $command->setTimeZone($geoCoder->getTimezoneFromIp($request->getClientIp()));

        $form = $this->createForm(EventCommandType::class, $command);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $event = $eventCommandHandler->handle($command);

            $registrationCommand = new EventRegistrationCommand($event, $this->getUser());
            $eventRegistrationCommandHandler->handle($registrationCommand);

            $this->addFlash('success', true);

            return $this->render('municipal_chief/event_create.html.twig', [
                'event' => $event,
            ]);
        }

        return $this->render('municipal_chief/event_create.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    private function addToTeam(
        ObjectManager $objectManager,
        ApplicationRequest $applicationRequest,
        MunicipalChiefManagedArea $municipalChiefManagedArea
    ): void {
        $cities = array_intersect(
            $municipalChiefManagedArea->getCodes(),
            $applicationRequest->getFavoriteCities()
        );
        if (!$applicationRequest->getTakenForCity() && !empty($city = reset($cities))) {
            $applicationRequest->setTakenForCity($city);
            $objectManager->flush();
        }
    }

    private function removeFromTeam(
        ObjectManager $objectManager,
        ApplicationRequest $applicationRequest,
        MunicipalChiefManagedArea $municipalChiefManagedArea
    ): void {
        if ($applicationRequest->getTakenForCity() && \in_array($applicationRequest->getTakenForCity(), $municipalChiefManagedArea->getCodes())) {
            $applicationRequest->setTakenForCity(null);
            $objectManager->flush();
        }
    }

    private function handleApplicationRequestTagsRequest(
        ObjectManager $objectManager,
        Request $request,
        ApplicationRequest $applicationRequest,
        string $view,
        string $redirectRoute
    ): Response {
        $form = $this
            ->createForm(ApplicationRequestTagsType::class, $applicationRequest)
            ->handleRequest($request)
        ;

        if ($form->isSubmitted() && $form->isValid()) {
            $objectManager->flush();

            return $this->redirectToRoute($redirectRoute);
        }

        return $this->render($view, [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route(path="/adherents", name="adherents_list", methods={"GET"})
     */
    public function adherentsListAction(
        Request $request,
        UserInterface $municipalChief,
        AdherentRepository $adherentRepository
    ): Response {
        $this->disableInProduction();

        return $this->render('municipal_chief/adherent/list.html.twig', [
            'results' => $adherentRepository->findPaginatedForInseeCodes(
                $municipalChief->getMunicipalChiefManagedArea()->getCodes(),
                $request->query->getInt('page')
            ),
        ]);
    }
}
