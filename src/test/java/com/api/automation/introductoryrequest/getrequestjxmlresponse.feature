Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'

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
    And match response.List.item.experience.experience[1] == 'Apple'
    And match response.List.item.experience.experience contains ["Google","Apple","Mobile Iron"]
    * print "===> ", response.List.item.project.project.technology.technology[2]
    And match response.List.item.project.project.technology.technology[2] == 'Gradle'
    And match response.List.item.project.project.technology.technology contains ["Kotlin", "SQL Lite"]

  Scenario: Get all the details of webapi in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
#    And print 'response is :\n', response
    And match response.List.item.experience.experience[1] == '#present'
    And match response.List.item.experience.randomfield == '#null'
    And match response.List.item.experience.experience contains '#array'
    * print "===> ", response.List.item.project.project.technology.technology[2]
    And match response.List.item.project.project.technology.technology[2] == '#string'
    And match response.List.item.project.project.technology.technology[2] == '#ignore'
    And match response.List.item.project.project.technology.technology contains '#array'
#    Array is supported in the json path even when the response is xml
    And match response.List.item.project.project.technology.technology == '#array'
    ##    Fuzzy matcher with javascript
    And match response.List.item.experience.experience == '#array? _.length == 3'
    And match response.List.item.jobDescription == '#string? _.length <= 30'