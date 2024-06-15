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
#    Create Test data using POST
    And def postData = call read('dataCreatorPost.feature') {jobId: #(jobId)}
    And def jobTitle = postData.jobTitle + jobId
    And def jobDescription = postData.jobDescription + jobId
    And print "jobId: ", jobId, "jobTitle: ", jobTitle, "jobDescription: ", jobDescription

  @E2E
  Scenario: Validate E2E create test data, update using PATCH & delete test data
#    PATCH on test data path param:
    Given path '/normal/webapi/update/details'
    And params {id:#(jobId), jobTitle:#(jobTitle), jobDescription:#(jobDescription)}
    #    PATCH request with empty body
    And def requestBody = {}
    And request requestBody
#    Read response json file with embedded expression
    And def expectedResponse = read('patchResponse.json')
#    And def expectedSchema = read('../testdata/postJobResponseSchema.json')
    And print 'responseBody==>', expectedResponse
    And def idValue = function(reqId, resId) { return reqId == resId; }

    When method patch
    Then status 200
#    And print 'response is :\n', response
    And match response == expectedResponse
    And call read('dataCleanupDelete.feature') {jobId:#(jobId)}
