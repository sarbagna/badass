Feature: Site Login
        To perform a login we need to enter userid password and hit submit on specific URL

@SmokeTest @RegressionTest
Scenario Outline: Login 
    Given User is at Login Page
    And User enters "<username>" and "<password>"
    And User hits Login
    Then User sees a "<status>" page
    
Examples:     
|username|password|status|
|arijit|Tokyo.2222|Login Page|
|arijit|Tokyo.2020|Dashboard Page|

