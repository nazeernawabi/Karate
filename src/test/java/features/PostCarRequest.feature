Feature: Add a car request

  # 1. call the post request scenario
  # 2. add a car to that acccount
  @addCar
  Scenario: add car
    Given url appURL
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def postRequest = callonce read("EndToEnd.feature")
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