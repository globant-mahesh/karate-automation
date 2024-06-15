Feature: Cleanup of resource with Delete

  Background: To setup the url & header
#    base-url
    Given url 'http://localhost:9191'
    And headers {Accept : 'application/json'}

  Scenario: Validate expected response as per CSV file <statusCode>
    Given path '/normal/webapi/remove/' + jobId
    * print 'jobId', jobId
    When method delete
    Then status 200