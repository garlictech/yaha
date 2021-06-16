Feature: Log in

    Background:
        Given user has an account
        And user logged out

    Scenario: User logs in with email
        Given user signed up with email
        And user filled out email input filed
        And password input field
        When user presses log in button
        Then user navigates to Home - new user screen

    Scenario Outline: User wants to log in with one of their other accounts
        Given User is on Log in screen
        When taps on "<log in option>" button
        Then navigates to Home - new user screen

        Example:
            | log in option        |
            | Log in with Facebook |
            | Log in with Google   |
            | Log in with Apple    |