@api
Feature:
  In order to get a turnkey projects
  As a non logged-in user
  I should be able to access API Turnkey projects

  Background:
    Given the following fixtures are loaded:
      | LoadTurnkeyProjectData  |

  Scenario: As a non logged-in user I can get approved turnkey projects count
    When I send a "GET" request to "/api/turnkey-projects/count"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | total | 4 |

  Scenario: As a non logged-in user I can get approved turnkey projects
    When I send a "GET" request to "/api/turnkey-projects"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | [0].category | Nature et Environnement                                                                                                                                      |
      | [0].title    | Stop mégots !                                                                                                                                                |
      | [0].slug     | stop-megots                                                                                                                                                  |
      | [0].subtitle | Campagnes de sensibilisation et de revalorisation des mégots jetés                                                                                           |
      | [0].solution | S'inscrivant dans la dynamique du Plan Climat, notre Projet vise à sensibiliser les consommateurs à jeter les mégots dans les contenants prévus à cet effet. |
      | [1].category | Culture                                                                                                                                                      |
      | [1].title    | Art's connection                                                                                                                                             |
      | [1].slug     | art-s-connection                                                                                                                                             |
      | [1].subtitle | Ateliers de rencontre autour de l'art                                                                                                                        |
      | [1].solution | Nous proposons d'organiser des ateliers d'art participatif associant des artistes aux citoyens                                                               |
      | [2].category | Lien social et aide aux personnes en difficulté                                                                                                              |
      | [2].title    | Cafés Citoyens                                                                                                                                               |
      | [2].slug     | cafes-citoyens                                                                                                                                               |
      | [2].subtitle | Citoyens de la Cité, vous avez des projets ? Nous vous aidons à les concrétiser!                                                                             |
      | [2].solution | Nous proposons de recréer un lieu de convivialité où il sera possible d'échanger, de débattre, de confronter ses idées autour d'une boisson chaude.          |
      | [3].category | Santé                                                                                                                                                        |
      | [3].title    | La santé pour tous !                                                                                                                                         |
      | [3].slug     | la-sante-pour-tous                                                                                                                                           |
      | [3].subtitle | Sensibilisation à la santé dans les écoles                                                                                                                   |
      | [3].solution | Le Projet consiste à faciliter l'organisation et la mise en œuvre du Service Sanitaire dans une ou plusieurs écoles                                          |

  Scenario: As a non logged-in user I can get a turnkey project
    When I send a "GET" request to "/api/turnkey-projects/la-sante-pour-tous"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | slug        | la-sante-pour-tous                                                                                                  |
      | title       | La santé pour tous !                                                                                                |
      | subtitle    | Sensibilisation à la santé dans les écoles                                                                          |
      | description | Les étudiants et professeurs d'université rencontrent des difficultés dans sa mise en œuvre locale.                 |
      | solution    | Le Projet consiste à faciliter l'organisation et la mise en œuvre du Service Sanitaire dans une ou plusieurs écoles |
      | video_id    | 7-aBc9deF_                                                                                                          |
      | category    | Santé                                                                                                               |
      | is_favorite | 1                                                                                                                   |

  Scenario: As a non logged-in user I can get a pinned turnkey project
    When I send a "GET" request to "/api/turnkey-projects/pinned"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | slug        | stop-megots                                                                                                                                                  |
      | title       | Stop mégots !                                                                                                                                                |
      | subtitle    | Campagnes de sensibilisation et de revalorisation des mégots jetés                                                                                           |
      | description | Les mégots sont jetés en abondance dans la rue.                                                                                                             |
      | solution    | S'inscrivant dans la dynamique du Plan Climat, notre Projet vise à sensibiliser les consommateurs à jeter les mégots dans les contenants prévus à cet effet. |
      | category    | Nature et Environnement                                                                                                                                      |
      | is_favorite | 0                                                                                                                                                            |
