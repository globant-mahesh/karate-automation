Feature: Test Feature for validation of json data

  Background: To setup the url & header
#    base-url
    Given url baseUrl
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario: Sign up random user details
    Given path '/users/sign-up'
    * def id = call read('randomNum.js')
    * def password = call read('randomStr.js') { length : 7 }
    * def username = call read('randomStr.js') { length : 7 }
    #    Read request json file with embedded expression
    And def requestBody = read('postUserRequest.json')
    And print 'requestBody==>', requestBody
    And request requestBody

    When method post
    Then status 200


