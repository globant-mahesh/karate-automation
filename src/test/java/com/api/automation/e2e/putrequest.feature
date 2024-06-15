@RegressionTest
Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    #    Js function
    And def getRandomNum = function() {return Math.floor(100 * Math.random());}
    And def jobId = getRandomNum()
    And print 'jobId', jobId
    And call read('dataCreatorPost.feature') {jobId: #(jobId)}

  Scenario Outline: Validate expected response from file
    Given path '/normal/webapi/add'
    #    Read request json file with embedded expression
    And def requestBody = read('putRequest.json')
    And print 'requestBody==>', requestBody
    And request requestBody
#    Read response json file with embedded expression
    And def expectedResponse = read('putResponse.json')
#    And def expectedSchema = read('../testdata/postJobResponseSchema.json')
    And print 'responseBody==>', expectedResponse
    And def idValue = function(reqId, resId) { return reqId == resId; }

    When method post
    Then status 201
#    And print 'response is :\n', response
    And match response == expectedResponse
    Examples:
      | read('putRequestTestData.csv') |