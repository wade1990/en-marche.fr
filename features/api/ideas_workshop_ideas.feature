@api
Feature:
  In order to see ideas
  As a non logged-in user
  I should be able to access API Ideas Workshop

  Background:
    Given the following fixtures are loaded:
      | LoadIdeaQuestionData      |
      | LoadIdeaCategoryData      |
      | LoadIdeaNeedData          |
      | LoadIdeaThemeData         |
      | LoadIdeaData              |
      | LoadIdeaThreadCommentData |
      | LoadIdeaVoteData          |

  Scenario: As a non logged-in user I can see published ideas
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?status=FINALIZED"
    Then the response status code should be 200
    And the JSON nodes should be equal to:
      | metadata.total_items            | 2                                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                                         |
      | metadata.count                  | 2                                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                                         |
      | metadata.last_page              | 1                                                                                                                                                                         |
      | items[0].uuid                   | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                   | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id           | 3                                                                                                                                                                         |
      | items[0].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                                         |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname        | kikouslove                                                                                                                                                                |
      | items[0].author.first_name      |                                                                                                                                                                           |
      | items[0].author.last_name       |                                                                                                                                                                           |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee              |                                                                                                                                                                           |
      | items[0].status                 | FINALIZED                                                                                                                                                                 |
      | items[0].votes_count.important  | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative | 0                                                                                                                                                                         |
      | items[0].votes_count.total      | 0                                                                                                                                                                         |
      | items[0].author_category        | ADHERENT                                                                                                                                                                  |
      | items[0].description            | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                   | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].days_before_deadline   | 0                                                                                                                                                                         |
      | items[0].contributors_count     | 2                                                                                                                                                                         |
      | items[0].comments_count         | 2                                                                                                                                                                         |
      | items[1].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                                                                                                                      |
      | items[1].name                   | Reduire le gaspillage alimentaire                                                                                                                                         |
      | items[1].themes[0].id           | 3                                                                                                                                                                         |
      | items[1].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[1].category.id            | 1                                                                                                                                                                         |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled       | 1                                                                                                                                                                         |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                      |
      | items[1].author.nickname        |                                                                                                                                                                           |
      | items[1].author.first_name      | Michel                                                                                                                                                                    |
      | items[1].author.last_name       | V.                                                                                                                                                                        |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee              |                                                                                                                                                                           |
      | items[1].status                 | FINALIZED                                                                                                                                                                 |
      | items[1].votes_count.important  | 0                                                                                                                                                                         |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[1].votes_count.innovative | 0                                                                                                                                                                         |
      | items[1].votes_count.total      | 0                                                                                                                                                                         |
      | items[1].author_category        | ELECTED                                                                                                                                                                   |
      | items[1].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                                                                                                          |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                   | reduire-le-gaspillage-alimentaire                                                                                                                                         |
      | items[1].days_before_deadline   | 0                                                                                                                                                                         |
      | items[1].contributors_count     | 0                                                                                                                                                                         |
      | items[1].comments_count         | 0                                                                                                                                                                         |

  Scenario: As a non logged-in user I can see pending ideas
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?status=PENDING"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 2                                                                                                                                                                    |
      | metadata.items_per_page         | 2                                                                                                                                                                    |
      | metadata.count                  | 2                                                                                                                                                                    |
      | metadata.current_page           | 1                                                                                                                                                                    |
      | metadata.last_page              | 1                                                                                                                                                                    |
      | items[0].uuid                   | e4ac3efc-b539-40ac-9417-b60df432bdc5                                                                                                                                 |
      | items[0].name                   | Faire la paix                                                                                                                                                        |
      | items[0].themes[0].id           | 1                                                                                                                                                                    |
      | items[0].themes[0].name         | Armées et défense                                                                                                                                                    |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                            |
      | items[0].category.id            | 1                                                                                                                                                                    |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                   |
      | items[0].category.enabled       | 1                                                                                                                                                                    |
      | items[0].needs[0].id            | 1                                                                                                                                                                    |
      | items[0].needs[0].name          | Juridique                                                                                                                                                            |
      | items[0].needs[0].enabled       | 1                                                                                                                                                                    |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                 |
      | items[0].author.nickname        | kikouslove                                                                                                                                                           |
      | items[0].author.first_name      |                                                                                                                                                                      |
      | items[0].author.last_name       |                                                                                                                                                                      |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.uuid         | 515a56c0-bde8-56ef-b90c-4745b1c93818                                                                                                                                 |
      | items[0].committee.created_at   | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.name         | En Marche Paris 8                                                                                                                                                    |
      | items[0].committee.slug         | en-marche-paris-8                                                                                                                                                    |
      | items[0].status                 | PENDING                                                                                                                                                              |
      | items[0].votes_count.important  | 7                                                                                                                                                                    |
      | items[0].votes_count.feasible   | 5                                                                                                                                                                    |
      | items[0].votes_count.innovative | 5                                                                                                                                                                    |
      | items[0].votes_count.total      | 17                                                                                                                                                                   |
      | items[0].author_category        | COMMITTEE                                                                                                                                                            |
      | items[0].description            | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                |
      | items[0].slug                   | faire-la-paix                                                                                                                                                        |
      | items[0].days_before_deadline   | 13                                                                                                                                                                   |
      | items[0].contributors_count     | 8                                                                                                                                                                    |
      | items[0].comments_count         | 13                                                                                                                                                                   |
      | items[1].uuid                   | bbf35ba6-52ba-4913-aae8-5948449d0c1d                                                                                                                                 |
      | items[1].name                   | Reduire le bruit dans les opens spaces                                                                                                                               |
      | items[1].themes[0].id           | 3                                                                                                                                                                    |
      | items[1].themes[0].name         | Écologie                                                                                                                                                             |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                            |
      | items[1].category.id            | 1                                                                                                                                                                    |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                   |
      | items[1].category.enabled       | 1                                                                                                                                                                    |
      | items[1].needs[0].id            | 1                                                                                                                                                                    |
      | items[1].needs[0].name          | Juridique                                                                                                                                                            |
      | items[1].needs[0].enabled       | 1                                                                                                                                                                    |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                 |
      | items[1].author.nickname        |                                                                                                                                                                      |
      | items[1].author.first_name      | Michel                                                                                                                                                               |
      | items[1].author.last_name       | V.                                                                                                                                                                   |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                |
      | items[1].committee              |                                                                                                                                                                      |
      | items[1].status                 | PENDING                                                                                                                                                              |
      | items[1].votes_count.important  | 0                                                                                                                                                                    |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                    |
      | items[1].votes_count.innovative | 0                                                                                                                                                                    |
      | items[1].votes_count.total      | 0                                                                                                                                                                    |
      | items[1].author_category        | ELECTED                                                                                                                                                              |
      | items[1].description            | Curabitur sed leo nec massa lobortis pretium sed ac lacus. In aliquet varius ante.                                                                                   |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                |
      | items[1].slug                   | reduire-le-bruit-dans-les-opens-spaces                                                                                                                               |
      | items[1].days_before_deadline   | 8                                                                                                                                                                    |
      | items[1].contributors_count     | 0                                                                                                                                                                    |
      | items[1].comments_count         | 0                                                                                                                                                                    |

  Scenario: As a non logged-in user I can filter ideas by name
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?name=paix"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 1                                                                                                                                                                    |
      | metadata.items_per_page         | 2                                                                                                                                                                    |
      | metadata.count                  | 1                                                                                                                                                                    |
      | metadata.current_page           | 1                                                                                                                                                                    |
      | metadata.last_page              | 1                                                                                                                                                                    |
      | items[0].uuid                   | e4ac3efc-b539-40ac-9417-b60df432bdc5                                                                                                                                 |
      | items[0].name                   | Faire la paix                                                                                                                                                        |
      | items[0].themes[0].id           | 1                                                                                                                                                                    |
      | items[0].themes[0].name         | Armées et défense                                                                                                                                                    |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                            |
      | items[0].category.id            | 1                                                                                                                                                                    |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                   |
      | items[0].category.enabled       | 1                                                                                                                                                                    |
      | items[0].needs[0].id            | 1                                                                                                                                                                    |
      | items[0].needs[0].name          | Juridique                                                                                                                                                            |
      | items[0].needs[0].enabled       | 1                                                                                                                                                                    |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                 |
      | items[0].author.nickname        | kikouslove                                                                                                                                                           |
      | items[0].author.first_name      |                                                                                                                                                                      |
      | items[0].author.last_name       |                                                                                                                                                                      |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.uuid         | 515a56c0-bde8-56ef-b90c-4745b1c93818                                                                                                                                 |
      | items[0].committee.created_at   | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.name         | En Marche Paris 8                                                                                                                                                    |
      | items[0].committee.slug         | en-marche-paris-8                                                                                                                                                    |
      | items[0].status                 | PENDING                                                                                                                                                              |
      | items[0].votes_count.important  | 7                                                                                                                                                                    |
      | items[0].votes_count.feasible   | 5                                                                                                                                                                    |
      | items[0].votes_count.innovative | 5                                                                                                                                                                    |
      | items[0].votes_count.total      | 17                                                                                                                                                                   |
      | items[0].author_category        | COMMITTEE                                                                                                                                                            |
      | items[0].description            | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                |
      | items[0].slug                   | faire-la-paix                                                                                                                                                        |
      | items[0].days_before_deadline   | 13                                                                                                                                                                   |
      | items[0].contributors_count     | 8                                                                                                                                                                    |
      | items[0].comments_count         | 13                                                                                                                                                                   |

  Scenario: As a logged-in user I can filter ideas by name
    Given I am logged as "jacques.picard@en-marche.fr"
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "/api/ideas-workshop/ideas?name=paix"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
        "metadata": {
            "total_items": 1,
            "items_per_page": 2,
            "count": 1,
            "current_page": 1,
            "last_page": 1
        },
        "items": [
            {
                "uuid": "e4ac3efc-b539-40ac-9417-b60df432bdc5",
                "name": "Faire la paix",
                "themes": [
                    {
                        "id": 1,
                        "name": "Armées et défense",
                        "thumbnail": "http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png"
                    }
                ],
                "category": {
                    "id": 1,
                    "name": "Echelle Européenne",
                    "enabled": true
                },
                "needs": [
                    {
                        "id": 1,
                        "name": "Juridique",
                        "enabled": true
                    }
                ],
                "author": {
                    "uuid": "a046adbe-9c7b-56a9-a676-6151a6785dda",
                    "nickname":"kikouslove",
                    "first_name": null,
                    "last_name": null
                },
                "published_at": "@string@.isDateTime()",
                "finalized_at": "@string@.isDateTime()",
                "committee": {
                    "uuid": "515a56c0-bde8-56ef-b90c-4745b1c93818",
                    "created_at": "@string@.isDateTime()",
                    "name": "En Marche Paris 8",
                    "slug": "en-marche-paris-8"
                },
                "status": "PENDING",
                "votes_count": {
                    "important": "7",
                    "feasible": "5",
                    "innovative": "5",
                    "total": 17,
                    "my_votes": {
                        "feasible": @integer@,
                        "important": @integer@,
                        "innovative": @integer@
                    }
                },
                "author_category": "COMMITTEE",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus.",
                "created_at": "@string@.isDateTime()",
                "slug": "faire-la-paix",
                "days_before_deadline": 13,
                "contributors_count": 8,
                "comments_count":13
            }
        ]
    }
    """

  Scenario: As a non logged-in user I can filter ideas by theme
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?themes.name=ecologie"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 3                                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                                         |
      | metadata.count                  | 2                                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                                         |
      | metadata.last_page              | 2                                                                                                                                                                         |
      | items[0].uuid                   | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                   | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id           | 3                                                                                                                                                                         |
      | items[0].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                                         |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname        | kikouslove                                                                                                                                                                |
      | items[0].author.first_name      |                                                                                                                                                                           |
      | items[0].author.last_name       |                                                                                                                                                                           |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee              |                                                                                                                                                                           |
      | items[0].votes_count.important  | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative | 0                                                                                                                                                                         |
      | items[0].votes_count.total      | 0                                                                                                                                                                         |
      | items[0].author_category        | ADHERENT                                                                                                                                                                  |
      | items[0].description            | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                   | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].status                 | FINALIZED                                                                                                                                                                 |
      | items[0].days_before_deadline   | 0                                                                                                                                                                         |
      | items[0].contributors_count     | 2                                                                                                                                                                         |
      | items[0].comments_count         | 2                                                                                                                                                                         |
      | items[1].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                                                                                                                      |
      | items[1].name                   | Reduire le gaspillage alimentaire                                                                                                                                         |
      | items[1].themes[0].id           | 3                                                                                                                                                                         |
      | items[1].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[1].category.id            | 1                                                                                                                                                                         |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled       | 1                                                                                                                                                                         |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                      |
      | items[1].author.nickname        |                                                                                                                                                                           |
      | items[1].author.first_name      | Michel                                                                                                                                                                    |
      | items[1].author.last_name       | V.                                                                                                                                                                        |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee              |                                                                                                                                                                           |
      | items[1].votes_count.important  | 0                                                                                                                                                                         |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[1].votes_count.innovative | 0                                                                                                                                                                         |
      | items[1].votes_count.total      | 0                                                                                                                                                                         |
      | items[1].author_category        | ELECTED                                                                                                                                                                   |
      | items[1].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                                                                                                          |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                   | reduire-le-gaspillage-alimentaire                                                                                                                                         |
      | items[1].status                 | FINALIZED                                                                                                                                                                 |
      | items[1].days_before_deadline   | 0                                                                                                                                                                         |
      | items[1].contributors_count     | 0                                                                                                                                                                         |
      | items[1].comments_count         | 0                                                                                                                                                                         |

  Scenario: As a non logged-in user I can filter ideas by category's name
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?category.name=Echelle Européenne"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 4                                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                                         |
      | metadata.count                  | 2                                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                                         |
      | metadata.last_page              | 2                                                                                                                                                                         |
      | items[0].uuid                   | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                   | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id           | 3                                                                                                                                                                         |
      | items[0].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                                         |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname        | kikouslove                                                                                                                                                                |
      | items[0].author.first_name      |                                                                                                                                                                           |
      | items[0].author.last_name       |                                                                                                                                                                           |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee              |                                                                                                                                                                           |
      | items[0].status                 | FINALIZED                                                                                                                                                                 |
      | items[0].votes_count.important  | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative | 0                                                                                                                                                                         |
      | items[0].votes_count.total      | 0                                                                                                                                                                         |
      | items[0].author_category        | ADHERENT                                                                                                                                                                  |
      | items[0].description            | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                   | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].days_before_deadline   | 0                                                                                                                                                                         |
      | items[0].contributors_count     | 2                                                                                                                                                                         |
      | items[0].comments_count         | 2                                                                                                                                                                         |
      | items[1].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                                                                                                                      |
      | items[1].name                   | Reduire le gaspillage alimentaire                                                                                                                                         |
      | items[1].themes[0].id           | 3                                                                                                                                                                         |
      | items[1].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[1].category.id            | 1                                                                                                                                                                         |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled       | 1                                                                                                                                                                         |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                      |
      | items[1].author.nickname        |                                                                                                                                                                           |
      | items[1].author.first_name      | Michel                                                                                                                                                                    |
      | items[1].author.last_name       | V.                                                                                                                                                                        |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee              |                                                                                                                                                                           |
      | items[1].status                 | FINALIZED                                                                                                                                                                 |
      | items[1].votes_count.important  | 0                                                                                                                                                                         |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[1].votes_count.innovative | 0                                                                                                                                                                         |
      | items[1].votes_count.total      | 0                                                                                                                                                                         |
      | items[1].author_category        | ELECTED                                                                                                                                                                   |
      | items[1].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                                                                                                          |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                   | reduire-le-gaspillage-alimentaire                                                                                                                                         |
      | items[1].days_before_deadline   | 0                                                                                                                                                                         |
      | items[1].contributors_count     | 0                                                                                                                                                                         |
      | items[1].comments_count         | 0                                                                                                                                                                         |

  Scenario: As a non logged-in user I can filter ideas by author uuid
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?author.uuid=acc73b03-9743-47d8-99db-5a6c6f55ad67"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 1                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                         |
      | metadata.count                  | 1                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                         |
      | metadata.last_page              | 1                                                                                                                                                         |
      | items[0].uuid                   | aa093ce6-8b20-4d86-bfbc-91a73fe47285                                                                                                                      |
      | items[0].name                   | Aider les gens                                                                                                                                            |
      | items[0].themes[0].id           | 1                                                                                                                                                         |
      | items[0].themes[0].name         | Armées et défense                                                                                                                                         |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                         |
      | items[0].author.uuid            | acc73b03-9743-47d8-99db-5a6c6f55ad67                                                                                                                      |
      | items[0].author.nickname        |                                                                                                                                                           |
      | items[0].author.first_name      | Benjamin                                                                                                                                                  |
      | items[0].author.last_name       | D.                                                                                                                                                        |
      | items[0].published_at           |                                                                                                                                                           |
      | items[0].finalized_at           |                                                                                                                                                           |
      | items[0].committee              |                                                                                                                                                           |
      | items[0].status                 | DRAFT                                                                                                                                                     |
      | items[0].votes_count.important  | 7                                                                                                                                                         |
      | items[0].votes_count.feasible   | 5                                                                                                                                                         |
      | items[0].votes_count.innovative | 5                                                                                                                                                         |
      | items[0].votes_count.total      | 17                                                                                                                                                        |
      | items[0].author_category        | QG                                                                                                                                                        |
      | items[0].description            | Nam laoreet eros diam, vitae hendrerit libero interdum nec. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                     |
      | items[0].slug                   | aider-les-gens                                                                                                                                            |
      | items[0].days_before_deadline   | 0                                                                                                                                                         |
      | items[0].contributors_count     | 0                                                                                                                                                         |
      | items[0].comments_count         | 0                                                                                                                                                         |

  Scenario: As a non logged-in user I can filter ideas by need's name
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?needs.name=Juridique"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 2                                                                                                                                                                    |
      | metadata.items_per_page         | 2                                                                                                                                                                    |
      | metadata.count                  | 2                                                                                                                                                                    |
      | metadata.current_page           | 1                                                                                                                                                                    |
      | metadata.last_page              | 1                                                                                                                                                                    |
      | items[0].uuid                   | e4ac3efc-b539-40ac-9417-b60df432bdc5                                                                                                                                 |
      | items[0].name                   | Faire la paix                                                                                                                                                        |
      | items[0].themes[0].id           | 1                                                                                                                                                                    |
      | items[0].themes[0].name         | Armées et défense                                                                                                                                                    |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                            |
      | items[0].category.id            | 1                                                                                                                                                                    |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                   |
      | items[0].category.enabled       | 1                                                                                                                                                                    |
      | items[0].needs[0].id            | 1                                                                                                                                                                    |
      | items[0].needs[0].name          | Juridique                                                                                                                                                            |
      | items[0].needs[0].enabled       | 1                                                                                                                                                                    |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                 |
      | items[0].author.nickname        | kikouslove                                                                                                                                                           |
      | items[0].author.first_name      |                                                                                                                                                                      |
      | items[0].author.last_name       |                                                                                                                                                                      |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.uuid         | 515a56c0-bde8-56ef-b90c-4745b1c93818                                                                                                                                 |
      | items[0].committee.created_at   | 2017-01-12T13:25:54+01:00                                                                                                                                            |
      | items[0].committee.name         | En Marche Paris 8                                                                                                                                                    |
      | items[0].committee.slug         | en-marche-paris-8                                                                                                                                                    |
      | items[0].status                 | PENDING                                                                                                                                                              |
      | items[0].votes_count.important  | 7                                                                                                                                                                    |
      | items[0].votes_count.feasible   | 5                                                                                                                                                                    |
      | items[0].votes_count.innovative | 5                                                                                                                                                                    |
      | items[0].votes_count.total      | 17                                                                                                                                                                   |
      | items[0].author_category        | COMMITTEE                                                                                                                                                            |
      | items[0].description            | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                |
      | items[0].slug                   | faire-la-paix                                                                                                                                                        |
      | items[0].days_before_deadline   | 13                                                                                                                                                                   |
      | items[0].contributors_count     | 8                                                                                                                                                                    |
      | items[0].comments_count         | 13                                                                                                                                                                   |
      | items[1].uuid                   | bbf35ba6-52ba-4913-aae8-5948449d0c1d                                                                                                                                 |
      | items[1].name                   | Reduire le bruit dans les opens spaces                                                                                                                               |
      | items[1].themes[0].id           | 3                                                                                                                                                                    |
      | items[1].themes[0].name         | Écologie                                                                                                                                                             |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                            |
      | items[1].category.id            | 1                                                                                                                                                                    |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                   |
      | items[1].category.enabled       | 1                                                                                                                                                                    |
      | items[1].needs[0].id            | 1                                                                                                                                                                    |
      | items[1].needs[0].name          | Juridique                                                                                                                                                            |
      | items[1].needs[0].enabled       | 1                                                                                                                                                                    |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                 |
      | items[1].author.nickname        |                                                                                                                                                                      |
      | items[1].author.first_name      | Michel                                                                                                                                                               |
      | items[1].author.last_name       | V.                                                                                                                                                                   |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                |
      | items[1].committee              |                                                                                                                                                                      |
      | items[1].status                 | PENDING                                                                                                                                                              |
      | items[1].votes_count.important  | 0                                                                                                                                                                    |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                    |
      | items[1].votes_count.innovative | 0                                                                                                                                                                    |
      | items[1].votes_count.total      | 0                                                                                                                                                                    |
      | items[1].author_category        | ELECTED                                                                                                                                                              |
      | items[1].description            | Curabitur sed leo nec massa lobortis pretium sed ac lacus. In aliquet varius ante.                                                                                   |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                |
      | items[1].slug                   | reduire-le-bruit-dans-les-opens-spaces                                                                                                                               |
      | items[1].days_before_deadline   | 8                                                                                                                                                                    |
      | items[1].contributors_count     | 0                                                                                                                                                                    |
      | items[1].comments_count         | 0                                                                                                                                                                    |

  Scenario: As a logged-in user I can add my idea only with a name
    Given I am logged as "martine.lindt@gmail.com"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/ideas-workshop/ideas" with body:
    """
    {
      "name": "Mon idée"
    }
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
        "themes": [],
        "category": null,
        "needs": [],
        "author": {
            "uuid": "d4b1e7e1-ba18-42a9-ace9-316440b30fa7",
            "nickname":null,
            "first_name": "Martine",
            "last_name": "Lindt"
        },
        "published_at": null,
        "finalized_at": null,
        "committee": null,
        "answers":[],
        "status": "DRAFT",
        "votes_count": {
            "important": 0,
            "feasible": 0,
            "innovative": 0,
            "total": 0,
            "my_votes": []
        },
        "uuid": "@uuid@",
        "author_category": "ADHERENT",
        "description": null,
        "created_at": "@string@.isDateTime()",
        "name": "Mon idée",
        "slug": "mon-idee",
        "days_before_deadline": @integer@,
        "contributors_count": 0,
        "comments_count": 0
    }
    """

  Scenario: As a logged-in user with mandats (elected adherent) I can add my idea
    Given I am logged as "michel.vasseur@example.ch"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/ideas-workshop/ideas" with body:
    """
    {
      "name": "Ma proposition"
    }
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
        "uuid": "@uuid@",
        "name": "Ma proposition",
        "themes": [],
        "category": null,
        "needs": [],
        "author": {
            "nickname": null,
            "uuid": "46ab0600-b5a0-59fc-83a7-cc23ca459ca0",
            "first_name": "Michel",
            "last_name": "VASSEUR"
        },
        "published_at": null,
        "finalized_at": null,
        "committee": null,
        "answers": [],
        "votes_count": {
            "important": 0,
            "feasible": 0,
            "innovative": 0,
            "total": 0,
            "my_votes": []
        },
        "author_category": "ELECTED",
        "description": null,
        "created_at": "@string@.isDateTime()",
        "slug": "ma-proposition",
        "status": "DRAFT",
        "days_before_deadline": @integer@,
        "contributors_count": 0,
        "comments_count": 0
    }
    """

  Scenario: As a logged-in user I can't link an idea with a committee i don't belong to
    Given I am logged as "martine.lindt@gmail.com"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/ideas-workshop/ideas" with body:
    """
    {
      "name": "Mon idée",
      "committee": "62ea97e7-6662-427b-b90a-23429136d0dd"
    }
    """
    Then the response status code should be 400
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | type                       | @string@                                                           |
      | title                      | An error occurred                                                  |
      | detail                     | @string@                                                           |
      | violations[0].propertyPath | committee                                                          |
      | violations[0].message      | Vous ne pouvez sélectionner de comité dont vous n'êtes pas membre. |

  Scenario: As a logged-in user I can add my idea with all datas
    Given I am logged as "jacques.picard@en-marche.fr"
    When I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "/api/ideas-workshop/ideas" with body:
    """
    {
      "name": "Mon idée🤘",
      "description": "Mon idée🤘",
      "themes": [2],
      "category": 2,
      "committee": "515a56c0-bde8-56ef-b90c-4745b1c93818",
      "needs": [1,2],
      "answers":[
        {
          "question":1,
          "content":"<p>Lorem Ipsum🤘</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p><p>Lorem Ipsum</p><p>Cras tincidunt erat at justo tristique.</p><p>Lorem Ipsum</p>"
        },
        {
          "question":2,
          "content":"Réponse à la question 2🤘"
        },
        {
          "question":3,
          "content":"Réponse à la question 3"
        },
        {
          "question":4,
          "content":""
        }
      ]
    }
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
        "name": "Mon idée",
        "themes": [
            {
                "id": 2,
                "name": "Trésorerie",
                "thumbnail": "http://test.enmarche.code/assets/images/ideas_workshop/themes/tresory.png"
            }
        ],
        "category": {
            "id": 2,
            "name": "Echelle Nationale",
            "enabled": true
        },
        "needs": [
            {
                "id": 1,
                "name": "Juridique",
                "enabled": true
            },
            {
                "id": 2,
                "name": "Rédactionnel",
                "enabled": true
            }
        ],
        "author": {
            "uuid": "a046adbe-9c7b-56a9-a676-6151a6785dda",
            "nickname":"kikouslove",
            "first_name": null,
            "last_name": null
        },
        "published_at": null,
        "finalized_at": null,
        "committee": {
            "uuid": "515a56c0-bde8-56ef-b90c-4745b1c93818",
            "created_at": "@string@.isDateTime()",
            "name": "En Marche Paris 8",
            "slug": "en-marche-paris-8"
        },
        "answers":[
          {
            "id": "@integer@",
            "question": { "id": 1 },
            "content":"@string@"
          },
          {
            "id": "@integer@",
            "question": { "id": 2 },
            "content":"Réponse à la question 2"
          },
          {
            "id": "@integer@",
            "question": { "id": 3 },
            "content":"Réponse à la question 3"
          },
          {
            "id": "@integer@",
            "question": { "id": 4 },
            "content":""
          }
        ],
        "status": "DRAFT",
        "votes_count": {
            "important": 0,
            "feasible": 0,
            "innovative": 0,
            "total": 0,
            "my_votes": []
        },
        "author_category": "QG",
        "description": "Mon idée",
        "uuid": "@uuid@",
        "created_at": "@string@.isDateTime()",
        "slug": "mon-idee",
        "days_before_deadline": @integer@,
        "contributors_count": 0,
        "comments_count": 0
    }
    """

  Scenario: As a logged-in user I can modify my idea
    Given I am logged as "jacques.picard@en-marche.fr"
    When I add "Content-Type" header equal to "application/json"
    And I send a "PUT" request to "/api/ideas-workshop/ideas/e4ac3efc-b539-40ac-9417-b60df432bdc5" with body:
    """
    {
      "name": "Mon idée 2🤘",
      "description": "Mon idée 2🤘",
      "themes": [2],
      "category": 2,
      "committee": "515a56c0-bde8-56ef-b90c-4745b1c93818",
      "needs": [1,2],
      "answers":[
        {
          "id": 1,
          "question":1,
          "content":"Réponse à la question 1🤘"
        },
        {
          "id": 2,
          "question":2,
          "content":"Réponse à la question 2"
        },
        {
          "id": 3,
          "question":3,
          "content":"Réponse à la question 3"
        }
      ]
    }
    """
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | uuid                            | e4ac3efc-b539-40ac-9417-b60df432bdc5                                      |
      | name                            | Mon idée 2                                                                |
      | themes[0].id                    | 2                                                                         |
      | themes[0].name                  | Trésorerie                                                                |
      | themes[0].thumbnail             | http://test.enmarche.code/assets/images/ideas_workshop/themes/tresory.png |
      | category.id                     | 2                                                                         |
      | category.name                   | Echelle Nationale                                                         |
      | category.enabled                | 1                                                                         |
      | needs[0].id                     | 1                                                                         |
      | needs[0].name                   | Juridique                                                                 |
      | needs[0].enabled                | 1                                                                         |
      | needs[1].id                     | 2                                                                         |
      | needs[1].name                   | Rédactionnel                                                              |
      | needs[1].enabled                | 1                                                                         |
      | author.uuid                     | a046adbe-9c7b-56a9-a676-6151a6785dda                                      |
      | author.nickname                 | kikouslove                                                                |
      | author.first_name               |                                                                           |
      | author.last_name                |                                                                           |
      | published_at                    | @string@.isDateTime()                                                     |
      | finalized_at                    | @string@.isDateTime()                                                     |
      | committee.uuid                  | 515a56c0-bde8-56ef-b90c-4745b1c93818                                      |
      | committee.created_at            | @string@.isDateTime()                                                     |
      | committee.name                  | En Marche Paris 8                                                         |
      | committee.slug                  | en-marche-paris-8                                                         |
      | answers[0].id                   | 1                                                                         |
      | answers[0].content              | Réponse à la question 1                                                   |
      | answers[0].question.id          | 1                                                                         |
      | answers[1].id                   | 2                                                                         |
      | answers[1].content              | Réponse à la question 2                                                   |
      | answers[1].question.id          | 2                                                                         |
      | answers[2].id                   | 3                                                                         |
      | answers[2].content              | Réponse à la question 3                                                   |
      | answers[2].question.id          | 3                                                                         |
      | votes_count.important           | 7                                                                         |
      | votes_count.feasible            | 5                                                                         |
      | votes_count.innovative          | 5                                                                         |
      | votes_count.total               | 17                                                                        |
      | votes_count.my_votes.feasible   | 14                                                                        |
      | votes_count.my_votes.important  | 11                                                                        |
      | votes_count.my_votes.innovative | 17                                                                        |
      | author_category                 | QG                                                                        |
      | description                     | Mon idée 2                                                                |
      | created_at                      | @string@.isDateTime()                                                     |
      | slug                            | mon-idee-2                                                                |
      | status                          | PENDING                                                                   |
      | days_before_deadline            | 13                                                                        |
      | contributors_count              | 8                                                                         |
      | comments_count                  | 14                                                                        |

  Scenario: As a logged-in user I can get ideas where I voted
    Given I am logged as "benjyd@aol.com"
    And I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas/my-contributions"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items                    | 2                                                                                                                                                                         |
      | metadata.items_per_page                 | 2                                                                                                                                                                         |
      | metadata.count                          | 2                                                                                                                                                                         |
      | metadata.current_page                   | 1                                                                                                                                                                         |
      | metadata.last_page                      | 1                                                                                                                                                                         |
      | items[0].uuid                           | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                           | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id                   | 3                                                                                                                                                                         |
      | items[0].themes[0].name                 | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail            | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id                    | 1                                                                                                                                                                         |
      | items[0].category.name                  | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled               | 1                                                                                                                                                                         |
      | items[0].author.uuid                    | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname                | kikouslove                                                                                                                                                                |
      | items[0].author.first_name              |                                                                                                                                                                           |
      | items[0].author.last_name               |                                                                                                                                                                           |
      | items[0].published_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee                      |                                                                                                                                                                           |
      | items[0].votes_count.important          | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible           | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative         | 0                                                                                                                                                                         |
      | items[0].votes_count.total              | 0                                                                                                                                                                         |
      | items[0].author_category                | ADHERENT                                                                                                                                                                  |
      | items[0].description                    | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at                     | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                           | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].status                         | FINALIZED                                                                                                                                                                 |
      | items[0].days_before_deadline           | 0                                                                                                                                                                         |
      | items[0].contributors_count             | 2                                                                                                                                                                         |
      | items[0].comments_count                 | 2                                                                                                                                                                         |
      | items[1].uuid                           | e4ac3efc-b539-40ac-9417-b60df432bdc5                                                                                                                                      |
      | items[1].name                           | Faire la paix                                                                                                                                                             |
      | items[1].themes[0].id                   | 1                                                                                                                                                                         |
      | items[1].themes[0].name                 | Armées et défense                                                                                                                                                         |
      | items[1].themes[0].thumbnail            | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                                 |
      | items[1].category.id                    | 1                                                                                                                                                                         |
      | items[1].category.name                  | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled               | 1                                                                                                                                                                         |
      | items[1].needs[0].id                    | 1                                                                                                                                                                         |
      | items[1].needs[0].name                  | Juridique                                                                                                                                                                 |
      | items[1].needs[0].enabled               | 1                                                                                                                                                                         |
      | items[1].author.uuid                    | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[1].author.nickname                | kikouslove                                                                                                                                                                |
      | items[1].author.first_name              |                                                                                                                                                                           |
      | items[1].author.last_name               |                                                                                                                                                                           |
      | items[1].published_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee.uuid                 | 515a56c0-bde8-56ef-b90c-4745b1c93818                                                                                                                                      |
      | items[1].committee.created_at           | 2017-01-12T13:25:54+01:00                                                                                                                                                 |
      | items[1].committee.name                 | En Marche Paris 8                                                                                                                                                         |
      | items[1].committee.slug                 | en-marche-paris-8                                                                                                                                                         |
      | items[1].votes_count.important          | 7                                                                                                                                                                         |
      | items[1].votes_count.feasible           | 5                                                                                                                                                                         |
      | items[1].votes_count.innovative         | 5                                                                                                                                                                         |
      | items[1].votes_count.total              | 17                                                                                                                                                                        |
      | items[1].votes_count.my_votes.feasible  | 32                                                                                                                                                                        |
      | items[1].votes_count.my_votes.important | 29                                                                                                                                                                        |
      | items[1].author_category                | COMMITTEE                                                                                                                                                                 |
      | items[1].description                    | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus.      |
      | items[1].created_at                     | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                           | faire-la-paix                                                                                                                                                             |
      | items[1].status                         | PENDING                                                                                                                                                                   |
      | items[1].days_before_deadline           | 13                                                                                                                                                                        |
      | items[1].contributors_count             | 8                                                                                                                                                                         |
      | items[1].comments_count                 | 13                                                                                                                                                                        |

  Scenario: As a logged-in user I can get ideas where I wrote a comment
    Given I am logged as "benjyd@aol.com"
    And I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas/my-contributions"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items                    | 2                                                                                                                                                                         |
      | metadata.items_per_page                 | 2                                                                                                                                                                         |
      | metadata.count                          | 2                                                                                                                                                                         |
      | metadata.current_page                   | 1                                                                                                                                                                         |
      | metadata.last_page                      | 1                                                                                                                                                                         |
      | items[0].uuid                           | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                           | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id                   | 3                                                                                                                                                                         |
      | items[0].themes[0].name                 | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail            | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id                    | 1                                                                                                                                                                         |
      | items[0].category.name                  | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled               | 1                                                                                                                                                                         |
      | items[0].author.uuid                    | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname                | kikouslove                                                                                                                                                                |
      | items[0].author.first_name              |                                                                                                                                                                           |
      | items[0].author.last_name               |                                                                                                                                                                           |
      | items[0].published_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee                      |                                                                                                                                                                           |
      | items[0].votes_count.important          | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible           | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative         | 0                                                                                                                                                                         |
      | items[0].votes_count.total              | 0                                                                                                                                                                         |
      | items[0].author_category                | ADHERENT                                                                                                                                                                  |
      | items[0].description                    | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at                     | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                           | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].status                         | FINALIZED                                                                                                                                                                 |
      | items[0].days_before_deadline           | 0                                                                                                                                                                         |
      | items[0].contributors_count             | 2                                                                                                                                                                         |
      | items[0].comments_count                 | 2                                                                                                                                                                         |
      | items[1].uuid                           | e4ac3efc-b539-40ac-9417-b60df432bdc5                                                                                                                                      |
      | items[1].name                           | Faire la paix                                                                                                                                                             |
      | items[1].themes[0].id                   | 1                                                                                                                                                                         |
      | items[1].themes[0].name                 | Armées et défense                                                                                                                                                         |
      | items[1].themes[0].thumbnail            | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                                 |
      | items[1].category.id                    | 1                                                                                                                                                                         |
      | items[1].category.name                  | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled               | 1                                                                                                                                                                         |
      | items[1].needs[0].id                    | 1                                                                                                                                                                         |
      | items[1].needs[0].name                  | Juridique                                                                                                                                                                 |
      | items[1].needs[0].enabled               | 1                                                                                                                                                                         |
      | items[1].author.uuid                    | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[1].author.nickname                | kikouslove                                                                                                                                                                |
      | items[1].author.first_name              |                                                                                                                                                                           |
      | items[1].author.last_name               |                                                                                                                                                                           |
      | items[1].published_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at                   | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee.uuid                 | 515a56c0-bde8-56ef-b90c-4745b1c93818                                                                                                                                      |
      | items[1].committee.created_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee.name                 | En Marche Paris 8                                                                                                                                                         |
      | items[1].committee.slug                 | en-marche-paris-8                                                                                                                                                         |
      | items[1].votes_count.important          | 7                                                                                                                                                                         |
      | items[1].votes_count.feasible           | 5                                                                                                                                                                         |
      | items[1].votes_count.innovative         | 5                                                                                                                                                                         |
      | items[1].votes_count.total              | 17                                                                                                                                                                        |
      | items[1].votes_count.my_votes.feasible  | 32                                                                                                                                                                        |
      | items[1].votes_count.my_votes.important | 29                                                                                                                                                                        |
      | items[1].author_category                | COMMITTEE                                                                                                                                                                 |
      | items[1].description                    | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus.      |
      | items[1].created_at                     | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                           | faire-la-paix                                                                                                                                                             |
      | items[1].status                         | PENDING                                                                                                                                                                   |
      | items[1].days_before_deadline           | 13                                                                                                                                                                        |
      | items[1].contributors_count             | 8                                                                                                                                                                         |
      | items[1].comments_count                 | 13                                                                                                                                                                        |

  Scenario: As a non logged-in user I can not delete an idea
    When I send a "DELETE" request to "/api/ideas-workshop/ideas/e4ac3efc-b539-40ac-9417-b60df432bdc5"
    Then the response status code should be 401

  Scenario: As a logged-in user I can not delete an idea that is not mine
    When I am logged as "jacques.picard@en-marche.fr"
    And I send a "DELETE" request to "/api/ideas-workshop/ideas/aa093ce6-8b20-4d86-bfbc-91a73fe47285"
    Then the response status code should be 403

  Scenario: As a logged-in user I can delete my idea
    When I am logged as "jacques.picard@en-marche.fr"
    And I send a "DELETE" request to "/api/ideas-workshop/ideas/e4ac3efc-b539-40ac-9417-b60df432bdc5"
    Then the response status code should be 204
    And the response should be empty

  Scenario: As a non logged-in user I can not publish an idea
    When I send a "PUT" request to "/api/ideas-workshop/ideas/aa093ce6-8b20-4d86-bfbc-91a73fe47285/publish"
    Then the response status code should be 401

  Scenario: As a logged-in user I can not publish an idea that is not mine
    Given I am logged as "jacques.picard@en-marche.fr"
    When I send a "PUT" request to "/api/ideas-workshop/ideas/aa093ce6-8b20-4d86-bfbc-91a73fe47285/publish"
    Then the response status code should be 403

  Scenario: As a logged-in user I can not publish an idea that has another status than DRAFT at the moment of execution
    Given I am logged as "jacques.picard@en-marche.fr"
    When I send a "PUT" request to "/api/ideas-workshop/ideas/c14937d6-fd42-465c-8419-ced37f3e6194/publish"
    Then the response status code should be 400

  Scenario: As a logged-in user I get errors when I try to publish an invalid idea
    Given I am logged as "michel.vasseur@example.ch"
    And I add "Content-Type" header equal to "application/json"
    When I send a "PUT" request to "/api/ideas-workshop/ideas/9529e98c-2524-486f-a6ed-e2d707dc99ea/publish"
    Then the response status code should be 400
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | type                       | https://tools.ietf.org/html/rfc2616#section-10                                        |
      | title                      | An error occurred                                                                     |
      | detail                     | @string@                                                                              |
      | violations[0].propertyPath | themes                                                                                |
      | violations[0].message      | Pour publier votre idée, vous devez préciser au minimum 1 thème.                      |
      | violations[1].propertyPath | category                                                                              |
      | violations[1].message      | Pour publier votre idée, sa catégorie devrait être remplie.                           |
      | violations[2].propertyPath | answers                                                                               |
      | violations[2].message      | Pour publier votre idée, vous devez apporter des réponses aux questions obligatoires. |
      | violations[3].propertyPath | description                                                                           |
      | violations[3].message      | Pour publier votre idée, sa description ne doit pas être vide.                        |

  Scenario: As a logged-in user I can publish my idea which is in DRAFT state
    Given I am logged as "benjyd@aol.com"
    And I add "Content-Type" header equal to "application/json"
    When I send a "PUT" request to "/api/ideas-workshop/ideas/aa093ce6-8b20-4d86-bfbc-91a73fe47285" with body:
    """
    {
      "needs": [1,2],
      "answers": [
        {
          "question":1,
          "content":"Réponse à la question 1"
        },
        {
          "question":2,
          "content":"Réponse à la question 2"
        }
      ]
    }
    """
    Then the response status code should be 200
    Given I add "Content-Type" header equal to "application/json"
    When I send a "PUT" request to "/api/ideas-workshop/ideas/aa093ce6-8b20-4d86-bfbc-91a73fe47285/publish"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should contain:
      | name   | Aider les gens |
      | status | PENDING        |
    And I should have 1 email "IdeaPublishMessage" for "benjyd@aol.com" with payload:
    """
    {
      "FromEmail": "atelier-des-idees@en-marche.fr",
      "FromName": "La République En Marche !",
      "Subject": "Votre proposition a bien été publiée !",
      "MJ-TemplateID": "645027",
      "MJ-TemplateLanguage": true,
      "Recipients": [
          {
              "Email": "benjyd@aol.com",
              "Name": "Benjamin Duroc",
              "Vars": {
                  "first_name": "Benjamin",
                  "idea_link": "http://test.enmarche.code/atelier-des-idees/proposition/aa093ce6-8b20-4d86-bfbc-91a73fe47285"
              }
          }
      ]
    }
    """

  Scenario: As a logged-in user I can get full information about one idea
    Given I am logged as "benjyd@aol.com"
    And I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas/e4ac3efc-b539-40ac-9417-b60df432bdc5"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
       "name":"Faire la paix",
       "themes":[
          {
             "id":1,
             "thumbnail":"http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png"
          }
       ],
       "category":{
          "id":1
       },
       "needs":[
          {
             "id":1
          }
       ],
       "author":{
          "uuid":"a046adbe-9c7b-56a9-a676-6151a6785dda",
          "nickname":"kikouslove",
          "first_name":null,
          "last_name":null
       },
       "published_at":"@string@.isDateTime()",
       "finalized_at":"@string@.isDateTime()",
       "answers":[
          {
             "id":3,
             "content":"<p>Mauris gravida semper tincidunt.</p>",
             "question":{
                "id":3
             },
             "threads":{
                "total_items":3,
                "items":[
                   {
                      "comments":{
                         "total_items":4,
                         "items":[
                            {
                               "uuid":"37116c8b-a36e-4a0d-8346-baba91cd1330",
                               "content":"Commentaire de l'adhérent à desadhérer",
                               "author":{
                                  "uuid":"46ab0600-b5a0-59fc-83a7-cc23ca459ca0",
                                  "nickname":null,
                                  "first_name":"Michel",
                                  "last_name":"VASSEUR"
                               },
                               "approved":false,
                               "created_at": "@string@.isDateTime()"
                            },
                            {
                                "uuid": "ecbe9136-3dc0-477d-b817-a25878dd639a",
                                "content": "<p>Commentaire signalé</p>",
                                "author": {
                                    "uuid": "93de5d98-383a-4863-9f47-eb7a348873a8",
                                    "nickname":null,
                                    "first_name": "Laura",
                                    "last_name": "Deloche"
                                },
                               "approved":false,
                                "created_at": "@string@.isDateTime()"
                            },
                            {
                               "uuid": "3fa38c45-1122-4c48-9ada-b366b3408fec",
                               "content": "<p>Commentaire non approuvé</p>",
                               "author": {
                                  "uuid": "93de5d98-383a-4863-9f47-eb7a348873a8",
                                  "nickname":null,
                                  "first_name": "Laura",
                                  "last_name": "Deloche"
                               },
                               "approved":false,
                               "created_at": "@string@.isDateTime()"
                            }
                         ]
                      },
                      "uuid":"a508a7c5-8b07-41f4-8515-064f674a65e8",
                      "content":"J'ouvre une discussion sur la comparaison.",
                      "author":{
                         "uuid":"b4219d47-3138-5efd-9762-2ef9f9495084",
                         "nickname":null,
                         "first_name":"Gisele",
                         "last_name":"Berthoux"
                      },
                      "approved":false,
                      "created_at": "@string@.isDateTime()"
                   },
                   {
                      "comments":{
                         "total_items":0,
                         "items":[

                         ]
                      },
                      "uuid":"78d7daa1-657c-4e7e-87bc-24eb4ea26ea2",
                      "content":"Une nouvelle discussion.",
                      "author":{
                         "uuid":"b4219d47-3138-5efd-9762-2ef9f9495084",
                         "nickname":null,
                         "first_name":"Gisele",
                         "last_name":"Berthoux"
                      },
                      "approved":false,
                      "created_at": "@string@.isDateTime()"
                   },
                   {
                      "comments":{
                         "total_items":0,
                         "items":[

                         ]
                      },
                      "uuid":"b191f13a-5a05-49ed-8ec3-c335aa68f439",
                      "content":"Une discussion signalée.",
                      "author":{
                         "uuid":"b4219d47-3138-5efd-9762-2ef9f9495084",
                         "nickname":null,
                         "first_name":"Gisele",
                         "last_name":"Berthoux"
                      },
                      "approved":false,
                      "created_at": "@string@.isDateTime()"
                   }
                ]
             }
          },
          {
             "id":1,
             "content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet, mi condimentum venenatis vestibulum, arcu neque feugiat massa, at pharetra velit sapien et elit. Sed vitae hendrerit nulla. Vivamus consectetur magna at tincidunt maximus. Aenean dictum metus vel tellus posuere venenatis.",
             "question":{
                "id":1
             },
             "threads":{
                "total_items":1,
                "items":[
                   {
                      "comments":{
                         "total_items":4,
                         "items":[
                            {
                               "uuid":"02bf299f-678a-4829-a6a1-241995339d8d",
                               "content":"Deuxième commentaire d'un référent",
                               "author":{
                                  "uuid":"29461c49-2646-4d89-9c82-50b3f9b586f4",
                                  "nickname":null,
                                  "first_name":"Referent",
                                  "last_name":"Referent"
                               },
                               "approved":false,
                               "created_at": "@string@.isDateTime()"
                            },
                            {
                               "uuid":"f716d3ba-004f-4958-af26-a7b010a6d458",
                               "content":"Commentaire d'un référent",
                               "author":{
                                  "uuid":"29461c49-2646-4d89-9c82-50b3f9b586f4",
                                  "nickname":null,
                                  "first_name":"Referent",
                                  "last_name":"Referent"
                               },
                               "approved":false,
                               "created_at": "@string@.isDateTime()"
                            },
                            {
                               "uuid":"60123090-6cdc-4de6-9cb3-07e2ec411f2f",
                               "content":"Lorem Ipsum Commentaris",
                               "author":{
                                  "uuid":"a9fc8d48-6f57-4d89-ae73-50b3f9b586f4",
                                  "nickname":null,
                                  "first_name":"Francis",
                                  "last_name":"Brioul"
                               },
                               "approved":false,
                               "created_at": "@string@.isDateTime()"
                            }
                         ]
                      },
                      "uuid":"dfd6a2f2-5579-421f-96ac-98993d0edea1",
                      "content":"J'ouvre une discussion sur le problème.",
                      "author":{
                         "uuid":"e6977a4d-2646-5f6c-9c82-88e58dca8458",
                         "nickname":null,
                         "first_name":"Carl",
                         "last_name":"Mirabeau"
                      },
                      "approved":false,
                      "created_at": "@string@.isDateTime()"
                   }
                ]
             }
          },
          {
             "id":2,
             "content":"<p>Nulla metus enim, congue eu facilisis ac, consectetur ut ipsum.</p>",
             "question":{
                "id":2
             },
             "threads":{
                "total_items":1,
                "items":[
                   {
                      "comments":{
                         "total_items":0,
                         "items":[

                         ]
                      },
                      "uuid":"6b077cc4-1cbd-4615-b607-c23009119406",
                      "content":"J'ouvre une discussion sur la solution.",
                      "author":{
                         "uuid":"29461c49-6316-5be1-9ac3-17816bf2d819",
                         "nickname":null,
                         "first_name":"Lucie",
                         "last_name":"Olivera"
                      },
                      "approved":false,
                      "created_at": "@string@.isDateTime()"
                   }
                ]
             }
          },
          {
             "id":4,
             "content":"Donec ac neque congue, condimentum ipsum ac, eleifend ex.",
             "question":{
                "id":4
             },
             "threads":{
                "total_items":0,
                "items":[

                ]
             }
          },
          {
             "id":5,
             "content":"Suspendisse interdum quis tortor quis sodales. Suspendisse vel mollis orci.",
             "question":{
                "id":5
             },
             "threads":{
                "total_items":0,
                "items":[

                ]
             }
          },
          {
             "id":6,
             "content":"Proin et quam a tortor pretium fringilla non et magna.",
             "question":{
                "id":6
             },
             "threads":{
                "total_items":0,
                "items":[

                ]
             }
          },
          {
             "id":7,
             "content":"Orci varius natoque penatibus et magnis dis parturient montes",
             "question":{
                "id":7
             },
             "threads":{
                "total_items":0,
                "items":[

                ]
             }
          },
          {
             "id":8,
             "content":"Nam nisi nunc, ornare nec elit id, porttitor vestibulum ligula. Donec enim tellus, congue non quam at, aliquam porta ex.",
             "question":{
                "id":8
             },
             "threads":{
                "total_items":0,
                "items":[

                ]
             }
          }
       ],
       "votes_count":{
          "important":"7",
          "feasible":"5",
          "innovative":"5",
          "total":17,
          "my_votes":{
             "feasible":@integer@,
             "important":@integer@
          }
       },
       "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus.",
       "created_at":"@string@.isDateTime()",
       "status":"PENDING"
    }
    """

  Scenario: As a non logged-in user I can get full information about one idea
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas/c14937d6-fd42-465c-8419-ced37f3e6194"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | name                                                            | Réduire le gaspillage                                                                                                                                                     |
      | themes[0].id                                                    | 3                                                                                                                                                                         |
      | themes[0].thumbnail                                             | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | category.id                                                     | 1                                                                                                                                                                         |
      | author.uuid                                                     | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | author.nickname                                                 | kikouslove                                                                                                                                                                |
      | author.first_name                                               |                                                                                                                                                                           |
      | author.last_name                                                |                                                                                                                                                                           |
      | published_at                                                    | @string@.isDateTime()                                                                                                                                                     |
      | finalized_at                                                    | @string@.isDateTime()                                                                                                                                                     |
      | answers[0].id                                                   | 10                                                                                                                                                                        |
      | answers[0].content                                              | Vestibulum ante ipsum primis.                                                                                                                                             |
      | answers[0].question.id                                          | 1                                                                                                                                                                         |
      | answers[0].threads.total_items                                  | 1                                                                                                                                                                         |
      | answers[0].threads.items[0].comments.total_items                | 1                                                                                                                                                                         |
      | answers[0].threads.items[0].comments.items[0].uuid              | 9e49e935-ba51-4ae5-981c-5f48e55fdf28                                                                                                                                      |
      | answers[0].threads.items[0].comments.items[0].content           | Commentaire d'un adhérent                                                                                                                                                 |
      | answers[0].threads.items[0].comments.items[0].author.uuid       | acc73b03-9743-47d8-99db-5a6c6f55ad67                                                                                                                                      |
      | answers[0].threads.items[0].comments.items[0].author.nickname   |                                                                                                                                                                           |
      | answers[0].threads.items[0].comments.items[0].author.first_name | Benjamin                                                                                                                                                                  |
      | answers[0].threads.items[0].comments.items[0].author.last_name  | D.                                                                                                                                                                        |
      | answers[0].threads.items[0].comments.items[0].approved          | 0                                                                                                                                                                         |
      | answers[0].threads.items[0].comments.items[0].created_at        | @string@.isDateTime()                                                                                                                                                     |
      | answers[0].threads.items[0].uuid                                | 1474504d-8024-4e54-85f7-59666a11cd77                                                                                                                                      |
      | answers[0].threads.items[0].content                             | [Reduce Waste] Une discussion avec un commentaire                                                                                                                         |
      | answers[0].threads.items[0].author.uuid                         | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | answers[0].threads.items[0].author.nickname                     | kikouslove                                                                                                                                                                |
      | answers[0].threads.items[0].author.first_name                   |                                                                                                                                                                           |
      | answers[0].threads.items[0].author.last_name                    |                                                                                                                                                                           |
      | answers[0].threads.items[0].approved                            | 0                                                                                                                                                                         |
      | answers[0].threads.items[0].created_at                          | @string@.isDateTime()                                                                                                                                                     |
      | votes_count.important                                           | 0                                                                                                                                                                         |
      | votes_count.feasible                                            | 0                                                                                                                                                                         |
      | votes_count.innovative                                          | 0                                                                                                                                                                         |
      | votes_count.total                                               | 0                                                                                                                                                                         |
      | description                                                     | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | created_at                                                      | @string@.isDateTime()                                                                                                                                                     |
      | status                                                          | FINALIZED                                                                                                                                                                 |

  Scenario: As a non logged-in user I can order ideas by publishedAt property
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?order[publishedAt]=asc"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 4                                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                                         |
      | metadata.count                  | 2                                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                                         |
      | metadata.last_page              | 2                                                                                                                                                                         |
      | items[0].uuid                   | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                   | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id           | 3                                                                                                                                                                         |
      | items[0].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                                         |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname        | kikouslove                                                                                                                                                                |
      | items[0].author.first_name      |                                                                                                                                                                           |
      | items[0].author.last_name       |                                                                                                                                                                           |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee              |                                                                                                                                                                           |
      | items[0].votes_count.important  | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative | 0                                                                                                                                                                         |
      | items[0].votes_count.total      | 0                                                                                                                                                                         |
      | items[0].author_category        | ADHERENT                                                                                                                                                                  |
      | items[0].description            | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                   | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].status                 | FINALIZED                                                                                                                                                                 |
      | items[0].days_before_deadline   | 0                                                                                                                                                                         |
      | items[0].contributors_count     | 2                                                                                                                                                                         |
      | items[0].comments_count         | 2                                                                                                                                                                         |
      | items[1].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                                                                                                                      |
      | items[1].name                   | Reduire le gaspillage alimentaire                                                                                                                                         |
      | items[1].themes[0].id           | 3                                                                                                                                                                         |
      | items[1].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[1].category.id            | 1                                                                                                                                                                         |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled       | 1                                                                                                                                                                         |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                      |
      | items[1].author.nickname        |                                                                                                                                                                           |
      | items[1].author.first_name      | Michel                                                                                                                                                                    |
      | items[1].author.last_name       | V.                                                                                                                                                                        |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee              |                                                                                                                                                                           |
      | items[1].votes_count.important  | 0                                                                                                                                                                         |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[1].votes_count.innovative | 0                                                                                                                                                                         |
      | items[1].votes_count.total      | 0                                                                                                                                                                         |
      | items[1].author_category        | ELECTED                                                                                                                                                                   |
      | items[1].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                                                                                                          |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                   | reduire-le-gaspillage-alimentaire                                                                                                                                         |
      | items[1].status                 | FINALIZED                                                                                                                                                                 |
      | items[1].days_before_deadline   | 0                                                                                                                                                                         |
      | items[1].contributors_count     | 0                                                                                                                                                                         |
      | items[1].comments_count         | 0                                                                                                                                                                         |

  Scenario: As a non logged-in user I can order ideas by number of comments
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?commentsCount=asc"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 4                                                                                  |
      | metadata.items_per_page         | 2                                                                                  |
      | metadata.count                  | 2                                                                                  |
      | metadata.current_page           | 1                                                                                  |
      | metadata.last_page              | 2                                                                                  |
      | items[0].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                               |
      | items[0].name                   | Reduire le gaspillage alimentaire                                                  |
      | items[0].themes[0].id           | 3                                                                                  |
      | items[0].themes[0].name         | Écologie                                                                           |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png          |
      | items[0].category.id            | 1                                                                                  |
      | items[0].category.name          | Echelle Européenne                                                                 |
      | items[0].category.enabled       | 1                                                                                  |
      | items[0].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                               |
      | items[0].author.nickname        |                                                                                    |
      | items[0].author.first_name      | Michel                                                                             |
      | items[0].author.last_name       | V.                                                                                 |
      | items[0].published_at           | @string@.isDateTime()                                                              |
      | items[0].finalized_at           | @string@.isDateTime()                                                              |
      | items[0].committee              |                                                                                    |
      | items[0].votes_count.important  | 0                                                                                  |
      | items[0].votes_count.feasible   | 0                                                                                  |
      | items[0].votes_count.innovative | 0                                                                                  |
      | items[0].votes_count.total      | 0                                                                                  |
      | items[0].author_category        | ELECTED                                                                            |
      | items[0].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                   |
      | items[0].created_at             | @string@.isDateTime()                                                              |
      | items[0].slug                   | reduire-le-gaspillage-alimentaire                                                  |
      | items[0].status                 | FINALIZED                                                                          |
      | items[0].days_before_deadline   | 0                                                                                  |
      | items[0].contributors_count     | 0                                                                                  |
      | items[0].comments_count         | 0                                                                                  |
      | items[1].uuid                   | bbf35ba6-52ba-4913-aae8-5948449d0c1d                                               |
      | items[1].name                   | Reduire le bruit dans les opens spaces                                             |
      | items[1].themes[0].id           | 3                                                                                  |
      | items[1].themes[0].name         | Écologie                                                                           |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png          |
      | items[1].category.id            | 1                                                                                  |
      | items[1].category.name          | Echelle Européenne                                                                 |
      | items[1].category.enabled       | 1                                                                                  |
      | items[1].needs[0].id            | 1                                                                                  |
      | items[1].needs[0].name          | Juridique                                                                          |
      | items[1].needs[0].enabled       | 1                                                                                  |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                               |
      | items[1].author.nickname        |                                                                                    |
      | items[1].author.first_name      | Michel                                                                             |
      | items[1].author.last_name       | V.                                                                                 |
      | items[1].published_at           | @string@.isDateTime()                                                              |
      | items[1].finalized_at           | @string@.isDateTime()                                                              |
      | items[1].committee              |                                                                                    |
      | items[1].votes_count.important  | 0                                                                                  |
      | items[1].votes_count.feasible   | 0                                                                                  |
      | items[1].votes_count.innovative | 0                                                                                  |
      | items[1].votes_count.total      | 0                                                                                  |
      | items[1].author_category        | ELECTED                                                                            |
      | items[1].description            | Curabitur sed leo nec massa lobortis pretium sed ac lacus. In aliquet varius ante. |
      | items[1].created_at             | @string@.isDateTime()                                                              |
      | items[1].slug                   | reduire-le-bruit-dans-les-opens-spaces                                             |
      | items[1].status                 | PENDING                                                                            |
      | items[1].days_before_deadline   | 8                                                                                  |
      | items[1].contributors_count     | 0                                                                                  |
      | items[1].comments_count         | 0                                                                                  |

  Scenario: As a non logged-in user I can order ideas by number of votes
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?order[votesCount]=asc"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 4                                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                                         |
      | metadata.count                  | 2                                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                                         |
      | metadata.last_page              | 2                                                                                                                                                                         |
      | items[0].uuid                   | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                   | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id           | 3                                                                                                                                                                         |
      | items[0].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                                         |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname        | kikouslove                                                                                                                                                                |
      | items[0].author.first_name      |                                                                                                                                                                           |
      | items[0].author.last_name       |                                                                                                                                                                           |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee              |                                                                                                                                                                           |
      | items[0].votes_count.important  | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative | 0                                                                                                                                                                         |
      | items[0].votes_count.total      | 0                                                                                                                                                                         |
      | items[0].author_category        | ADHERENT                                                                                                                                                                  |
      | items[0].description            | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                   | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].status                 | FINALIZED                                                                                                                                                                 |
      | items[0].days_before_deadline   | 0                                                                                                                                                                         |
      | items[0].contributors_count     | 2                                                                                                                                                                         |
      | items[0].comments_count         | 2                                                                                                                                                                         |
      | items[1].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                                                                                                                      |
      | items[1].name                   | Reduire le gaspillage alimentaire                                                                                                                                         |
      | items[1].themes[0].id           | 3                                                                                                                                                                         |
      | items[1].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[1].category.id            | 1                                                                                                                                                                         |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled       | 1                                                                                                                                                                         |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                      |
      | items[1].author.nickname        |                                                                                                                                                                           |
      | items[1].author.first_name      | Michel                                                                                                                                                                    |
      | items[1].author.last_name       | V.                                                                                                                                                                        |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee              |                                                                                                                                                                           |
      | items[1].votes_count.important  | 0                                                                                                                                                                         |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[1].votes_count.innovative | 0                                                                                                                                                                         |
      | items[1].votes_count.total      | 0                                                                                                                                                                         |
      | items[1].author_category        | ELECTED                                                                                                                                                                   |
      | items[1].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                                                                                                          |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                   | reduire-le-gaspillage-alimentaire                                                                                                                                         |
      | items[1].status                 | FINALIZED                                                                                                                                                                 |
      | items[1].days_before_deadline   | 0                                                                                                                                                                         |
      | items[1].contributors_count     | 0                                                                                                                                                                         |
      | items[1].comments_count         | 0                                                                                                                                                                         |

  Scenario: As a non logged-in user I can order ideas by number of contributors
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?contributorsCount=asc?page=2"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 4                                                                                                                                                                         |
      | metadata.items_per_page         | 2                                                                                                                                                                         |
      | metadata.count                  | 2                                                                                                                                                                         |
      | metadata.current_page           | 1                                                                                                                                                                         |
      | metadata.last_page              | 2                                                                                                                                                                         |
      | items[0].uuid                   | c14937d6-fd42-465c-8419-ced37f3e6194                                                                                                                                      |
      | items[0].name                   | Réduire le gaspillage                                                                                                                                                     |
      | items[0].themes[0].id           | 3                                                                                                                                                                         |
      | items[0].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[0].category.id            | 1                                                                                                                                                                         |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[0].category.enabled       | 1                                                                                                                                                                         |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                      |
      | items[0].author.nickname        | kikouslove                                                                                                                                                                |
      | items[0].author.first_name      |                                                                                                                                                                           |
      | items[0].author.last_name       |                                                                                                                                                                           |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[0].committee              |                                                                                                                                                                           |
      | items[0].status                 | FINALIZED                                                                                                                                                                 |
      | items[0].votes_count.important  | 0                                                                                                                                                                         |
      | items[0].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[0].votes_count.innovative | 0                                                                                                                                                                         |
      | items[0].votes_count.total      | 0                                                                                                                                                                         |
      | items[0].author_category        | ADHERENT                                                                                                                                                                  |
      | items[0].description            | In nec risus vitae lectus luctus fringilla. Suspendisse vitae enim interdum, maximus justo a, elementum lectus. Mauris et augue et magna imperdiet eleifend a nec tortor. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[0].slug                   | reduire-le-gaspillage                                                                                                                                                     |
      | items[0].days_before_deadline   | 0                                                                                                                                                                         |
      | items[0].contributors_count     | 2                                                                                                                                                                         |
      | items[0].comments_count         | 2                                                                                                                                                                         |
      | items[1].uuid                   | 982bd810-a3ef-4611-a998-ebfadc335d66                                                                                                                                      |
      | items[1].name                   | Reduire le gaspillage alimentaire                                                                                                                                         |
      | items[1].themes[0].id           | 3                                                                                                                                                                         |
      | items[1].themes[0].name         | Écologie                                                                                                                                                                  |
      | items[1].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/ecology.png                                                                                                 |
      | items[1].category.id            | 1                                                                                                                                                                         |
      | items[1].category.name          | Echelle Européenne                                                                                                                                                        |
      | items[1].category.enabled       | 1                                                                                                                                                                         |
      | items[1].author.uuid            | 46ab0600-b5a0-59fc-83a7-cc23ca459ca0                                                                                                                                      |
      | items[1].author.nickname        |                                                                                                                                                                           |
      | items[1].author.first_name      | Michel                                                                                                                                                                    |
      | items[1].author.last_name       | V.                                                                                                                                                                        |
      | items[1].published_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].finalized_at           | @string@.isDateTime()                                                                                                                                                     |
      | items[1].committee              |                                                                                                                                                                           |
      | items[1].status                 | FINALIZED                                                                                                                                                                 |
      | items[1].votes_count.important  | 0                                                                                                                                                                         |
      | items[1].votes_count.feasible   | 0                                                                                                                                                                         |
      | items[1].votes_count.innovative | 0                                                                                                                                                                         |
      | items[1].votes_count.total      | 0                                                                                                                                                                         |
      | items[1].author_category        | ELECTED                                                                                                                                                                   |
      | items[1].description            | Morbi massa lacus, pulvinar ac eros in, imperdiet egestas velit.                                                                                                          |
      | items[1].created_at             | @string@.isDateTime()                                                                                                                                                     |
      | items[1].slug                   | reduire-le-gaspillage-alimentaire                                                                                                                                         |
      | items[1].days_before_deadline   | 0                                                                                                                                                                         |
      | items[1].contributors_count     | 0                                                                                                                                                                         |
      | items[1].comments_count         | 0                                                                                                                                                                         |

  Scenario: As a non logged-in user I can filter ideas by author category
    Given I add "Accept" header equal to "application/json"
    When I send a "GET" request to "/api/ideas-workshop/ideas?authorCategory=COMMITTEE"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | metadata.total_items            | 1                                                                                                                                                                    |
      | metadata.items_per_page         | 2                                                                                                                                                                    |
      | metadata.count                  | 1                                                                                                                                                                    |
      | metadata.current_page           | 1                                                                                                                                                                    |
      | metadata.last_page              | 1                                                                                                                                                                    |
      | items[0].uuid                   | e4ac3efc-b539-40ac-9417-b60df432bdc5                                                                                                                                 |
      | items[0].name                   | Faire la paix                                                                                                                                                        |
      | items[0].themes[0].id           | 1                                                                                                                                                                    |
      | items[0].themes[0].name         | Armées et défense                                                                                                                                                    |
      | items[0].themes[0].thumbnail    | http://test.enmarche.code/assets/images/ideas_workshop/themes/default.png                                                                                            |
      | items[0].category.id            | 1                                                                                                                                                                    |
      | items[0].category.name          | Echelle Européenne                                                                                                                                                   |
      | items[0].category.enabled       | 1                                                                                                                                                                    |
      | items[0].needs[0].id            | 1                                                                                                                                                                    |
      | items[0].needs[0].name          | Juridique                                                                                                                                                            |
      | items[0].needs[0].enabled       | 1                                                                                                                                                                    |
      | items[0].author.uuid            | a046adbe-9c7b-56a9-a676-6151a6785dda                                                                                                                                 |
      | items[0].author.nickname        | kikouslove                                                                                                                                                           |
      | items[0].author.first_name      |                                                                                                                                                                      |
      | items[0].author.last_name       |                                                                                                                                                                      |
      | items[0].published_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].finalized_at           | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.uuid         | 515a56c0-bde8-56ef-b90c-4745b1c93818                                                                                                                                 |
      | items[0].committee.created_at   | @string@.isDateTime()                                                                                                                                                |
      | items[0].committee.name         | En Marche Paris 8                                                                                                                                                    |
      | items[0].committee.slug         | en-marche-paris-8                                                                                                                                                    |
      | items[0].status                 | PENDING                                                                                                                                                              |
      | items[0].votes_count.important  | 7                                                                                                                                                                    |
      | items[0].votes_count.feasible   | 5                                                                                                                                                                    |
      | items[0].votes_count.innovative | 5                                                                                                                                                                    |
      | items[0].votes_count.total      | 17                                                                                                                                                                   |
      | items[0].author_category        | COMMITTEE                                                                                                                                                            |
      | items[0].description            | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec maximus convallis dolor, id ultricies lorem lobortis et. Vivamus bibendum leo et ullamcorper dapibus. |
      | items[0].created_at             | @string@.isDateTime()                                                                                                                                                |
      | items[0].slug                   | faire-la-paix                                                                                                                                                        |
      | items[0].days_before_deadline   | 13                                                                                                                                                                   |
      | items[0].contributors_count     | 8                                                                                                                                                                    |
      | items[0].comments_count         | 13                                                                                                                                                                   |
