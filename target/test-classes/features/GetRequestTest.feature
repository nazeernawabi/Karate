Feature: Get Request API Test
 
  Scenario: Get Account Test
    Given url appURL
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "/api/accounts/get-primary-account"
    * param primaryPersonId = 2521
    * method get
    * print response
    * status 200
    * def idValue = response.id
    * match idValue == 2521
    * match response.title == "Mr."
    * match response.firstName =="Alex"
    * match response.lastName =="ABC"
    
