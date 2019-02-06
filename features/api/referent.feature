@api
Feature:
  In order to get information for referent space
  As a referent
  I should be able to acces API data accessible by referent

  Background:
    Given the following fixtures are loaded:
      | LoadUserData      |
      | LoadAdherentData  |
      | LoadEventData     |
      | LoadClientData    |

  Scenario: As a non logged-in user I can not get the committee, cities and countries managed by referent for autocomplete
    When I am on "/api/statistics/search/autocomplete?type=committee&value=en"
    Then the response status code should be 401

  Scenario: As an adherent I can not get the committee, cities and countries managed by referent for autocomplete
    When I am logged as "jacques.picard@en-marche.fr"
    And I am on "/api/statistics/search/autocomplete?type=committee&value=en"
    Then the response status code should be 401

  Scenario: As a referent I can get the committee, cities and countries managed by referent for autocomplete
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/search/autocomplete?referent=referent@en-marche-dev.fr&type=committee&value=en"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committees[0].508d4ac0-27d6-4635-8953-4cc8600018f9 | En Marche - Comité de Rouen |
      | committees[1].79638242-5101-11e7-b114-b2f933d5fe66 | En Marche - Suisse          |
      | committees[2].b0cd0e52-a5a4-410b-bba3-37afdd326a0a | En Marche Dammarie-les-Lys  |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/search/autocomplete?referent=referent@en-marche-dev.fr&type=committee&value="
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | committees[0].d648d486-fbb3-4394-b4b3-016fac3658af | Antenne En Marche de Fontainebleau |
      | committees[1].508d4ac0-27d6-4635-8953-4cc8600018f9 | En Marche - Comité de Rouen        |
      | committees[2].79638242-5101-11e7-b114-b2f933d5fe66 | En Marche - Suisse                 |
      | committees[3].b0cd0e52-a5a4-410b-bba3-37afdd326a0a | En Marche Dammarie-les-Lys         |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/search/autocomplete?referent=referent@en-marche-dev.fr&type=country&value=s"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | countries[0].CH | Suisse |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/search/autocomplete?referent=referent@en-marche-dev.fr&type=country&value="
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON should be equal to:
    """
    And the JSON nodes should be equal to:
      | countries[0].ES | Espagne |
      | countries[1].CH | Suisse  |
    """

    # Test that search is case insensitive
    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/search/autocomplete?referent=referent@en-marche-dev.fr&type=city&value=FON"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | cities[0] | Fontainebleau |

    Given I add "Accept" header equal to "application/json"
    And I send a "POST" request to "/oauth/v2/token" with parameters:
      | key           | value                                        |
      | client_secret | crOsk2OxtYb4CgnKoYvhb9wvO73QLYyccChiFrV9evE= |
      | client_id     | 4f3394d4-7137-424a-8c73-27e0ad641fc9         |
      | grant_type    | client_credentials                           |
      | scope         | read:stats                                   |
    And I add the access token to the Authorization header
    When I send a "GET" request to "/api/statistics/search/autocomplete?referent=referent@en-marche-dev.fr&type=city&value="
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | cities[0] | Dammarie-les-Lys |
      | cities[1] | Fontainebleau    |
      | cities[2] | Rouen            |
      | cities[3] | Zürich           |
      | cities[4] | Kilchberg        |
      | cities[5] | Marseille 2e     |
