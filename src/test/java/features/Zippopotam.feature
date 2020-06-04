@Zippo
Feature: Basic tests for Zippopotam

  Background: setup
    * url 'https://api.zippopotam.us/'
    * header Accept = 'application/json'

  Scenario: Search for Beverly Hills
    Given path '/us/11104'
    When method get
    Then status 200
    And match response.country == 'United States'
    And match response.places[0].['place name'] == 'Sunnyside'
    * print karate.pretty(response)

  Scenario Outline: Search for <city>

    Given path '/us/<zip_code>'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.country == 'United States'
    And match response.places[0].['place name'] == '<city>'
    And match response.places[0].['state abbreviation'] == '<state_abbreviation>'
    * print karate.pretty(response)

    Examples: test data
      | city           | zip_code | state_abbreviation |
      | New York City | 10001    | NY                 |
      | Washington     | 20002    | DC                 |
      | Pompano Beach  | 33063    | FL                 |
      | Agawam         | 01001    | MA                 |



