@api
Feature:
  In order to see consultation reports
  As a non logged-in user
  I should be able to access Ideas Workshop API

  Background:
    Given the following fixtures are loaded:
      | LoadIdeaConsultationReportData |

  Scenario: As a non logged-in user I can see consultation reports
    When I send a "GET" request to "/api/ideas-workshop/consultation_reports"
    Then the response status code should be 200
    And the JSON nodes should be equal to:
      | metadata.total_items    | 2                                                                                                                          |
      | metadata.items_per_page | 2                                                                                                                          |
      | metadata.count          | 2                                                                                                                          |
      | metadata.current_page   | 1                                                                                                                          |
      | metadata.last_page      | 1                                                                                                                          |
      | items[0].url            | https://storage.googleapis.com/en-marche-prod/documents/adherents/1-charte-et-manifeste/charte_des_valeurs.pdf             |
      | items[0].position       | 1                                                                                                                          |
      | items[0].name           | Rapport sur les énergies renouvables                                                                                       |
      | items[1].url            | https://storage.googleapis.com/en-marche-prod/documents/adherents/1-charte-et-manifeste/regles_de_fonctionnement_LaREM.pdf |
      | items[1].position       | 2                                                                                                                          |
      | items[1].name           | Rapport sur la politique du logement                                                                                       |
