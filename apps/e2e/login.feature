Feature: Log in

Background:
    Given user has an account
    And user logged out

Scenario: User logs in with email
    Given user signed up with email
    And user filled out email input filed
    And password input field
    When user presses log in button
    Then user sees her/his dashboard

Scenario: User logs in with Facebook
    Given user signed up with Facebook
    When user presses Log in with Facebook button
    Then user sees her/his dashboard

Scenario: User logs in with Google
    Given user signed up with Google
    When user presses Log in with Google button
    Then user sees her/his dashboard

Scenario: User logs in with Apple
    Given user signed up with Apple
    When user presses Log in with Apple button
    Then user sees her/his dashboard