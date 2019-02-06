@api
Feature:
  In order to see consultations
  As a non logged-in user
  I should be able to access API Ideas Workshop

  Background:
    Given the following fixtures are loaded:
      | LoadAdherentData          |
      | LoadIdeaConsultationData  |

  Scenario: As a non logged-in user I can see consultations
    When I send a "GET" request to "/api/ideas-workshop/consultations"
    Then the response status code should be 200
    And the JSON nodes should be equal to:
      | metadata.total_items    | 1                              |
      | metadata.items_per_page | 2                              |
      | metadata.count          | 1                              |
      | metadata.current_page   | 1                              |
      | metadata.last_page      | 1                              |
      | items[0].response_time  | 2                              |
      | items[0].started_at     | @string@.isDateTime()          |
      | items[0].ended_at       | @string@.isDateTime()          |
      | items[0].url            | https://fr.lipsum.com/         |
      | items[0].name           | Consultation sur les retraites |

