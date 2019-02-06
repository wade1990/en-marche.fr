@api
Feature:
  In order to get events count in the
  As a client passing a referent email
  I should be able to access events API stats

  Background:
    Given I freeze the clock to "2018-05-18"
    And the following fixtures are loaded:
      | LoadUserData          |
      | LoadAdherentData      |
      | LoadEventData         |
      | LoadCitizenActionData |
      | LoadClientData        |

  Scenario: As a non logged-in user I can not get events count in the referent managed zone
    When I am on "/api/statistics/events/count"
    Then the response status code should be 401

  Scenario Outline: As an adherent I can not get events count in the referent managed zone
    When I am logged as "jacques.picard@en-marche.fr"
    And I am on "<url>"
    Then the response status code should be 401

    Examples:
      | url                            |
      | /api/statistics/events/count              |
      | /api/statistics/events/count-by-month     |
      | /api/statistics/events/count-participants |

  Scenario: As a client passing a referent email I can get events count in the referent managed zone
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count?referent=referent-75-77@en-marche-dev.fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | current_total            | 4       |
      | events[0].date           | 2018-05 |
      | events[0].count          | 3       |
      | events[1].date           | 2018-04 |
      | events[1].count          | 2       |
      | events[2].date           | 2018-03 |
      | events[2].count          | 0       |
      | events[3].date           | 2018-02 |
      | events[3].count          | 0       |
      | events[4].date           | 2018-01 |
      | events[4].count          | 0       |
      | events[5].date           | 2017-12 |
      | events[5].count          | 0       |
      | referent_events[0].date  | 2018-05 |
      | referent_events[0].count | 1       |
      | referent_events[1].date  | 2018-04 |
      | referent_events[1].count | 0       |
      | referent_events[2].date  | 2018-03 |
      | referent_events[2].count | 0       |
      | referent_events[3].date  | 2018-02 |
      | referent_events[3].count | 0       |
      | referent_events[4].date  | 2018-01 |
      | referent_events[4].count | 0       |
      | referent_events[5].date  | 2017-12 |
      | referent_events[5].count | 0       |

  Scenario: As a non logged-in user I can not get events count in the referent managed zone
    When I am on "/api/statistics/events/count-by-month?country=fr"
    Then the response status code should be 401

  Scenario:  As a client passing a referent email I can get events count in the referent managed zone
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-by-month?referent=referent-75-77@en-marche-dev.fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | events[0].date              | 2018-05 |
      | events[0].count             | 3       |
      | events[1].date              | 2018-04 |
      | events[1].count             | 2       |
      | events[2].date              | 2018-03 |
      | events[2].count             | 0       |
      | events[3].date              | 2018-02 |
      | events[3].count             | 0       |
      | events[4].date              | 2018-01 |
      | events[4].count             | 0       |
      | events[5].date              | 2017-12 |
      | events[5].count             | 0       |
      | event_participants[0].date  | 2018-05 |
      | event_participants[0].count | 5       |
      | event_participants[1].date  | 2018-04 |
      | event_participants[1].count | 4       |
      | event_participants[2].date  | 2018-03 |
      | event_participants[2].count | 0       |
      | event_participants[3].date  | 2018-02 |
      | event_participants[3].count | 0       |
      | event_participants[4].date  | 2018-01 |
      | event_participants[4].count | 0       |
      | event_participants[5].date  | 2017-12 |
      | event_participants[5].count | 0       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-by-month?referent=referent-75-77@en-marche-dev.fr&country=fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | events[0].date              | 2018-05 |
      | events[0].count             | 3       |
      | events[1].date              | 2018-04 |
      | events[1].count             | 2       |
      | events[2].date              | 2018-03 |
      | events[2].count             | 0       |
      | events[3].date              | 2018-02 |
      | events[3].count             | 0       |
      | events[4].date              | 2018-01 |
      | events[4].count             | 0       |
      | events[5].date              | 2017-12 |
      | events[5].count             | 0       |
      | event_participants[0].date  | 2018-05 |
      | event_participants[0].count | 5       |
      | event_participants[1].date  | 2018-04 |
      | event_participants[1].count | 4       |
      | event_participants[2].date  | 2018-03 |
      | event_participants[2].count | 0       |
      | event_participants[3].date  | 2018-02 |
      | event_participants[3].count | 0       |
      | event_participants[4].date  | 2018-01 |
      | event_participants[4].count | 0       |
      | event_participants[5].date  | 2017-12 |
      | event_participants[5].count | 0       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-by-month?referent=referent-75-77@en-marche-dev.fr&city=Paris%208e"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | events[0].date              | 2018-05 |
      | events[0].count             | 3       |
      | events[1].date              | 2018-04 |
      | events[1].count             | 0       |
      | events[2].date              | 2018-03 |
      | events[2].count             | 0       |
      | events[3].date              | 2018-02 |
      | events[3].count             | 0       |
      | events[4].date              | 2018-01 |
      | events[4].count             | 0       |
      | events[5].date              | 2017-12 |
      | events[5].count             | 0       |
      | event_participants[0].date  | 2018-05 |
      | event_participants[0].count | 5       |
      | event_participants[1].date  | 2018-04 |
      | event_participants[1].count | 0       |
      | event_participants[2].date  | 2018-03 |
      | event_participants[2].count | 0       |
      | event_participants[3].date  | 2018-02 |
      | event_participants[3].count | 0       |
      | event_participants[4].date  | 2018-01 |
      | event_participants[4].count | 0       |
      | event_participants[5].date  | 2017-12 |
      | event_participants[5].count | 0       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-by-month?referent=referent-75-77@en-marche-dev.fr&city=Fontainebleau"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | events[0].date              | 2018-05 |
      | events[0].count             | 0       |
      | events[1].date              | 2018-04 |
      | events[1].count             | 2       |
      | events[2].date              | 2018-03 |
      | events[2].count             | 0       |
      | events[3].date              | 2018-02 |
      | events[3].count             | 0       |
      | events[4].date              | 2018-01 |
      | events[4].count             | 0       |
      | events[5].date              | 2017-12 |
      | events[5].count             | 0       |
      | event_participants[0].date  | 2018-05 |
      | event_participants[0].count | 0       |
      | event_participants[1].date  | 2018-04 |
      | event_participants[1].count | 4       |
      | event_participants[2].date  | 2018-03 |
      | event_participants[2].count | 0       |
      | event_participants[3].date  | 2018-02 |
      | event_participants[3].count | 0       |
      | event_participants[4].date  | 2018-01 |
      | event_participants[4].count | 0       |
      | event_participants[5].date  | 2017-12 |
      | event_participants[5].count | 0       |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-by-month?referent=referent-75-77@en-marche-dev.fr&committee=515a56c0-bde8-56ef-b90c-4745b1c93818"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | events[0].date              | 2018-05 |
      | events[0].count             | 3       |
      | events[1].date              | 2018-04 |
      | events[1].count             | 0       |
      | events[2].date              | 2018-03 |
      | events[2].count             | 0       |
      | events[3].date              | 2018-02 |
      | events[3].count             | 0       |
      | events[4].date              | 2018-01 |
      | events[4].count             | 0       |
      | events[5].date              | 2017-12 |
      | events[5].count             | 0       |
      | event_participants[0].date  | 2018-05 |
      | event_participants[0].count | 5       |
      | event_participants[1].date  | 2018-04 |
      | event_participants[1].count | 0       |
      | event_participants[2].date  | 2018-03 |
      | event_participants[2].count | 0       |
      | event_participants[3].date  | 2018-02 |
      | event_participants[3].count | 0       |
      | event_participants[4].date  | 2018-01 |
      | event_participants[4].count | 0       |
      | event_participants[5].date  | 2017-12 |
      | event_participants[5].count | 0       |

    # Test get stats for committee with scheduled events but not managed by referent
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-by-month?referent=referent-75-77@en-marche-dev.fr&committee=62ea97e7-6662-427b-b90a-23429136d0dd"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | events[0].date              | 2018-05 |
      | events[0].count             | 0       |
      | events[1].date              | 2018-04 |
      | events[1].count             | 0       |
      | events[2].date              | 2018-03 |
      | events[2].count             | 0       |
      | events[3].date              | 2018-02 |
      | events[3].count             | 0       |
      | events[4].date              | 2018-01 |
      | events[4].count             | 0       |
      | events[5].date              | 2017-12 |
      | events[5].count             | 0       |
      | event_participants[0].date  | 2018-05 |
      | event_participants[0].count | 0       |
      | event_participants[1].date  | 2018-04 |
      | event_participants[1].count | 0       |
      | event_participants[2].date  | 2018-03 |
      | event_participants[2].count | 0       |
      | event_participants[3].date  | 2018-02 |
      | event_participants[3].count | 0       |
      | event_participants[4].date  | 2018-01 |
      | event_participants[4].count | 0       |
      | event_participants[5].date  | 2017-12 |
      | event_participants[5].count | 0       |

  Scenario: As a client passing a referent email I can get participants count
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/events/count-participants?referent=referent-75-77@en-marche-dev.fr"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | total                             | 7       |
      | participants[0].date              | 2018-05 |
      | participants[0].count             | 5       |
      | participants[1].date              | 2018-04 |
      | participants[1].count             | 4       |
      | participants[2].date              | 2018-03 |
      | participants[2].count             | 0       |
      | participants[3].date              | 2018-02 |
      | participants[3].count             | 0       |
      | participants[4].date              | 2018-01 |
      | participants[4].count             | 0       |
      | participants[5].date              | 2017-12 |
      | participants[5].count             | 0       |
      | participants_as_adherent[0].date  | 2018-05 |
      | participants_as_adherent[0].count | 3       |
      | participants_as_adherent[1].date  | 2018-04 |
      | participants_as_adherent[1].count | 4       |
      | participants_as_adherent[2].date  | 2018-03 |
      | participants_as_adherent[2].count | 0       |
      | participants_as_adherent[3].date  | 2018-02 |
      | participants_as_adherent[3].count | 0       |
      | participants_as_adherent[4].date  | 2018-01 |
      | participants_as_adherent[4].count | 0       |
      | participants_as_adherent[5].date  | 2017-12 |
      | participants_as_adherent[5].count | 0       |
