@OMDB

Feature: OMDB API test

  Background: setup base URL
    * url 'http://www.omdbapi.com/'

  Scenario: Search for specified movie
    Given param t = '2012'
    And param apikey = 'c2f7e9a5'
    When method get
    Then status 200
    * print karate.pretty(response)

  Scenario Outline: Search for <movie> movie

    Given param t = '<movie>'
    And param apikey = 'c2f7e9a5'
    When method get
    Then status 200
    And match response contains {Title: '<movie>'}
    * print karate.pretty(response)

    Examples: test data
      | movie         |
      | Karate Kid    |
      | Lord of the Rings |
      | Naruto        |
      | The Gentlemen     |
