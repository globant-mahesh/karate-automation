@SmokeTest
Feature: Test Feature

  Background:
#    base-url
    Given url 'http://localhost:9191'

  Scenario: Get all the details of secured get using credentials in json format
    Given path '/secure/webapi/all'
    And def authorization = call read('./encoding.js') {username: 'admin', password:'welcome'}
    And print 'authorization ==>', authorization
    And headers {Accept : 'application/json', Authorization : '#(authorization)'}
    When method get
    Then status 200
#    And print 'response is :\n', response
    And match response == '#notnull'
