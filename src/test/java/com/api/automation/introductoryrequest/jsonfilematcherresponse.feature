Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'
    And header Accept = 'application/json'
    And def expectedResponse = read('../testdata/getresponse.json')
    And def id = 80
#    And print expectedResponse

  Scenario: Get all the details of webapi
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: Get all the details of webapi in json format
    Given path '/normal/webapi/all'
    When method get
    Then status 200
#    And print 'response is :\n', response
#    And match response == expectedResponse
#    jsonPath to filter the json object & extract the field
    And def jobDescriptionOfGivenId = karate.jsonPath(response, "$[?(@.jobId == "+ id +")].jobDescription")
    * print 'jobDescriptionOfGivenId', jobDescriptionOfGivenId
    And match jobDescriptionOfGivenId == ['To lead a QA team of 15 resources']