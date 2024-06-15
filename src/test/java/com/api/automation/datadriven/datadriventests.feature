Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'
    And headers {Accept : 'application/json', Content-Type : 'application/json'}

  Scenario Outline: Validate expected response <statusCode>
    Given path '/normal/webapi/add'
    And def jobId = '<jobId>'
    And def jobTitle = '<jobTitle>'
    And def jobDescription = '<jobDescription>'
    #    Read request json file with embedded expression
    And def requestBody = read('../testdata/postJobRequest.json')
    And print 'requestBody==>', requestBody.jobId
    And request requestBody

    When method post
    Then status <statusCode>
#    Read response json file with embedded expression
#    And def expectedResponse = read('../testdata/postJobResponse.json')
#    And def expectedSchema = read('../testdata/postJobResponseSchema.json')
#    And print expectedResponse

    Examples:
      | jobId | jobTitle     | jobDescription       | statusCode |
      | 4     | QA Architect | Design the framework | 201        |
      | 5     | QA Lead      | Mange Test Suites    | 201        |
      | sdf   | QA Lead      | Mange Test Suites    | 400        |

  Scenario Outline: Validate expected response as per CSV file <statusCode>
    Given path '/normal/webapi/add'
    * print jobId
    #    Read request json file with embedded expression
    And def requestBody = read('../testdata/postJobRequest.json')
    And print 'requestBody==>', requestBody.jobId
    And request requestBody

    When method post
    Then status <statusCode>
#    Read response json file with embedded expression
#    And def expectedResponse = read('../testdata/postJobResponse.json')
#    And def expectedSchema = read('../testdata/postJobResponseSchema.json')
#    And print expectedResponse

    Examples:
      | read('postTestData.csv') |

