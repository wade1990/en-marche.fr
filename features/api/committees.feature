@api
Feature:
  In order to get committees' information
  As a referent
  I should be able to acces committees API data

  Background:
    Given I freeze the clock to "2018-04-15"
    And the following fixtures are loaded:
      | LoadUserData                        |
      | LoadAdherentData                    |
      | LoadEventData                       |
      | LoadCommitteeMembershipHistoryData  |
      | LoadClientData                      |

  Scenario: As a non logged-in user I can not access the committee supervisors count managed by referent information
    When I am on "/api/statistics/committees/count-for-referent-area"
    Then the response status code should be 401

  Scenario: As an adherent I can not access the committee supervisors count managed by referent information
    When I am logged as "jacques.picard@en-marche.fr"
    And I am on "/api/statistics/committees/count-for-referent-area"
    Then the response status code should be 401

  Scenario: As a referent I can access the committee supervisors count managed by referent information
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/count-for-referent-area?referent=referent@en-marche-dev.fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committees         | 4 |
      | members.female     | 1 |
      | members.male       | 5 |
      | members.total      | 6 |
      | supervisors.female | 1 |
      | supervisors.male   | 2 |
      | supervisors.total  | 3 |

  Scenario: As a non logged-in user I can not get the most active committees in referent managed zone
    When I am on "/api/statistics/committees/top-5-in-referent-area"
    Then the response status code should be 401

  Scenario: As an adherent I can not get the most active committees in referent managed zone
    When I am logged as "jacques.picard@en-marche.fr"
    And I am on "/api/statistics/committees/top-5-in-referent-area"
    Then the response status code should be 401

  Scenario: As a referent I can get the most active committees in referent managed zone
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/top-5-in-referent-area?referent=referent@en-marche-dev.fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | most_active[0].name    | En Marche Dammarie-les-Lys         |
      | most_active[0].events  | 1                                  |
      | most_active[1].name    | Antenne En Marche de Fontainebleau |
      | most_active[1].events  | 1                                  |
      | most_active[2].name    | En Marche - Suisse                 |
      | most_active[2].events  | 1                                  |
      | least_active[0].name   | En Marche - Suisse                 |
      | least_active[0].events | 1                                  |
      | least_active[1].name   | Antenne En Marche de Fontainebleau |
      | least_active[1].events | 1                                  |
      | least_active[2].name   | En Marche Dammarie-les-Lys         |
      | least_active[2].events | 1                                  |

  Scenario: As a non logged-in user I can not get the committee members count in referent managed zone
    When I am on "/api/statistics/committees/members/count-by-month"
    Then the response status code should be 401

  Scenario: As an adherent I can not get the committee members count in referent managed zone
    When I am logged as "jacques.picard@en-marche.fr"
    And I am on "/api/statistics/committees/members/count-by-month"
    Then the response status code should be 401

  Scenario: As a referent I can get the committee members count in referent managed zone
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 3       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 3       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 2       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 2       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 2       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 2       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr&country=fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 3       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 3       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 2       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 2       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 2       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 2       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr&country=ch"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 0       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 0       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 0       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 0       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 0       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 0       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr&city=Paris%208e"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 2       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 2       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 1       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 1       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 1       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 1       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr&city=Dammarie-les-Lys"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 1       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 1       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 1       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 1       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 1       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 1       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr&committee=515a56c0-bde8-56ef-b90c-4745b1c93818"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 2       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 2       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 1       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 1       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 1       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 1       |

    # Test get stats for committee with scheduled events but not managed by referent
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/committees/members/count-by-month?referent=referent-75-77@en-marche-dev.fr&committee=b0cd0e52-a5a4-410b-bba3-37afdd326a0a"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committee_members[0].date  | 2018-04 |
      | committee_members[0].count | 1       |
      | committee_members[1].date  | 2018-03 |
      | committee_members[1].count | 1       |
      | committee_members[2].date  | 2018-02 |
      | committee_members[2].count | 1       |
      | committee_members[3].date  | 2018-01 |
      | committee_members[3].count | 1       |
      | committee_members[4].date  | 2017-12 |
      | committee_members[4].count | 1       |
      | committee_members[5].date  | 2017-11 |
      | committee_members[5].count | 1       |

  Scenario: As a logged-in user I can see the list of my committees
    Given I am logged as "jacques.picard@en-marche.fr"
    And I send a "GET" request to "/api/committees/me"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | [0].uuid | 515a56c0-bde8-56ef-b90c-4745b1c93818 |
      | [0].name | En Marche Paris 8                    |
      | [0].slug | en-marche-paris-8                    |
      | [1].uuid | b0cd0e52-a5a4-410b-bba3-37afdd326a0a |
      | [1].name | En Marche Dammarie-les-Lys           |
      | [1].slug | en-marche-dammarie-les-lys           |
      | [2].uuid | d648d486-fbb3-4394-b4b3-016fac3658af |
      | [2].name | Antenne En Marche de Fontainebleau   |
      | [2].slug | antenne-en-marche-de-fontainebleau   |
      | [3].uuid | 464d4c23-cf4c-4d3a-8674-a43910da6419 |
      | [3].name | En Marche - Comité de Évry           |
      | [3].slug | en-marche-comite-de-evry             |
      | [4].uuid | 508d4ac0-27d6-4635-8953-4cc8600018f9 |
      | [4].name | En Marche - Comité de Rouen          |
      | [4].slug | en-marche-comite-de-rouen            |
      | [5].uuid | 40b6e2e5-2499-438b-93ab-ef08860a1845 |
      | [5].name | En Marche - Comité de Berlin         |
      | [5].slug | en-marche-comite-de-berlin           |
      | [6].uuid | 93b72179-7d27-40c4-948c-5188aaf264b6 |
      | [6].name | En Marche - Comité de Singapour      |
      | [6].slug | en-marche-comite-de-singapour        |
      | [7].uuid | 62ea97e7-6662-427b-b90a-23429136d0dd |
      | [7].name | En Marche - Comité de New York City  |
      | [7].slug | en-marche-comite-de-new-york-city    |
