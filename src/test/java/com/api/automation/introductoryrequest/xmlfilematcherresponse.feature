Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'
    And def expectedResponse = read('../testadata/getresponse.xml')
    And print 'expectedResponse: ', expectedResponse

  Scenario: Get all the details of webapi
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: Get all the details of webapi in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
#    And print 'response is :\n', response
    And match response == expectedResponse