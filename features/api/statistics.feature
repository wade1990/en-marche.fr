@api
Feature:
  In order to get the acquisition statistics data
  I should be able to request them via the API

  Scenario:
    Given the following fixtures are loaded:
      | LoadClientData |
    And I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/acquisition?start-date=01-01-2018&end-date=31-03-2018&tags%5B%5D=CH"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON node "root" should have 21 elements
    And the JSON nodes should be equal to:
      | [0].title          | Adhérents (total)                                     |
      | [0].category       | Adhésion                                              |
      | [0].items[201801]  | @integer@                                             |
      | [0].items[201802]  | @integer@                                             |
      | [0].items[201803]  | @integer@                                             |
      | [1].title          | Adhérents (nouveaux)                                  |
      | [1].category       | Adhésion                                              |
      | [1].items[201801]  | @integer@                                             |
      | [1].items[201802]  | @integer@                                             |
      | [1].items[201803]  | @integer@                                             |
      | [2].title          | Desadhésions (nouveaux)                               |
      | [2].category       | Adhésion                                              |
      | [2].items[201801]  | @integer@                                             |
      | [2].items[201802]  | @integer@                                             |
      | [2].items[201803]  | @integer@                                             |
      | [3].title          | Comités (nouveaux)                                    |
      | [3].category       | Adhésion                                              |
      | [3].items[201801]  | @integer@                                             |
      | [3].items[201802]  | @integer@                                             |
      | [3].items[201803]  | @integer@                                             |
      | [4].title          | Comités en attente (nouveaux)                         |
      | [4].category       | Adhésion                                              |
      | [4].items[201801]  | @integer@                                             |
      | [4].items[201802]  | @integer@                                             |
      | [4].items[201803]  | @integer@                                             |
      | [5].title          | Adhérents membres de comités (total)                  |
      | [5].category       | Adhésion                                              |
      | [5].items[201801]  | @integer@                                             |
      | [5].items[201802]  | @integer@                                             |
      | [5].items[201803]  | @integer@                                             |
      | [6].title          | Ratio membre de comité par nbr adhérents (total)      |
      | [6].category       | Adhésion                                              |
      | [6].items[201801]  | @integer@                                             |
      | [6].items[201802]  | @integer@                                             |
      | [6].items[201803]  | @integer@                                             |
      | [7].title          | Événements (nouveaux)                                 |
      | [7].category       | Adhésion                                              |
      | [7].items[201801]  | @integer@                                             |
      | [7].items[201802]  | @integer@                                             |
      | [7].items[201803]  | @integer@                                             |
      | [8].title          | Inscrits à des événements (total)                     |
      | [8].category       | Adhésion                                              |
      | [8].items[201801]  | @integer@                                             |
      | [8].items[201802]  | @integer@                                             |
      | [8].items[201803]  | @integer@                                             |
      | [9].title          | Adhérents inscrits à des événements (total)           |
      | [9].category       | Adhésion                                              |
      | [9].items[201801]  | @integer@                                             |
      | [9].items[201802]  | @integer@                                             |
      | [9].items[201803]  | @integer@                                             |
      | [10].title         | Non-adhérents inscrits à des événements (total)       |
      | [10].category      | Adhésion                                              |
      | [10].items[201801] | @integer@                                             |
      | [10].items[201802] | @integer@                                             |
      | [10].items[201803] | @integer@                                             |
      | [11].title         | Inscrits à la liste globale (total)                   |
      | [11].category      | Inscriptions e-mails                                  |
      | [11].items[201801] | @integer@                                             |
      | [11].items[201802] | @integer@                                             |
      | [11].items[201803] | @integer@                                             |
      | [12].title         | Inscrits à la lettre du vendredi (total)              |
      | [12].category      | Inscriptions e-mails                                  |
      | [12].items[201801] | @integer@                                             |
      | [12].items[201802] | @integer@                                             |
      | [12].items[201803] | @integer@                                             |
      | [13].title         | Adhérents inscrits à la lettre du vendredi (total)    |
      | [13].category      | Inscriptions e-mails                                  |
      | [13].items[201801] | @integer@                                             |
      | [13].items[201802] | @integer@                                             |
      | [13].items[201803] | @integer@                                             |
      | [14].title         | Adhérents inscrits aux mails de leur référent (total) |
      | [14].category      | Inscriptions e-mails                                  |
      | [14].items[201801] | @integer@                                             |
      | [14].items[201802] | @integer@                                             |
      | [14].items[201803] | @integer@                                             |
      | [15].title         | Dons ponctuels (total)                                |
      | [15].category      | Dons                                                  |
      | [15].items[201801] | @integer@                                             |
      | [15].items[201802] | @integer@                                             |
      | [15].items[201803] | @integer@                                             |
      | [16].title         | Dons ponctuels par des adhérents (total)              |
      | [16].category      | Dons                                                  |
      | [16].items[201801] | @integer@                                             |
      | [16].items[201802] | @integer@                                             |
      | [16].items[201803] | @integer@                                             |
      | [17].title         | Montant dons ponctuels (total)                        |
      | [17].category      | Dons                                                  |
      | [17].items[201801] | @integer@                                             |
      | [17].items[201802] | @integer@                                             |
      | [17].items[201803] | @integer@                                             |
      | [18].title         | Dons mensuels (total)                                 |
      | [18].category      | Dons                                                  |
      | [18].items[201801] | @integer@                                             |
      | [18].items[201802] | @integer@                                             |
      | [18].items[201803] | @integer@                                             |
      | [19].title         | Dons mensuels par des adhérents (total)               |
      | [19].category      | Dons                                                  |
      | [19].items[201801] | @integer@                                             |
      | [19].items[201802] | @integer@                                             |
      | [19].items[201803] | @integer@                                             |
      | [20].title         | Montant dons mensuels (total)                         |
      | [20].category      | Dons                                                  |
      | [20].items[201801] | @integer@                                             |
      | [20].items[201802] | @integer@                                             |
      | [20].items[201803] | @integer@                                             |
