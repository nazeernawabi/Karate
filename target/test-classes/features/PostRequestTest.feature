Feature: Post Request Tests

Background: 
    Given url appURL
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"

  Scenario: Verify Post Request Method
    * request
      """
      {
      "email":"Taker@tekschool.com",
      "firstName":"Dave",
      "lastName":"Chepel",
      "title":"MR",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "1970-01-20"
      }
      """
    * method post
    * status 201
    * print response

  @postCall
  Scenario: post Request with Faker data
    #first we need to define a variable to read the java class
    #second we need to define a variable to call each static method from that class
    * def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dateOfBirth = generator.getDob()
    * def title = generator.getTitle()
    * request
      """
      {
      "email":"#(email)",
      "firstName":"#(firstName)",
      "lastName":"#(lastName)",
      "title":"#(title)",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "#(dateOfBirth)"
      }
      """
    * method post
    * status 201
    * print response
    * match response.email == email
    * match response.firstName == "#(firstName)"
    * match response.lastName != firstName    
    


  











