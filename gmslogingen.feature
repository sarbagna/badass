Feature: GMS Login and check game count
        After successful login, we click Games to see list of available games

@RegressionTest
Scenario Outline: GMS Login 
    Given User is at Login Page
    And User enters "<username>" and "<password>"
    And User hits Login
    Then User sees a "<status>" page
    
Examples:     
|username|password|status|
|arijit|Tokyo.2020|Dashboard Page|

Scenario: Open navigation menu based listing page
    Given User is Logged in to Dashboard Page
    And User clicks on primary link on the left hand nav  
    Then User sees linked tab opend with listing of primary menu