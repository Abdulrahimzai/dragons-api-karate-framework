Feature: Create Account Test

 Background: API Test Setup
 # callonce read is Karate Step to execute and read another feature file.
 #the result of callonce can store into new variable using def step.
  * def result = callonce read('GenerateToken.feature')
  And print result
  * def generatedToken = result.response.token
  Given url "https://tek-insurance-api.azurewebsites.net"
  @Regression
 Scenario: Create Account
  Given path "/api/accounts/add-primary-account"
  And header Authorization = "Bearer " + generatedToken
  And request 
  """
  {
  "email": "Mmohammad55@gmail.com",
  "firstName": "MohhamdN",
  "lastName": "N",
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
  And assert response.email == "Mmohammad55@gmail.com"
  Scenario: Delete Account
  Given path "/api/accounts/delete-account"
  And header Authorization = "Bearer " + generatedToken
  And param primaryPersonId = 4586
  When method delete
  Then status 200
  And print response
  