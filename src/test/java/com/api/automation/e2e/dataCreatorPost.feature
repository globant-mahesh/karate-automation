Feature: Test Feature for validation of json data

  Background: To setup the url & header
#    base-url
    Given url 'http://localhost:9191'
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario: Validate expected response as per CSV file <statusCode>
    Given path '/normal/webapi/add'
    * print jobId
    #    Read request json file with embedded expression
    And def requestBody = read('postJobRequest.json')
    And print 'requestBody==>', requestBody.jobId
    And request requestBody

    When method post
    Then status 201
    And def jobTitle = response.jobTitle
    And def jobDescription = response.jobDescription

#    Read response json file with embedded expression
#    And def expectedResponse = read('../testdata/postJobResponse.json')
#    And def expectedSchema = read('../testdata/postJobResponseSchema.json')
#    And print expectedResponse


