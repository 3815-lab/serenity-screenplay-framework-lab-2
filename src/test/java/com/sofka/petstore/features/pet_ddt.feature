Feature: PetStore Data-Driven Tests
  Validate pet creation and retrieval using external datasets.

  Background:
    * url baseUrl

  Scenario Outline: Create and verify pet using CSV data
    * def petData =
    """
    {
      "id": <id>,
      "name": "<name>",
      "category": { "id": 1, "name": "Pets" },
      "photoUrls": ["https://example.com/photo.jpg"],
      "tags": [{"id": 0, "name": "test-tag"}],
      "status": "<status>"
    }
    """

    # 1. Create Pet
    Given path 'pet'
    And request petData
    When method post
    Then status 200
    And match response.name == "<name>"
    And match response.status == "<status>"

    # 2. Retrieve Pet by ID
    Given path 'pet', <id>
    When method get
    Then status 200
    And match response.id == <id>
    And match response.name == "<name>"

    Examples:
      | read('classpath:com/sofka/petstore/data/pet_variants.csv') |
