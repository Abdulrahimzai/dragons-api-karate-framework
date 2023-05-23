@smoke
Feature: Create End To End Account Test

  Background: API Test Setup
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create Account
    * def dataGenerator = Java.type('api.data.GeneratedData')
    * def emailAdderssData = dataGenerator.getEmail()
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "email": "#(emailAdderssData)",
      "firstName": "Karati",
      "lastName": "Karatione",
      "title": "Mr",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "student",
      "dateOfBirth": "1998-08-09"
      }
      """
    When method post
    Then status 201
    And print response
     And assert response.email == emailAdderssData
     And assert response.firstName == "Karati"
    * def generatedAccountid = response.id
    
    Given url "https://tek-insurance-api.azurewebsites.net"
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = generatedAccountid
    And header Authorization = "Bearer " + generatedToken
    * def randomPhonNumber = dataGenerator.getPhoneNumber()
    And request
      """
      {
      "phoneNumber": "#(randomPhonNumber)",
      "phoneExtension": "199",
      "phoneTime": "08:00",
      "phoneType": "cell phone"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == randomPhonNumber
    * def generatedAccountid = response.id
    Given url "https://tek-insurance-api.azurewebsites.net"
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = generatedAccountid
    And header Authorization = "Bearer " + generatedToken
    * def licensePlateNum = dataGenerator.GetLicensePlate()
    And request
      """
      {
      "make": "Toyota",
      "model": "Camry",
      "year": "2022",
      "licensePlate": "#(licensePlateNum)"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.licensePlate == licensePlateNum
    * def generatedAccountid = response.id
    Given url "https://tek-insurance-api.azurewebsites.net"
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = generatedAccountid
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "addressType": "Home",
      "addressLine1": "87833 pulm ave",
      "city": "sacramento",
      "state": "CA",
      "postalCode": "95843",
      "countryCode": "916",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressLine1 == "87833 pulm ave"
    
   