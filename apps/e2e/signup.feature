Feature: Sign up

    Background:
        Given user doesn't have an account

    Scenario: User wants to sign up with email - 1
        Given user is on Sign up #5 screen
        When taps on Sign up with email button
        Then navigates to Sign up with email screen

    Scenario: User wants to sign up with email - 2
        Given User is on Sign up with email #6 screen
        * filled out Name input field
        * filled out Email input field
        * filled out Password input field
        * filled out Password again input field
        When taps on Sign up button
        Then navigates to Home - new user screen

    Scenario Outline: User wants to sign up with one of their other accounts
        Given User is on Sign up #5 screen
        When taps on "<sign up option>" button
        Then navigates to Home - new user screen

        Example:
            | sign up option        |
            | Sign up with Facebook |
            | Sign up with Google   |
            | Sign up with Apple    |