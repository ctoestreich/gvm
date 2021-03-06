@review
Feature: Forced Offline Mode

  Scenario: Enable Offline Mode with internet reachable
    Given the internet is reachable
    And offline mode is disabled
    When I enter "gvm offline enable"
    Then I see "AEROPLANE MODE ENABLED!"
    When I enter "gvm install grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in aeroplane mode."

  Scenario: Disable Offline Mode with internet reachable
    Given the internet is reachable
    And offline mode is enabled
    When I enter "gvm offline disable"
    Then I see "ONLINE MODE RE-ENABLED!"
    When I enter "gvm install grails 2.1.0" and answer "Y"
    Then I see "Done installing!"
    And the candidate "grails" version "2.1.0" is installed

  Scenario: Disable Offline Mode with internet unreachable
    Given the internet is not reachable
    And offline mode is enabled
    When I enter "gvm offline disable"
    Then I see "AEROPLANE MODE ENABLED!"
    When I enter "gvm install grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in aeroplane mode."
