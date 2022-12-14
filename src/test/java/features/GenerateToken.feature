Feature: Token Generator for Insurance API
  Scenario: Generate a token for CSR portal
  Given url appURL
  * path "/api/token"
  * request {"username":"supervisor","password":"tek_supervisor"}
  * method post
  * print response.token
  * print response.fullName
  * status 200