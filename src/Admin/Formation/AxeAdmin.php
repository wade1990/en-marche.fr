<?php

namespace AppBundle\Admin\Formation;

use AppBundle\Admin\MediaSynchronisedAdminTrait;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Form\Type\AdminType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class AxeAdmin extends AbstractAdmin
{
    use MediaSynchronisedAdminTrait;

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->with('Méta-données', ['class' => 'col-md-6'])
                ->add('path', null, [
                    'label' => 'Parcours',
                ])
                ->add('title', TextType::class, [
                    'label' => 'Titre',
                ])
                ->add('slug', TextType::class, [
                    'label' => 'URL',
                    'disabled' => true,
                    'help' => 'Généré automatiquement depuis le titre.',
                ])
                ->add('description', TextareaType::class, [
                    'label' => 'description',
                ])
            ->end()
            ->with('Média', ['class' => 'col-md-6'])
                ->add('media', AdminType::class, [
                    'label' => 'Image principale',
                    'required' => false,
                ])
                ->add('displayMedia', CheckboxType::class, [
                    'label' => 'Afficher l\'image principale',
                    'required' => false,
                ])
            ->end()
            ->with('Contenu', ['class' => 'col-md-12'])
                ->add('content', TextareaType::class, [
                    'label' => 'Contenu',
                    'required' => false,
                    'filter_emojis' => true,
                    'attr' => ['class' => 'content-editor', 'rows' => 20],
                ])
            ->end()
        ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('title', null, [
                'label' => 'Titre',
                'show_filter' => true,
            ])
        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('_thumbnail', null, [
                'label' => 'Image',
                'virtual_field' => true,
                'template' => 'admin/formation/list_image.html.twig',
            ])
            ->addIdentifier('title', null, [
                'label' => 'Titre',
            ])
            ->add('slug', null, [
                'label' => 'URL',
            ])
            ->add('modules', null, [
                'label' => 'Modules',
            ])
            ->add('_action', null, [
                'virtual_field' => true,
                'actions' => [
                    'edit' => [],
                    'delete' => [],
                ],
            ])
        ;
    }
}
