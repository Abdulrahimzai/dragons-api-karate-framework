Feature: Add Account Test

  Background: Test Setup API
    * def tokenOne = callonce read('GenerateToken.feature')
    And print tokenOne
    * def generatedToken = tokenOne.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Add new primary account
    Given path "/api/accounts/add-primary-account"
    And header Autorization = "Bearer " + generatedToken
    And request
      """
      {
       "email": "sacvdcedGmss@Gmail.com",
       "firstName": "Xame",
       "lastName": "mike",
       "title": "MR.",
       "gender": "MALE",
       "maritalStatus": "MARRIED",
       "employmentStatus": "string",
       "dateOfBirth": "1996-05-11"
      }
      """
    When method post
    Then status 200
    And print response
