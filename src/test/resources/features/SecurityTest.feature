@Test
Feature: API TEst Security Section
 
 Background: Setup Request URL
 Given url "https://tek-insurance-api.azurewebsites.net" 
 And path "/api/token" 

 Scenario: Create token with valid username and password. 
 #prepare request  
 And request {"username": "supervisor","password": "tek_supervisor"} 
 #Send request 
 When method post 
 #Validating response 
 Then status 200 
 And print response
 Scenario: Create token with invalid username and password
 And request {"username": "supervisore","password": "tek_supervisor"}
 When method post
 Then status 400
 And print response
 And assert response.errorMessage == "User not found"
 Scenario: Create token with valid username and invalid password
 And request {"username": "supervisor","password": "tek_supervisore"}
 When method post
 Then status 400
 And print response
 And assert response.errorMessage == "Password Not Matched"
 And assert response.httpStatus == "BAD_REQUEST"

 