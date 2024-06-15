Feature: Test Feature for validation of request with JWT Token

  Background: To setup the url & header
#    base-url
    Given url baseUrl
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario: Generate JWT token random user details
    Given path '/users/authenticate'
    #    Read request json file with embedded expression
    And def requestBody = read('postGenerateJwtTokenRequest.json')
    And print 'requestBody==>', requestBody
    And request requestBody

    When method post
    Then status 200
    And print response