Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: movies in database

  Given the following movies have been added to RottenPotatoes:
  |title        |rating | director    	|release_date	|
  |Star Wars    |PG     |George Lucas	|1977-05-25 	|
  |Blade Runner |PG     |Ridley Scott 	|1982-06-25 	|
  |Alien        |R      |               |1979-05-25 	|
  |THX-1138     |R	|George Lucas 	|1971-03-11 	|

Scenario: add director to existing movie
  Given I have visited the Details about "Alien" page
  When I have edited the movie "Alien" to change the director to "Ridley Scott"
  And I am on the Rotten Potatoes home page
  Then I should see a movie list entry with title "Alien" and director  "Ridley Scott"

Scenario: find movie with same director
  Given I have visited the Details about "Star Wars" page
  When I have opted to view movies with the same director
  Then I should see a movie list entry with title "THX-1138" and director "George Lucas"
  But I should not see a movie list entry with title  "Blade Runner" and director "Ridley Scott"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I have visited the Details about "Alien" page
  Then  I should not see "Ridley Scott"
  When I have opted to view movies by the same director
  Then I should see "Alien has no director"