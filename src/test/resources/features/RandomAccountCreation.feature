@Regression
Feature: Random Account Creation

Background: Setup Test Generate Token

  * def tokenFeature = callonce read('GenerateToken.feature')
  * def token = tokenFeature.response.token;
  Given url "https://tek-insurance-api.azurewebsites.net"
  Scenario: Create Account with Random Email
  # call Java pakage and class and Method with Karate.
  * def dataGenerator = Java.type('api.data.GeneratedData')
  * def autoEmail = dataGenerator.getEmail()
   Given path "/api/accounts/add-primary-account"
  And header Authorization = "Bearer " + token
  
   And request 
  """
  {
  "email": "#(autoEmail)",
  "firstName": "Karati",
  "lastName": "Karatione",
  "title": "Mr",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "student",
  "dateOfBirth": "1988-05-11"
  }
  """
  When method post
  Then status 201
  And print response
  And assert response.email == autoEmail