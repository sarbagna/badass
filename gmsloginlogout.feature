Feature: Site Login
        To perform a login we need to enter userid password and hit submit on specific URL

@SmokeTest @RegressionTest
Scenario Outline: Login     
    Given User is at Login Page
    And User enters "<username>" and "<password>"
    And User hits Login
    Then User sees a "<status>" page

@SmokeTest @RegressionTest
Scenario: Logout
    Given User is already Logged in
    And Dasboard is visible
    When user clicks the logout button
    Then user is logged out
    And moved back to GMS login screen
    
Examples:     
|username|password|status|
|arijit|Tokyo.2222|Invalid user or password|
|arijit|Tokyo.2020|Dashboard panel|

