Feature: Search

Background:
    Given user has an account
    And is logged in
    And is on explore screen

Scenario: User wants to search for hike
    Given user typed in the name of the hike in the search for hike field
    When taps on search button
    Then navigates to search results screen

Scenario: User wants to search for location
    Given user typed in the location in the search around location field
    When taps on search button
    Then navigates to search results screen

Scenario: User wants to search near current location
    Given user allowed for the app to use their current location
    When taps on current location icon in search around location field
    Then navigates to search results screen

Scenario: User wants to search for one of the hikes or around location again they've already searched before
    Given user searched for at least one hike or around one location before
    When taps on one of the recents searches
    Then navigates to search results screen



Feature: Search around location filtering

Background:
    Given user has an account
    And is logged in
    And is on explore screen

Scenario: User wants to see filtering options
    Given user typed in a location in the search around location field
    When taps on filters icon
    Then filters window pops up

Scenario: User wants to apply filters
    Given user set some filters in the filters window
    When taps on show results button
    Then navigates to search results screens

Scenario: User wants to reset filters
    Given user set some filters in the filters window
    When taps on reset button
    Then filter go back to default