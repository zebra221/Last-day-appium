@history
Feature: As a user I want to check if history after conversion is being saved

    @rip
    Scenario: Conversion history
        Given I create history item in the history section
        And The numbers are saved
        When I am in the "History" screen by swiping up
        And I see that conversions are being saved correctly