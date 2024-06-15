Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'

  Scenario: Validate file upload API with file in same directory
    Given path '/normal/webapi/upload'
    #    Location, filename, header
    And multipart file file = {read:'FileUpload.txt', filename:'FileUpload.txt', Content-type : 'multipart/form-data'}
    When method post
    Then status 200

  Scenario: Validate file upload API with file in different directory
    Given path '/normal/webapi/upload'
    * def filepath = '../testData/postJobRequest.json'
    * def filename = 'postJobRequest.json'
    #    Location, filename, header
    And multipart file file = {read:'#(filepath)', filename:'#(filename)', Content-type : 'multipart/form-data'}
    When method post
    Then status 200
    * match response.message contains filename