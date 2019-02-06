@api
Feature:
  In order to see comments
  As a user
  I should be able to access API threads and thread comments

  Background:
    Given the following fixtures are loaded:
      | LoadAdherentData          |
      | LoadIdeaData              |
      | LoadIdeaThreadData        |
      | LoadIdeaThreadCommentData |

  Scenario: As a non logged-in user I can see visibled thread comments paginated
    When I send a "GET" request to "/api/ideas-workshop/thread_comments?page=1"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items       | 9                                      |
      | metadata.items_per_page    | 3                                      |
      | metadata.count             | 3                                      |
      | metadata.current_page      | 1                                      |
      | metadata.last_page         | 3                                      |
      | items[0].uuid              | 9e49e935-ba51-4ae5-981c-5f48e55fdf28   |
      | items[0].content           | Commentaire d'un adhérent              |
      | items[0].author.uuid       | acc73b03-9743-47d8-99db-5a6c6f55ad67   |
      | items[0].author.nickname   |                                        |
      | items[0].author.first_name | Benjamin                               |
      | items[0].author.last_name  | D.                                     |
      | items[0].approved          | 0                                      |
      | items[0].created_at        | @string@.isDateTime()                  |
      | items[1].uuid              | 37116c8b-a36e-4a0d-8346-baba91cd1330   |
      | items[1].content           | Commentaire de l'adhérent à desadhérer |
      | items[1].author.uuid       | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0   |
      | items[1].author.nickname   |                                        |
      | items[1].author.first_name | Michel                                 |
      | items[1].author.last_name  | V.                                     |
      | items[1].approved          | 0                                      |
      | items[1].created_at        | @string@.isDateTime()                  |
      | items[2].uuid              | ecbe9136-3dc0-477d-b817-a25878dd639a   |
      | items[2].content           | <p>Commentaire signalé</p>             |
      | items[2].author.uuid       | 93de5d98-383a-4863-9f47-eb7a348873a8   |
      | items[2].author.nickname   |                                        |
      | items[2].author.first_name | Laura                                  |
      | items[2].author.last_name  | D.                                     |
      | items[2].approved          | 0                                      |
      | items[2].created_at        | @string@.isDateTime()                  |

  Scenario: As a non logged-in user I can see visible thread comments for a specific thread
    When I send a "GET" request to "/api/ideas-workshop/threads/dfd6a2f2-5579-421f-96ac-98993d0edea1/comments"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items       | 4                                    |
      | metadata.items_per_page    | 3                                    |
      | metadata.count             | 3                                    |
      | metadata.current_page      | 1                                    |
      | metadata.last_page         | 2                                    |
      | items[0].uuid              | 02bf299f-678a-4829-a6a1-241995339d8d |
      | items[0].content           | Deuxième commentaire d'un référent   |
      | items[0].author.uuid       | 29461c49-2646-4d89-9c82-50b3f9b586f4 |
      | items[0].author.nickname   |                                      |
      | items[0].author.first_name | Referent                             |
      | items[0].author.last_name  | R.                                   |
      | items[0].approved          | 0                                    |
      | items[0].created_at        | @string@.isDateTime()                |
      | items[1].uuid              | f716d3ba-004f-4958-af26-a7b010a6d458 |
      | items[1].content           | Commentaire d'un référent            |
      | items[1].author.uuid       | 29461c49-2646-4d89-9c82-50b3f9b586f4 |
      | items[1].author.nickname   |                                      |
      | items[1].author.first_name | Referent                             |
      | items[1].author.last_name  | R.                                   |
      | items[1].approved          | 0                                    |
      | items[1].created_at        | @string@.isDateTime()                |
      | items[2].uuid              | 60123090-6cdc-4de6-9cb3-07e2ec411f2f |
      | items[2].content           | Lorem Ipsum Commentaris              |
      | items[2].author.uuid       | a9fc8d48-6f57-4d89-ae73-50b3f9b586f4 |
      | items[2].author.nickname   |                                      |
      | items[2].author.first_name | Francis                              |
      | items[2].author.last_name  | B.                                   |
      | items[2].approved          | 0                                    |
      | items[2].created_at        | @string@.isDateTime()                |

  Scenario: As a logged-in user I can add my comment to a thread
    Given I am logged as "martine.lindt@gmail.com"
    And I add "Content-Type" header equal to "application/json"
    When I send a "POST" request to "/api/ideas-workshop/thread_comments" with body:
    """
    {
      "thread": "dfd6a2f2-5579-421f-96ac-98993d0edea1",
      "content": "Phasellus vitae enim faucibus🤘"
    }
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | thread.answer.id         | 1                                       |
      | thread.content           | J'ouvre une discussion sur le problème. |
      | thread.author.uuid       | e6977a4d-2646-5f6c-9c82-88e58dca8458    |
      | thread.author.nickname   |                                         |
      | thread.author.first_name | Carl                                    |
      | thread.author.last_name  | Mirabeau                                |
      | thread.created_at        | @string@.isDateTime()                   |
      | thread.uuid              | dfd6a2f2-5579-421f-96ac-98993d0edea1    |
      | thread.approved          | 0                                       |
      | content                  | Phasellus vitae enim faucibus           |
      | author.uuid              | d4b1e7e1-ba18-42a9-ace9-316440b30fa7    |
      | author.nickname          |                                         |
      | author.first_name        | Martine                                 |
      | author.last_name         | Lindt                                   |
      | created_at               | @string@.isDateTime()                   |
      | uuid                     | @uuid@                                  |
      | approved                 | 0                                       |

  Scenario Outline: As a logged-in user I can not approve/disapprove other comments
    Given I am logged as "carl999@example.fr"
    When I send a "PUT" request to "<url>"
    Then the response status code should be 403
    Examples:
      | url                                                                                 |
      | /api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d/approve    |
      | /api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d/disapprove |

  Scenario: As an idea author, I can approve/disapprove a comment
    Given I am logged as "jacques.picard@en-marche.fr"
    And I add "Content-Type" header equal to "application/json"
    When I send a "PUT" request to "/api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d/approve"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | content           | Aenean viverra efficitur lorem       |
      | author.nickname   |                                      |
      | author.uuid       | acc73b03-9743-47d8-99db-5a6c6f55ad67 |
      | author.first_name | Benjamin                             |
      | author.last_name  | Duroc                                |
      | created_at        | @string@.isDateTime()                |
      | uuid              | b99933f3-180c-4248-82f8-1b0eb950740d |
      | approved          | 1                                    |
    And I should have 1 email "ApprovedIdeaCommentMessage" for "benjyd@aol.com" with payload:
    """
    {
      "FromEmail": "atelier-des-idees@en-marche.fr",
      "FromName": "La République En Marche !",
      "Subject": "Votre contribution à une proposition a été approuvée par son auteur !",
      "MJ-TemplateID": "645030",
      "MJ-TemplateLanguage": true,
      "Recipients": [
          {
              "Email": "benjyd@aol.com",
              "Name": "Benjamin Duroc",
              "Vars": {
                  "first_name": "Benjamin",
                  "idea_name": "Faire la paix",
                  "idea_link": "http://test.enmarche.code/atelier-des-idees/proposition/e4ac3efc-b539-40ac-9417-b60df432bdc5"
              }
          }
      ]
    }
    """
    When I send a "PUT" request to "/api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d/disapprove"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | content           | Aenean viverra efficitur lorem       |
      | author.nickname   |                                      |
      | author.uuid       | acc73b03-9743-47d8-99db-5a6c6f55ad67 |
      | author.first_name | Benjamin                             |
      | author.last_name  | Duroc                                |
      | created_at        | @string@.isDateTime()                |
      | uuid              | b99933f3-180c-4248-82f8-1b0eb950740d |
      | approved          | 0                                    |

  Scenario: As a non logged-in user I can not delete a comment
    When I send a "DELETE" request to "/api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d"
    Then the response status code should be 401

  Scenario: As a logged-in user I can not delete a comment that is not mine
    When I am logged as "jacques.picard@en-marche.fr"
    And I send a "DELETE" request to "/api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d"
    Then the response status code should be 403

  Scenario: As a logged-in user I can delete my comment
    When I am logged as "benjyd@aol.com"
    And I send a "DELETE" request to "/api/ideas-workshop/thread_comments/b99933f3-180c-4248-82f8-1b0eb950740d"
    Then the response status code should be 204
    And the response should be empty
