Feature: Sign up

Background:
    Given user doesn't have an account

Scenario: User sign up with email
    Given user fills out Name input field
    * Email input field
    * Password input field
    * Password again input field
    And Password matches Password again
    When user presses Sign up button
    Then user sees her/his dashboard

Scenario: User sign up with Facebook
    Given user pressed Sign up with Facebook button
    When user gives her/his Facebook credentials
    Then user sees her/his dashboard

Scenario: User sign up with Google
    Given user pressed Sign up with Google button
    When user give her/his Google credentials
    Then user sees her/his dashboard

Scenario: User sign up with Apple
    Given user pressed Sign up with Apple button
    When user gives her/his Apple ID credentials
    Then user sees her/his dashboard