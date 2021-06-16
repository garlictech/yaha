Feature: Sign up

    Background:
        Given User doesn't have an account

    Scenario Outline: User wants to explore some hikes
        Given User is on Home screen
        When taps on "<button name>" button
        Then Log in window pops up

        Example:
            | button name   |
            | Explore hikes |
            | Explore       |

    Scenario: User wants to sign up
        Given User has Log in window opened up
        When taps on Log in button
        Then navigates to Log in screen

    Scenario: User wants to see their sign up options
        Given User is on Log in screen
        When taps on Sign up button
        Then navigates to Sign up screen

    Scenario: User wants to sign up with email
        Given User is on Sign up screen
        * filled out Name input field
        * filled out Email input field
        * filled out Password input field
        * filled out Password again input field
        When taps on Sign up button
        Then navigates to Home - new user screen

    Scenario Outline: User wants to sign up with one of their other accounts
        Given User is on Sign up screen
        When taps on "<sign up option>" button
        Then navigates to Home - new user screen

        Example:
            | sign up option        |
            | Sign up with Facebook |
            | Sign up with Google   |
            | Sign up with Apple    |



Feature: Find hikes

    Background:
        Given User has an account
        And is logged in

    Scenario Outline: User wants to explore some hikes
        Given User is on Home screen
        When taps on "<button name>" button
        Then navigates to Explore screen

        Example:
            | button name   |
            | Explore hikes |
            | Explore       |

    Scenario: User wants to search for hike
        Given User typed in the name of the hike in the search for hike field
        When taps on Search button
        Then navigates to Search results screen

    Scenario: User wants to search for location
        Given User typed in the location in the search around location field
        When taps on Search button
        Then navigates to Search results screen

    Scenario: User wants to search near their current location
        Given User allowed for the app to use their current location
        When taps on current location icon in search around location field
        Then navigates to Search results screen

    Scenario: User wants to see filtering options
        Given User typed in a location in the search around location field
        When taps on filters icon
        Then Filters window pops up

    Scenario: User wants to apply the filters
        Given User set some filters in the Filters window
        When taps on Show results button
        Then navigates to Search results screens

    Scenario: User wants to reset filters
        Given User set some filters in the filters window
        When taps on Reset button
        Then filter go back to default