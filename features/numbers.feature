@numbers
Feature: As a user I want to convert numbers from and to different formats

    @wip
    Scenario: Decimal to Roman numerals conversion
        Given I am in the "Numbers" screen by swiping down
        And I have selected "Decimal" as base numbers
        And I have selected "Roman numerals" as the conversion type
        When I enter "10" on the keyboard and see "X" in the conversion section
        
