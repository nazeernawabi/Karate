Feature: Verify TEK Insurance Token

Background: 
* url appURL
* def token = call read("GenerateToken.feature")
* def tokenValue = token.response.token
* path "/api/token/verify"


Scenario: Verify Valid Token
* param token = tokenValue
* param username = "supervisor"
* method get
* status 200
* print response
* match response == "true"

 

Scenario: Verify invalid username
* param token = tokenValue
* param username = "teacher"
*	method get
* print response
* status 400
* match response.errorMessage == "Wrong Username send along with Token"

Scenario: Verify invalid token with Valid userName
* param token = "invalid value"
* param username = "supervisor"
* method get
* print response
* status 400
* match response.errorMessage == "Token Expired or Invalid Token"








