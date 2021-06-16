Feature: Track mode view

    Background:
        Given user has an account
        And is logged in
        And is on track mode screen

    Scenario: User wants to change map settings
        When user taps on map seetings button
        Then map settings window pops up

    Scenario: User wants to see their paused hikes
        Given user paused at least 1 hike
        And Where should we go widow is open
        When user taps on the arrow next to paused hikes
        Then navigates to paused hikes screen

    Scenario: User wants to see their bookmarked hikes
        Given user bookmarked at least 1 hike
        And Where should we go widow is open
        When user taps on the arrow next to bookmarked hikes
        Then navigates to bookmarked hikes screen

    Scenario: User wants to see hikes nearby
        Given user allowed for the app to use their current location
        And Where should we go widow is open
        When user taps on the location under nearby hikes
        Then navigates to search results screen



Feature: Track mode working

    Background:
        Given user has an account
        And is logged in
        And started or resumed a hike

    Scenario: User wants to finish hike before reaching the end
        Given user is on Map tab
        When taps on Finish hike button
        Then Are you sure window pops up

    Scenario: User wants to finish hike before reaching the end - confirm
        Given user taped on Finish hike button
        And Are you sure window popped up
        When user taps on Finish hike button
        Then navigates to summary screen

    Scenario: User wants to hide summary screen
        Given user is on summary screen
        When taps on done button
        Then navigates to home screen

    Scenario: User wants to see timeline
        When user taps on Timeline tab
        Then navigates to Timeline tab

    Scenario: User wants to rate a place
        Given user is on Timeline tab
        When taps on rating button
        Then rating window pops up

    Scenario: User wants to report a danger
        Given user is on Map or Timeline tab
        When taps on danger button
        Then danger report options pops up

    Scenario: User wants to report a danger that can't be fit into any of the pre-made categories
        Given user opened danger report options
        When taps on other button
        Then danger report other window pops up

    Scenario: User wants to customise timeline
        Given user is on Timeline tab
        When taps on settings button
        Then customsie timeline window pops up

    Scenario: User wants to see their data during hiking
        When user taps on Data tab
        Then navigates to Data tab

    Scenario: User wants to create a TimeCapsule
        When user taps on TimeCapsules tab
        Then navigates to TimeCapsules tab

    Scenario: User wants to see the map
        When user taps on Map tab
        Then navigates to Map tab

    Scenario: User finishes a hike by completing the route
        When user finishes a hike by completing the route
        Then navigates to finished hike screen

    Scenario: User wants to see their summary
        Given is on finished hike screen
        When user taps once on the screen
        Then navigates to summary screen