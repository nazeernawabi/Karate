Feature: Schema Validation

  @schemaValidation
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
    * match response ==
      """
      {
      "id": '#number',
      "email": '#string',
      "title": '#string',
      "firstName": '#string',
      "lastName": '#string',
      "gender": '#string',
      "maritalStatus": '#string',
      "employmentStatus": '#string',
      "dateOfBirth": '#ignore',
      "user": '#null'
      }
      """
      * def idvalue = response.id 
      * match idvalue == '#number'