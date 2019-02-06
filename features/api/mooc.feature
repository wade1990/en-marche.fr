@api
Feature:
  In order to get a Mooc configuration
  As a non logged-in user
  I should be able to access API Mooc

  Background:
    Given the following fixtures are loaded:
      | LoadMoocData        |
      | LoadMoocChapterData |
      | LoadMoocVideoData   |
      | LoadMoocQuizData    |

  Scenario: As a non logged-in user I can get the MOOC landing page configuration
    When I am on "/api/mooc"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | [0].chapter_count | 2                                                                                 |
      | [0].title         | Faire de sa fourchette un acte politique                                          |
      | [0].description   | Description du MOOC, faire de sa fourchette un acte politique                     |
      | [0].slug          | faire-de-sa-fourchette-un-acte-politique                                          |
      | [0].image         | https://img.youtube.com/vi/ktHEfEDhscU/0.jpg                                      |
      | [1].chapter_count | 0                                                                                 |
      | [1].title         | La Rentrée des Territoires                                                        |
      | [1].description   | Description du MOOC, la Rentrée des Territoires                                   |
      | [1].slug          | la-rentree-des-territoires                                                        |
      | [1].image         | http://test.enmarche.code/assets/images/mooc/41a496d8ef383c1e9248f2994285593c.png |

  Scenario: As a non logged-in user I can get MOOC configuration
    When I am on "/api/mooc/faire-de-sa-fourchette-un-acte-politique"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | title                         | Faire de sa fourchette un acte politique                                                                |
      | slug                          | faire-de-sa-fourchette-un-acte-politique                                                                |
      | content                       | <strong>Lorem ipsum</strong> dolor sit amet, consectetur adipiscing elit.                               |
      | youtubeId                     | ktHEfEDhscU                                                                                             |
      | youtubeThumbnail              | https://img.youtube.com/vi/ktHEfEDhscU/0.jpg                                                            |
      | youtubeDuration               | 00:02:10                                                                                                |
      | shareTwitterText              | Bonsoir, voici un tweet de partage d'un MOOC #enmarche                                                  |
      | shareFacebookText             | Bonsoir, voici un partage avec Facebook                                                                 |
      | shareEmailSubject             | Bonsoir, voici un email de partage !                                                                    |
      | shareEmailBody                | Voici le contenu de l'email de partage. Merci.                                                          |
      | elements[0].type              | chapter                                                                                                 |
      | elements[0].title             | Semaine 1 : Le coup de fourchette pour détendre notre santé                                             |
      | elements[0].slug              | semaine-1-le-coup-de-fourchette-pour-detendre-notre-sante                                               |
      | elements[0].publishedAt       | @string@.isDateTime()                                                                                   |
      | elements[1].type              | video                                                                                                   |
      | elements[1].title             | Les produits transformés dans une première vidéo                                                        |
      | elements[1].slug              | les-produits-transformes-dans-une-premiere-video                                                        |
      | elements[1].content           | Lorem ipsum dolor sit amet, consectetur adipiscing elit.                                                |
      | elements[1].shareTwitterText  | Bonsoir, voici un tweet de partage d'un MOOC #enmarche                                                  |
      | elements[1].shareFacebookText | Bonsoir, voici un partage avec Facebook                                                                 |
      | elements[1].shareEmailSubject | Bonsoir, voici un email de partage !                                                                    |
      | elements[1].shareEmailBody    | Voici le contenu de l'email de partage. Merci.                                                          |
      | elements[1].links[0].linkName | Site officiel de La République En Marche                                                                |
      | elements[1].links[0].linkUrl  | http://www.en-marche.fr                                                                                 |
      | elements[1].links[1].linkName | Les sites départementaux de La République En Marche                                                     |
      | elements[1].links[1].linkUrl  | http://dpt.en-marche.fr                                                                                 |
      | elements[1].youtubeId         | ktHEfEDhscU                                                                                             |
      | elements[1].youtubeThumbnail  | https://img.youtube.com/vi/ktHEfEDhscU/0.jpg                                                            |
      | elements[1].duration          | 00:02:10                                                                                                |
      | elements[2].type              | video                                                                                                   |
      | elements[2].title             | Les produits transformés dans une deuxième vidéo                                                        |
      | elements[2].slug              | les-produits-transformes-dans-une-deuxieme-video                                                        |
      | elements[2].content           | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et. |
      | elements[2].shareTwitterText  | Bonsoir, voici un tweet de partage d'un MOOC #enmarche                                                  |
      | elements[2].shareFacebookText | Bonsoir, voici un partage avec Facebook                                                                 |
      | elements[2].shareEmailSubject | Bonsoir, voici un email de partage !                                                                    |
      | elements[2].shareEmailBody    | Voici le contenu de l'email de partage. Merci.                                                          |
      | elements[2].youtubeId         | ktHEfEDhscU                                                                                             |
      | elements[2].youtubeThumbnail  | https://img.youtube.com/vi/ktHEfEDhscU/0.jpg                                                            |
      | elements[2].duration          | 01:30:00                                                                                                |
      | elements[3].type              | quiz                                                                                                    |
      | elements[3].title             | Le test de votre vie                                                                                    |
      | elements[3].slug              | le-test-de-votre-vie                                                                                    |
      | elements[3].content           | <p>une description</p>                                                                                  |
      | elements[3].shareTwitterText  | Bonsoir, voici un tweet de partage d'un MOOC #enmarche                                                  |
      | elements[3].shareFacebookText | Bonsoir, voici un partage avec Facebook                                                                 |
      | elements[3].shareEmailSubject | Bonsoir, voici un email de partage !                                                                    |
      | elements[3].shareEmailBody    | Voici le contenu de l'email de partage. Merci.                                                          |
      | elements[3].typeformUrl       | https://developerplatform.typeform.com/to/Xc7NMh                                                        |
      | elements[4].type              | chapter                                                                                                 |
      | elements[4].title             | Semaine 2 : Le coup de fourchette pour défendre la nature                                               |
      | elements[4].slug              | semaine-2-le-coup-de-fourchette-pour-defendre-la-nature                                                 |
      | elements[4].publishedAt       | @string@.isDateTime()                                                                                   |

  Scenario: As a non logged-in user I can get the MOOC sitemap
    When I am on "/api/mooc/sitemap.xml"
    Then the response status code should be 200
    And the response should be in XML
    And the XML element "//urlset" should have 5 element
    And the XML element "//url[1]/loc" should be equal to "http://mooc.enmarche.code/la-rentree-des-territoires"
    And the XML element "//url[1]/changefreq" should be equal to "monthly"
    And the XML element "//url[1]/priority" should be equal to "0.1"
    And the XML element "//url[2]/loc" should be equal to "http://mooc.enmarche.code/faire-de-sa-fourchette-un-acte-politique"
    And the XML element "//url[3]/loc" should be equal to "http://mooc.enmarche.code/faire-de-sa-fourchette-un-acte-politique/les-produits-transformes-dans-une-premiere-video"
    And the XML element "//url[4]/loc" should be equal to "http://mooc.enmarche.code/faire-de-sa-fourchette-un-acte-politique/les-produits-transformes-dans-une-deuxieme-video"
    And the XML element "//url[5]/loc" should be equal to "http://mooc.enmarche.code/faire-de-sa-fourchette-un-acte-politique/le-test-de-votre-vie"
