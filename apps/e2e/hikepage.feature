Feature: Customise hike

    Background:
        Given user has an account
        And is logged in
        And user is a premium user

    Scenario: User wants to see customisation options
        When user taps on customise hike button
        Then customise hike window pops up

    Scenario: User wants to customise start
        Given user oppened customise hike pop-up
        When types in or choose a date and time for start
        Then sees the estimations for the hike

    Scenario: User wants to customise finish
        Given user oppened customise hike pop-up
        When types in or choose a date and time for finish
        Then sees the estimations for the hike

    Scenario: User wants to save customisations
        Given user customised start or finish
        When taps on save button
        Then goes back to hike page

    Scenario: User wants to reset customisations
        Given user customised start or finish
        When user taps on reset button
        Then all fields go back to default



Feature: Start hike

    Scenario: User wants to start hike
        Given user has an account
        And is logged in
        When taps on start hike button
        Then navigates to track mode



Feature: Map

    Background:
        Given user has an account
        And is logged in

    Scenario: User wants to open full screen map
        When taps on expand button on map
        Then opens up map in full screen view

    Scenario: User wants to close full screen map
        Given user has full screen view opened up
        When taps on collapse button
        Then navigates back to hike page



Feature: Weather

    Background:
        Given user has an account
        And is logged in

    Scenario: User wants to see more details about the weather
        When user taps on show more button under weather section
        Then navigates to weather screen

    Scenario: User wants to quit weather view
        Given user opened up weather view
        When taps on back button
        Then goes back to hike page



Feature: Hike outline

    Background:
        Given user has an account
        And is logged in

    Scenario: User wants to view hike outline
        Given user is on a hike page
        When taps on hike outline button
        Then navigates to hike outline short screen

    Scenario: User wants to customise hike outline
        Given user is on hike outline page
        When taps on seetings icon
        Then customise hike outline window pops up

    Scenario: User wants to see POIs between checkpoints
        Given user opened customise hike outline pop up
        And turned show POIs between checkpoints toggle on
        And show natural phenomenons toggle is off
        When user taps on save button
        Then sees hike outline with POIs between checkpoints

    Scenario: User wants to see natural phenomenons
        Given user opened customise hike outline pop up
        And turned show natural phenomenons toggle on
        And show POIs between checkpoints toggle is off
        When user taps on save button
        Then sees hike outline with natural phenomenons

    Scenario: User wants to see both POIs between checkpoints and natural phenomenons
        Given user opened customise hike outline pop up
        And turned show natural phenomenons toggle on
        And turned show POIs between checkpoints toggle on
        When taps on save button
        Then sees hike outline with POIs between checkpoints and natural phenomenons

    Scenario: User wants to reset hike outline customisations
        Given user opened customise hike outline pop up
        And settings are not in default
        When user taps on reset button
        Then settings go back to default

    Scenario: User is unsure about what natural phenomenons are
        Given user opened customise hike outline pop up
        When taps on exclamation mark icon next to natural phenomenons
        Then hint window pops up

    Scenario: User is unsure about what POI categories mean
        Given user opened customise hike outline pop up
        When taps on exclamation mark icon next to POI categories
        Then hint window pops up



Feature: Bookmark hike

    Scenario: User wants to bookmark a hike
        Given User has an account
        And is logged in
        And is on hike page
        When taps on bookmark icon
        Then filled bookmark icon appears