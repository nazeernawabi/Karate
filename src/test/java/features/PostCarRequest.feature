Feature: Add a car request

  # 1. call the post request scenario
  # 2. add a car to that acccount
  @addCar
  Scenario: add car
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def postRequest = call read("PostRequestTest.feature")
    * def idValue = postRequest.response.id
    * param primaryPersonId = idValue
    * path "api/accounts/add-account-car"
    * request
      """
      {
      "id": 0,
      "make": "Toyota",
      "model": "corrolla",
      "year": "1997",
      "licensePlate": "TEK1122"
      }
      """
      * method post
      * print response