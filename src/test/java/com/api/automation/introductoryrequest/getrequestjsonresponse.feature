Feature: Test Feature for validation of json data

  Background: To setup the url
#    base-url
    Given url 'http://localhost:9191'
    And header Accept = 'application/json'
    And def matcherexpr = '#[3] #string? _.length <= 8'

  Scenario: Get all the details of webapi
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: Get all the details of webapi in json format
    Given path '/normal/webapi/all'
    When method get
    Then status 200
#    And print 'response is :\n', response
    And match response[0].experience[1] == 'Apple'
    And match response[0].experience contains ["Google","Apple","Mobile Iron"]
    And match response[0].project[0].technology[2] == 'Gradle'
    And match response[0].project[0].technology contains ["Kotlin", "SQL Lite"]
#    Wild card use
    And match response[0].experience contains ["Google","Apple","Mobile Iron"]
    And match response[*].project[*].technology[2] == ['Gradle']

  Scenario: Get all the details of webapi in json format & validate response using fuzzy matcher
    Given path '/normal/webapi/all'
    When method get
    Then status 200
#    And print 'response is :\n', response
    And match response[0].experience[1] == '#present'
    And match response[0].experience[100] == '#notpresent'
    And match response[0].experience == '#array'
    And match response[0].project[0].technology[2] == '#string'
    And match response[0].jobId == '#number'
    And match response[0].project[0].technology contains '#array'
##    Wild card use
    * match response[0].experience contains '#array'
    * match response[*].project[*].technology[2] == '#array'
##    Fuzzy matcher with javascript
    And match response[0].jobId == '#number? _ == 1'
    And match response[0].jobTitle == '#? _ == `Software Engg`'
    And match response[0].experience == '#array? _.length == 3'
    And match response[0].jobDescription == '#string? _.length <= 30'
#    Combination of the fuzzy matcher
#    array
    And match response[0].project[0].technology == '#[3] #string'
#    array content type & length
    But match response[0].project[0].technology == '#[3] #string? _.length <= 8'
    And match response[0].project[0].technology == matcherexpr
    And print matcherexpr
