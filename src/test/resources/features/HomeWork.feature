Feature: Get Account API

Background: Setup Test API
 Given url "https://tek-insurance-api.azurewebsites.net"
 
 Scenario: Get Account API call with existing account
 Given path "/api/token"
 And request {"username": "supervisor","password": "tek_supervisor"} 
 When method post 
 Then status 200 
 And print response
 #def step is to define new variable in Karate Framework
 * def generatedToken = response.token
 Given path "/api/accounts/get-account"
 And param primaryPersonId = 6818
 And header Authorization = "Bearer " + generatedToken
 When method get
 Then status 200
 And print response
 And assert response.primaryPerson.id == 6818
 And assert response.primaryPerson.email == "farhadabdul@gamil.com"
 

