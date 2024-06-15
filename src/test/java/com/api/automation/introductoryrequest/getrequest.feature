Feature: Test Feature

  Background:
#    base-url
    Given url 'http://localhost:9191'

  Scenario: Get all the details of webapi
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: Get all the details of webapi in json format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
#    And print 'response is :\n', response
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep {"project" : [{"projectName": "Movie App"}]}

  Scenario: Get all the details of webapi in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print 'response is :\n', response
#    And match response contains deep {"<jobDescription>To develop andriod application</jobDescription>"}
