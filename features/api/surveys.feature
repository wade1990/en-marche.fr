@api
Feature:
  In order to get all surveys
  As a non logged-in user
  I should be able to access to the surveys configuration and be able to answer to it

  Background:
    Given the following fixtures are loaded:
      | LoadJecouteSurveyData |
      | LoadClientData        |
      | LoadOAuthTokenData    |

  Scenario: As a non logged-in user I cannot get the surveys
    When I send a "GET" request to "/api/jecoute/survey"
    Then the response status code should be 401

  Scenario: As a logged-in user I can get the surveys of my referent(s)
    Given I am logged with "michelle.dufour@example.ch" via OAuth client "J'écoute" with scope "jecoute_surveys"
    When I send a "GET" request to "/api/jecoute/survey"
    Then the response status code should be 200
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | [0].id                              | 1                                                    |
      | [0].questions[0].id                 | 1                                                    |
      | [0].questions[0].type               | simple_field                                         |
      | [0].questions[0].content            | Ceci est-il un champ libre ?                         |
      | [0].questions[1].id                 | 2                                                    |
      | [0].questions[1].type               | multiple_choice                                      |
      | [0].questions[1].content            | Est-ce une question à choix multiple ?               |
      | [0].questions[1].choices[0].id      | 1                                                    |
      | [0].questions[1].choices[0].content | Réponse A                                            |
      | [0].questions[1].choices[1].id      | 2                                                    |
      | [0].questions[1].choices[1].content | Réponse B                                            |
      | [0].questions[2].id                 | 3                                                    |
      | [0].questions[2].type               | unique_choice                                        |
      | [0].questions[2].content            | Est-ce une question à choix unique ?                 |
      | [0].questions[2].choices[0].id      | 3                                                    |
      | [0].questions[2].choices[0].content | Réponse unique 1                                     |
      | [0].questions[2].choices[1].id      | 4                                                    |
      | [0].questions[2].choices[1].content | Réponse unique 2                                     |
      | [0].questions[3].id                 | 4                                                    |
      | [0].questions[3].type               | simple_field                                         |
      | [0].questions[3].content            | Ceci est-il un champ libre d'une question suggérée ? |
      | [0].name                            | Questionnaire numéro 1                               |
      | [0].city                            | Paris 1er                                            |

  Scenario: As a logged-in user I can reply to a survey
    Given I am logged with "michelle.dufour@example.ch" via OAuth client "J'écoute" with scope "jecoute_surveys"
    And I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    When I send a "POST" request to "/api/jecoute/survey/reply" with body:
    """
    {
      "survey":1,
      "lastName":"Bonsoirini",
      "firstName":"Ernestino",
      "emailAddress":"ernestino@bonsoirini.fr",
      "agreedToStayInContact":true,
      "agreedToContactForJoin":true,
      "agreedToTreatPersonalData":true,
      "postalCode":"59000",
      "profession":"employees",
      "ageRange": "between_25_39",
      "gender": "male",
      "answers":[
        {
          "surveyQuestion":1,
          "textField":"Réponse libre"
        },
        {
          "surveyQuestion":2,
          "selectedChoices":[
            "1",
            "2"
          ]
        },
        {
          "surveyQuestion":3,
          "selectedChoices":[
            "1"
          ]
        }
      ]
    }
    """
    Then the response status code should be 201
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | status | ok |

  Scenario: As a logged-in user I can not reply to a survey that was no created by my referent(s)
    Given I am logged with "michelle.dufour@example.ch" via OAuth client "J'écoute" with scope "jecoute_surveys"
    And I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    When I send a "POST" request to "/api/jecoute/survey/reply" with body:
    """
    {
      "survey":2,
      "lastName":"Bonsoirini",
      "firstName":"Ernestino",
      "emailAddress":"ernestino@bonsoirini.fr",
      "agreedToStayInContact":true,
      "answers":[
        {
          "surveyQuestion":4,
          "textField":"Réponse libre"
        }
      ]
    }
    """
    Then the response status code should be 400
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | status           | error                          |
      | errors.survey[0] | Cette valeur n'est pas valide. |

  Scenario: As a logged-in user I cannot reply to a survey with errors
    Given I am logged with "michelle.dufour@example.ch" via OAuth client "J'écoute" with scope "jecoute_surveys"
    And I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    When I send a "POST" request to "/api/jecoute/survey/reply" with body:
    """
    {
      "survey":null,
      "lastName":"Bonsoirini",
      "firstName":"Ernestino",
      "emailAddress":"bonsoirini.fr",
      "agreedToStayInContact":true,
      "postalCode":"59",
      "profession":"bonsoir",
      "ageRange": "between_00_00",
      "answers":[
        {
          "surveyQuestion":1
        },
        {
          "surveyQuestion":2,
          "selectedChoices":[
            "1",
            "2"
          ]
        },
        {
          "surveyQuestion":3,
          "textField":"Réponse non autorisé",
          "selectedChoices":[
            "1",
            "2"
          ]
        }
      ]
    }
    """
    Then the response status code should be 400
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | status                              | error                                                                                     |
      | errors.survey[0]                    | Cette valeur ne doit pas être vide.                                                       |
      | errors.emailAddress[0]              | Cette valeur n'est pas une adresse email valide.                                          |
      | errors.profession[0]                | Cette valeur n'est pas valide.                                                            |
      | errors.ageRange[0]                  | Cette valeur n'est pas valide.                                                            |
      | errors.answers[0].surveyQuestion[0] | La question 1 est un champ libre et doit contenir un champ texte.                         |
      | errors.answers[2].surveyQuestion[0] | La question 3 est une question à choix unique et doit contenir un seul choix sélectionné. |
      | errors.answers[2].surveyQuestion[1] | La question 3 est une question à choix unique et ne doit pas contenir de champ texte.     |
      | errors.postalCode[0]                | Vous devez saisir exactement 5 caractères.                                                |

  Scenario: As a logged-in user I cannot reply to a survey with custom validations errors
    Given I am logged with "michelle.dufour@example.ch" via OAuth client "J'écoute" with scope "jecoute_surveys"
    And I add "Content-Type" header equal to "application/json"
    And I add "Accept" header equal to "application/json"
    When I send a "POST" request to "/api/jecoute/survey/reply" with body:
    """
    {
      "survey":1,
      "lastName":"Bonsoirini",
      "firstName":"Ernestino",
      "emailAddress":"ernestino@bonsoirini.fr",
      "agreedToStayInContact":false,
      "agreedToContactForJoin":true,
      "postalCode": "59000",
      "ageRange" : "foobar",
      "gender" : "other",
      "answers":[
        {
          "surveyQuestion":1,
          "textField":"Réponse libre"
        },
        {
          "surveyQuestion":2,
          "selectedChoices":[
            "1",
            "2"
          ]
        },
        {
          "surveyQuestion":3,
          "selectedChoices":[
            "1"
          ]
        }
      ]
    }
    """
    Then the response status code should be 400
    And the response should be in JSON
    And the JSON nodes should be equal to:
      | status                          | error                                                                   |
      | errors.ageRange[0]              | Cette valeur n'est pas valide.                                          |
      | errors.genderOther[0]           | Vous avez sélectionné un autre choix, ce champ est donc obligatoire.    |
      | errors.agreedToStayInContact[0] | Si vous acceptez d'adhérer, vous devez accepter que l'on vous contacte. |
