@SmokeTest
Feature: Test Feature for validation of request with JWT Token

  Background: To setup the url & header
#    base-url
    Given url baseUrl
    And headers {}

  Scenario: Generate JWT token random user details
    Given path '/auth/webapi/all'
    * def randomUser = call read('authuserCreatorPost.feature')
    * def password = randomUser.password
    * def username = randomUser.username
    * def featureOutput = call read('createTokenForRandomUserPost.feature') {password : '#(password)', username : '#(username)'}
    * def token = 'Bearer ' + featureOutput.response.token
    * headers {Authorization : '#(token)', Accept : 'application/json', Content-Type : 'application/json'}
    #    Read request json file with embedded expression

    When method get
    Then status 200