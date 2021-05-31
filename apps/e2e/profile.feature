Feature: Profile

Background:
    Given user has an account
    And is logged in
    And is on profile screen

Scenario: User wants to change some settings
    When user taps on settngs icon
    Then navigates to settings screen

Scenario: User wants to see bookmarked hikes
    When taps on bookmarked hikes
    Then navigates to bookmarked hikes page

Scenario: User wants to see events
    When user taps on events
    Then navigates to events screen

Scenario: User wants to see challenges
    When user taps on challenges
    Then navigates to challenges screen

Scenario: User wants to see their statistics
    Given user has completed at least 1 hike
    When taps on statistics
    Then navigates to statistics screen

Scenario: User wants to see their TimeCapsules
    Given user found or placed at least 1 TimeCapsule
    When taps on TimeCapsules
    Then navigates to TimeCapsules screen



Feature: Settings

Background:
    Given user has an account
    And is logged in
    And is on settings screen

Scenario: User wants to edit profile
    When user taps on edit profile
    Then navigates to edit profile screen

Scenario: User wants to see notifications
    When user taps on notifications
    Then navigates to notifications screen

Scenario: User wants to change language settings
    When user taps on language
    Then navigates to language screen

Scenario: User wants to manage their offline maps
    When user taps on offline maps
    Then navigates to offline maps screen

Scenario: User needs some help or wants to give feedback
    When user taps on help and feedback
    Then navigates to help and feedback screen

Scenario: User wants to read privacy policy
    When user taps on privacy policy
    Then navigates to privacy policy screen

Scenario: User wants to read terms and conditions
    When user taps on terms and conditions
    Then navigates to terms and conditions screen

Scenario: User wants to upgrade to premium
    Given user is not a premium user
    When taps on upgrade to premium button
    Then navigates to upgrade to premium screen

Scenario: User wants to log out
    When user taps on log out button
    Then navigates to log in screen



Feature: Bookmarked hikes

Scenario: User wants to see one of their bookmarked hikes
    Given user bookmarked at least 1 hike
    And is on bookmarked hikes screen
    When taps on of the bookmarked hikes
    Then navigates to hike page



Feature: Events

Background:
    Given user has an account
    And is logged in

Scenario: User wants to see going events
    Given user is on All events screen
    When taps on Going events
    Then navigates to going events screen

Scenario: User wants to see all events
    Given user is on Going events screen
    When taps on All events
    Then navigates to all events screen

Scenario: User wants to see an event
    Given user is on All or Going events screen
    When taps on an event
    Then navigates to event details screen

Scenario: User wants to apply to an event
    Given user is on event details screen
    And not applied to the event
    When user taps on apply button
    Then successful application window pops up
    And user is applied to the event

Scenario: User wants to check out one of the prizes of an event
    Given user is on event details screen
    When taps on one of the prizes
    Then navigates to prize details screen



Feature: Challenges

Background:
    Given user has an account
    And is logged in

Scenario: User wants to see their challenges
    Given user is on All challenges screen
    When taps on My challenges
    Then navigates to My challenges screen

Scenario: User wants to see all challenges
    Given user is on My challenges screen
    When taps on All challenges
    Then navigates to All challenges screen

Scenario: User wants to see a challenge
    Given user is on All or My challenges screen
    When taps on a challenge
    Then navigates to challenge details screen

Scenario: User wants to apply to a challenge
    Given user is on challenge details screen
    And not applied to the challenge
    When user taps on apply button
    Then text on apply button changes to applied

Scenario: User wants to check out one of the prizes of a challenge
    Given user is on challenge details screen
    When taps on one of the prizes
    Then navigates to prize details screen



Feature: Statistics

Scenario: User wants to check out one of their statistics in detail
    Given user has an account
    And is logged in
    And is on statistics screen
    And completed at least 1 hike
    When taps on one of the statistics
    Then navigates to statistics details screen



Feature: TimeCapsules

Background:
    Given user has an account
    And is logged in
    And is on TimeCapsules screen

Scenario: User wants to see their TimeCapsules
    Given user is on Found TimeCapsules screen
    When taps on My TimeCapsules
    Then navigates to My TimeCapsules screen

Scenario: User wants to see found TimeCapsules
    Given user is on My TimeCapsules screen
    When taps on Found
    Then navigates to Found screen