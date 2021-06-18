Feature: Log in

    Background:
        Given user has an account
        And user logged out

    Scenario: User logs in with email
        Given user is on Log in #4 screen
        And signed up with email
        And filled out email input filed
        And filled out password input field
        When user taps on log in button
        Then user navigates to Home - signed in #7 screen

    Scenario Outline: User wants to log in with one of their other accounts
        Given User is on Log in screen
        When taps on "<log in option>" button
        Then navigates to Home - signed in #7 screen

        Example:
            | log in option        |
            | Log in with Facebook |
            | Log in with Google   |
            | Log in with Apple    |