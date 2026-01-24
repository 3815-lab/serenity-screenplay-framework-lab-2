Feature: PetStore Workflow
  Check the full lifecycle of a pet: create, retrieve, update, and search.

  Background:
    * url baseUrl
    * def PetDataGenerator = Java.type('com.sofka.petstore.utils.PetDataGenerator')
    * def petRequest = read('classpath:com/sofka/petstore/data/pet_request.json')

  Scenario: Create and manage a pet lifecycle
    # Create a new pet with dynamic data
    * def petData = PetDataGenerator.getPetData()
    * def petId = petData.id
    * def petName = petData.name
    
    Given path 'pet'
    And request petData
    When method post
    Then status 200
    And match response.id == petId
    And match response.name == petName
    
    # Verify the pet exists
    Given path 'pet', petId
    When method get
    Then status 200
    And match response.id == petId
    And match response.name == petName
    
    # Update status to 'sold'
    * def newName = 'Sold_' + petName
    * set petData.name = newName
    * set petData.status = 'sold'
    
    Given path 'pet'
    And request petData
    When method put
    Then status 200
    And match response.id == petId
    And match response.status == 'sold'
    And match response.name == newName
    
    # Find by status and verify update
    Given path 'pet', 'findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    * def isMyPet = function(x){ return x.id == petId }
    * def found = karate.filter(response, isMyPet)
    And match found[0].id == petId
    And match found[0].status == 'sold'
    And match found[0].name == newName
