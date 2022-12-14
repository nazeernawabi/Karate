Feature: Put Request

  Scenario: Update Car test
    Given url appURL
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def postRequest = callonce read("PostCarRequest.feature")
    * def idValue = postRequest.response.id
    * param primaryPersonId = idValue
    * path "api/accounts/add-account-car"
    * request
      """
      {
      "id": 0,
      "make": "Toyota",
      "model": "corrolla",
      "year": "1998",
      "licensePlate": "TEK1155"
      }
      """
    * method post
    * print response
