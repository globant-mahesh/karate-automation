Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    #    Js function
    And def getRandomNum = function() {return Math.floor(100 * Math.random());}
    And def jobId = getRandomNum()
    And print 'jobId', jobId
#    Read request json file with embedded expression
    And def requestBody = read('../testdata/postJobRequest.json')
    And print 'requestBody==>', requestBody.jobId
    And request requestBody
#    Read response json file with embedded expression
    And def expectedResponse = read('../testdata/postJobResponse.json')
#    And def expectedSchema = read('../testdata/postJobResponseSchema.json')
    And print expectedResponse

    And def idValue = function(reqId, resId) { return reqId == resId; }

  Scenario: Validate expected response from file
    Given path '/normal/webapi/add'
    When method post
    Then status 201
#    And print 'response is :\n', response
    And match response == expectedResponse


  Scenario: Validate expected response from schema file
    Given path '/normal/webapi/add'
    When method post
    Then status 201
    And print 'response jobId is :\n', response.jobId
    And def id = response.jobId
    And match response == expectedResponse
#    Schema validation
    And match response ==
    """
    {
  "jobId": "#number",
  "jobTitle": "#string",
  "jobDescription": "#string",
  "experience": "#[4]",
  "project": [
    {
      "projectName": "#string",
      "technology": "#[3] #string? _.length <= 10"
    }
  ]
}
    """
    And match idValue(jobId, id) == true