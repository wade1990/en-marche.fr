@api
Feature:
  In order to create and delete threads
  As a user
  I should be able to access API threads

  Background:
    Given the following fixtures are loaded:
      | LoadIdeaAnswerData        |
      | LoadIdeaThreadData        |
      | LoadIdeaThreadCommentData |

  Scenario: As a non logged-in user I can see visibled threads paginated
    When I send a "GET" request to "/api/ideas-workshop/threads?page=1"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items                         | 8                                          |
      | metadata.items_per_page                      | 3                                          |
      | metadata.count                               | 3                                          |
      | metadata.current_page                        | 1                                          |
      | metadata.last_page                           | 3                                          |
      | items[0].answer.id                           | 1                                          |
      | items[0].comments.total_items                | 4                                          |
      | items[0].comments.items[0].uuid              | 02bf299f-678a-4829-a6a1-241995339d8d       |
      | items[0].comments.items[0].content           | Deuxième commentaire d'un référent         |
      | items[0].comments.items[0].author.uuid       | 29461c49-2646-4d89-9c82-50b3f9b586f4       |
      | items[0].comments.items[0].author.nickname   |                                            |
      | items[0].comments.items[0].author.first_name | Referent                                   |
      | items[0].comments.items[0].author.last_name  | R.                                         |
      | items[0].comments.items[0].approved          | 0                                          |
      | items[0].comments.items[0].created_at        | @string@.isDateTime()                      |
      | items[0].comments.items[1].uuid              | f716d3ba-004f-4958-af26-a7b010a6d458       |
      | items[0].comments.items[1].content           | Commentaire d'un référent                  |
      | items[0].comments.items[1].author.uuid       | 29461c49-2646-4d89-9c82-50b3f9b586f4       |
      | items[0].comments.items[1].author.nickname   |                                            |
      | items[0].comments.items[1].author.first_name | Referent                                   |
      | items[0].comments.items[1].author.last_name  | R.                                         |
      | items[0].comments.items[1].approved          | 0                                          |
      | items[0].comments.items[1].created_at        | @string@.isDateTime()                      |
      | items[0].comments.items[2].uuid              | 60123090-6cdc-4de6-9cb3-07e2ec411f2f       |
      | items[0].comments.items[2].content           | Lorem Ipsum Commentaris                    |
      | items[0].comments.items[2].author.uuid       | a9fc8d48-6f57-4d89-ae73-50b3f9b586f4       |
      | items[0].comments.items[2].author.nickname   |                                            |
      | items[0].comments.items[2].author.first_name | Francis                                    |
      | items[0].comments.items[2].author.last_name  | B.                                         |
      | items[0].comments.items[2].approved          | 0                                          |
      | items[0].comments.items[2].created_at        | @string@.isDateTime()                      |
      | items[0].uuid                                | dfd6a2f2-5579-421f-96ac-98993d0edea1       |
      | items[0].content                             | J'ouvre une discussion sur le problème.    |
      | items[0].author.uuid                         | e6977a4d-2646-5f6c-9c82-88e58dca8458       |
      | items[0].author.nickname                     |                                            |
      | items[0].author.first_name                   | Carl                                       |
      | items[0].author.last_name                    | Mirabeau                                   |
      | items[0].approved                            | 0                                          |
      | items[0].created_at                          | @string@.isDateTime()                      |
      | items[1].answer.id                           | 2                                          |
      | items[1].comments.total_items                | 0                                          |
      | items[1].uuid                                | 6b077cc4-1cbd-4615-b607-c23009119406       |
      | items[1].content                             | J'ouvre une discussion sur la solution.    |
      | items[1].author.uuid                         | 29461c49-6316-5be1-9ac3-17816bf2d819       |
      | items[1].author.nickname                     |                                            |
      | items[1].author.first_name                   | Lucie                                      |
      | items[1].author.last_name                    | O.                                         |
      | items[1].approved                            | 0                                          |
      | items[1].created_at                          | @string@.isDateTime()                      |
      | items[2].answer.id                           | 3                                          |
      | items[2].comments.total_items                | 4                                          |
      | items[2].comments.items[0].uuid              | 37116c8b-a36e-4a0d-8346-baba91cd1330       |
      | items[2].comments.items[0].content           | Commentaire de l'adhérent à desadhérer     |
      | items[2].comments.items[0].author.uuid       | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0       |
      | items[2].comments.items[0].author.nickname   |                                            |
      | items[2].comments.items[0].author.first_name | Michel                                     |
      | items[2].comments.items[0].author.last_name  | V.                                         |
      | items[2].comments.items[0].approved          | 0                                          |
      | items[2].comments.items[0].created_at        | @string@.isDateTime()                      |
      | items[2].comments.items[1].uuid              | ecbe9136-3dc0-477d-b817-a25878dd639a       |
      | items[2].comments.items[1].content           | <p>Commentaire signalé</p>                 |
      | items[2].comments.items[1].author.uuid       | 93de5d98-383a-4863-9f47-eb7a348873a8       |
      | items[2].comments.items[1].author.nickname   |                                            |
      | items[2].comments.items[1].author.first_name | Laura                                      |
      | items[2].comments.items[1].author.last_name  | D.                                         |
      | items[2].comments.items[1].approved          | 0                                          |
      | items[2].comments.items[1].created_at        | @string@.isDateTime()                      |
      | items[2].comments.items[2].uuid              | 3fa38c45-1122-4c48-9ada-b366b3408fec       |
      | items[2].comments.items[2].content           | <p>Commentaire non approuvé</p>            |
      | items[2].comments.items[2].author.uuid       | 93de5d98-383a-4863-9f47-eb7a348873a8       |
      | items[2].comments.items[2].author.nickname   |                                            |
      | items[2].comments.items[2].author.first_name | Laura                                      |
      | items[2].comments.items[2].author.last_name  | D.                                         |
      | items[2].comments.items[2].approved          | 0                                          |
      | items[2].comments.items[2].created_at        | @string@.isDateTime()                      |
      | items[2].uuid                                | a508a7c5-8b07-41f4-8515-064f674a65e8       |
      | items[2].content                             | J'ouvre une discussion sur la comparaison. |
      | items[2].author.uuid                         | b4219d47-3138-5efd-9762-2ef9f9495084       |
      | items[2].author.nickname                     |                                            |
      | items[2].author.first_name                   | Gisele                                     |
      | items[2].author.last_name                    | B.                                         |
      | items[2].approved                            | 0                                          |
      | items[2].created_at                          | @string@.isDateTime()                      |

  Scenario: As a non logged-in user I can see visible threads for an answer
    When I send a "GET" request to "/api/ideas-workshop/threads?answer.id=3"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items                         | 3                                          |
      | metadata.items_per_page                      | 3                                          |
      | metadata.count                               | 3                                          |
      | metadata.current_page                        | 1                                          |
      | metadata.last_page                           | 1                                          |
      | items[0].answer.id                           | 3                                          |
      | items[0].comments.total_items                | 4                                          |
      | items[0].comments.items[0].uuid              | 37116c8b-a36e-4a0d-8346-baba91cd1330       |
      | items[0].comments.items[0].content           | Commentaire de l'adhérent à desadhérer     |
      | items[0].comments.items[0].author.uuid       | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0       |
      | items[0].comments.items[0].author.nickname   |                                            |
      | items[0].comments.items[0].author.first_name | Michel                                     |
      | items[0].comments.items[0].author.last_name  | V.                                         |
      | items[0].comments.items[0].approved          | 0                                          |
      | items[0].comments.items[0].created_at        | @string@.isDateTime()                      |
      | items[0].comments.items[1].uuid              | ecbe9136-3dc0-477d-b817-a25878dd639a       |
      | items[0].comments.items[1].content           | <p>Commentaire signalé</p>                 |
      | items[0].comments.items[1].author.uuid       | 93de5d98-383a-4863-9f47-eb7a348873a8       |
      | items[0].comments.items[1].author.nickname   |                                            |
      | items[0].comments.items[1].author.first_name | Laura                                      |
      | items[0].comments.items[1].author.last_name  | D.                                         |
      | items[0].comments.items[1].approved          | 0                                          |
      | items[0].comments.items[1].created_at        | @string@.isDateTime()                      |
      | items[0].comments.items[2].uuid              | 3fa38c45-1122-4c48-9ada-b366b3408fec       |
      | items[0].comments.items[2].content           | <p>Commentaire non approuvé</p>            |
      | items[0].comments.items[2].author.uuid       | 93de5d98-383a-4863-9f47-eb7a348873a8       |
      | items[0].comments.items[2].author.nickname   |                                            |
      | items[0].comments.items[2].author.first_name | Laura                                      |
      | items[0].comments.items[2].author.last_name  | D.                                         |
      | items[0].comments.items[2].approved          | 0                                          |
      | items[0].comments.items[2].created_at        | @string@.isDateTime()                      |
      | items[0].uuid                                | a508a7c5-8b07-41f4-8515-064f674a65e8       |
      | items[0].content                             | J'ouvre une discussion sur la comparaison. |
      | items[0].author.uuid                         | b4219d47-3138-5efd-9762-2ef9f9495084       |
      | items[0].author.nickname                     |                                            |
      | items[0].author.first_name                   | Gisele                                     |
      | items[0].author.last_name                    | B.                                         |
      | items[0].approved                            | 0                                          |
      | items[0].created_at                          | @string@.isDateTime()                      |
      | items[1].answer.id                           | 3                                          |
      | items[1].comments.total_items                | 0                                          |
      | items[1].uuid                                | 78d7daa1-657c-4e7e-87bc-24eb4ea26ea2       |
      | items[1].content                             | Une nouvelle discussion.                   |
      | items[1].author.uuid                         | b4219d47-3138-5efd-9762-2ef9f9495084       |
      | items[1].author.nickname                     |                                            |
      | items[1].author.first_name                   | Gisele                                     |
      | items[1].author.last_name                    | B.                                         |
      | items[1].approved                            | 0                                          |
      | items[1].created_at                          | @string@.isDateTime()                      |
      | items[2].answer.id                           | 3                                          |
      | items[2].comments.total_items                | 0                                          |
      | items[2].uuid                                | b191f13a-5a05-49ed-8ec3-c335aa68f439       |
      | items[2].content                             | Une discussion signalée.                   |
      | items[2].author.uuid                         | b4219d47-3138-5efd-9762-2ef9f9495084       |
      | items[2].author.nickname                     |                                            |
      | items[2].author.first_name                   | Gisele                                     |
      | items[2].author.last_name                    | B.                                         |
      | items[2].approved                            | 0                                          |
      | items[2].created_at                          | @string@.isDateTime()                      |

  Scenario: As a logged-in user I can add my thread to an answer
    Given I add "Content-Type" header equal to "application/json"
    And I am logged as "martine.lindt@gmail.com"
    When I send a "POST" request to "/api/ideas-workshop/threads" with body:
    """
    {
        "answer": "1",
        "content": "LOREM IPSUM🤘"
    }
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | answer.id         | 1                                    |
      | uuid              | @uuid@                               |
      | content           | LOREM IPSUM                          |
      | author.uuid       | d4b1e7e1-ba18-42a9-ace9-316440b30fa7 |
      | author.nickname   |                                      |
      | author.first_name | Martine                              |
      | author.last_name  | Lindt                                |
      | created_at        | @string@.isDateTime()                |
      | approved          | 0                                    |

  Scenario Outline: As a logged-in user I can not approve/disapprove other threads
    Given I am logged as "carl999@example.fr"
    When I send a "PUT" request to "<url>"
    Then the response status code should be 403
    Examples:
      | url                                                                         |
      | /api/ideas-workshop/threads/6b077cc4-1cbd-4615-b607-c23009119406/approve    |
      | /api/ideas-workshop/threads/6b077cc4-1cbd-4615-b607-c23009119406/disapprove |

  Scenario: As an idea author, I can approve/disapprove a thread
    Given I am logged as "jacques.picard@en-marche.fr"
    And I add "Content-Type" header equal to "application/json"
    When I send a "PUT" request to "/api/ideas-workshop/threads/dfd6a2f2-5579-421f-96ac-98993d0edea1/approve"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | answer.id         | 1                                       |
      | uuid              | dfd6a2f2-5579-421f-96ac-98993d0edea1    |
      | content           | J'ouvre une discussion sur le problème. |
      | author.uuid       | e6977a4d-2646-5f6c-9c82-88e58dca8458    |
      | author.nickname   |                                         |
      | author.first_name | Carl                                    |
      | author.last_name  | Mirabeau                                |
      | created_at        | @string@.isDateTime()                   |
      | approved          | 1                                       |
    And I should have 1 email "ApprovedIdeaCommentMessage" for "carl999@example.fr" with payload:
    """
    {
      "FromEmail": "atelier-des-idees@en-marche.fr",
      "FromName": "La République En Marche !",
      "Subject": "Votre contribution à une proposition a été approuvée par son auteur !",
      "MJ-TemplateID": "645030",
      "MJ-TemplateLanguage": true,
      "Recipients": [
          {
              "Email": "carl999@example.fr",
              "Name": "Carl Mirabeau",
              "Vars": {
                  "first_name": "Carl",
                  "idea_name": "Faire la paix",
                  "idea_link": "http://test.enmarche.code/atelier-des-idees/proposition/e4ac3efc-b539-40ac-9417-b60df432bdc5"
              }
          }
      ]
    }
    """
    When I send a "PUT" request to "/api/ideas-workshop/threads/dfd6a2f2-5579-421f-96ac-98993d0edea1/disapprove"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | answer.id         | 1                                       |
      | uuid              | dfd6a2f2-5579-421f-96ac-98993d0edea1    |
      | content           | J'ouvre une discussion sur le problème. |
      | author.uuid       | e6977a4d-2646-5f6c-9c82-88e58dca8458    |
      | author.nickname   |                                         |
      | author.first_name | Carl                                    |
      | author.last_name  | Mirabeau                                |
      | created_at        | @string@.isDateTime()                   |
      | approved          | 0                                       |

  Scenario: As a non logged-in user I can not delete a thread
    When I send a "DELETE" request to "/api/ideas-workshop/threads/dfd6a2f2-5579-421f-96ac-98993d0edea1"
    Then the response status code should be 401

  Scenario: As a logged-in user I can not delete a thread that is not mine
    Given I am logged as "jacques.picard@en-marche.fr"
    When I send a "DELETE" request to "/api/ideas-workshop/threads/dfd6a2f2-5579-421f-96ac-98993d0edea1"
    Then the response status code should be 403

  Scenario: As a logged-in user I can delete my thread
    Given I am logged as "carl999@example.fr"
    When I send a "DELETE" request to "/api/ideas-workshop/threads/dfd6a2f2-5579-421f-96ac-98993d0edea1"
    Then the response status code should be 204
    And the response should be empty
