@meta_weather
  
Feature: MetaWeather API tests
  
  Background: setup base URL
    * url 'https://www.metaweather.com/api/'

  Scenario: Search for London
    Given path '/location/search'
    And param query = 'London'
    When method get 
    Then status 200
    And match response[0] contains {title: 'London'}
    And match each response contains {title:'London'}


    @meta_weather2
    Scenario Outline: Verify that <query> city exist
      Given path '/location/search'
      And param query = '<query>'
      When method get
      Then status 200
      And match response[0] contains {title: '<query>'}
      And match each response contains {title:'<query>'}
      * print karate.pretty(response)


      Examples:
        | query    |
        | New York |
        | London   |
        | Moscow   |
    