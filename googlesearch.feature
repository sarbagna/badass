Feature: Google Search
To perform a search, we need to enter search phrase and hit search on www.google.com

Scenario: Visit www.google.com and perform search
Given I am at www.google.com
When I enter atos in the search field
And I hit Google Search
Then I see a results page