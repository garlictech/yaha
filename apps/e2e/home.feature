Feature: Notifications

Background:
    Given user has an account
    And is logged in

Scenario: User has notifications
    Given has notifications
    When user presses the notifications icon
    Then user sees her/his notifications

Scenario: User doesn't have notifications
    Given user doesn't have notifications
    When user presses the notifications icon
    Then user sees no notifications screen



Feature: Statistics

Scenario: User wants to see more statistics
    Given user has an account
    And is logged in
    When user taps on show more under statistics section
    Then navigates to the statistics screen



Feature: Previous activities

Background:
    Given user has an account
    And is logged in

Scenario: User wants to see one of the two latest previous activities
    Given user has completed at least 1 activity
    When user taps on one of the two latest previous actvities
    Then navigates to the summary screen of the activity

Scenario: User wants to see all the previous activities
    Given user has completed at least 3 activities
    When user taps on show more under previous hike section
    Then navigates to the previous activities screen



Feature: Continue hiking

Background:
    Given user has an account
    And user is logged in
    And user paused at least 1 hike

Scenario: User wants to continue a paused hike
    When user taps on the play button on the paused hike box
    Then continue the activity from where it was paused

Scenario: User wants to delete a paused hike
    When user taps on delete button
    Then the progress is deleted
    And hike is removed from continue hiking section