# Completed step definitions for basic features: AddMovie, ViewDetails, EditMovie 

Given /^I am on the RottenPotatoes home page$/ do
  visit movies_path  
 end


 When /^I have added a movie with title "(.*?)" and rating "(.*?)"$/ do |title, rating|
  visit new_movie_path
  fill_in 'Title', :with => title
  select rating, :from => 'Rating'
  click_button 'Save Changes'
 end

 Then /^I should see a movie list entry with title "(.*?)" and rating "(.*?)"$/ do |title, rating| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title) && tr.has_content?(rating)
       result = true
       break
     end
   end  
   assert result
 end

####
####
####
####
#####this is part 1 ####capybara will navigate to this movies_path to checkout.
When /^I have visited the Details about "(.*?)" page$/ do |title|
   visit movies_path
   click_on "More about #{title}"
end


When /^I have edited the movie "(.*?)" to change the rating to "(.*?)"$/ do |movie, rating|
  click_on "Edit"
  select rating, :from => 'Rating'
  click_button 'Update Movie Info'
end

###Add director
When /^I have edited the movie "(.*?)" to change the director to "(.*?)"$/ do |movie, director|
  click_on "Edit"
  fill_in("movie_director", :with =>'director') ##This demostrates how haml is stupid.
  click_button 'Update Movie Info'
end

###And on potato page
And /^I am on the Rotten Potatoes home page$/ do
  visit movies_path  
end


###Then I should see whatever, with that stupid space matching
Then /^I should see a movie list entry with title (\s)?"(.*?)" and director (\s)?"(.*?)"$/ do |space1, title, space2, director|
  puts "You have seen title "+title+" with director "+director
  page.should have_content(title)
  page.should have_content(director)
end

Then /^I should not see a movie list entry with title (\s)?"(.*?)" and director (\s)?"(.*?)"$/ do |space1, title, space2, director|
  puts "You have not seen title "+title+" with director "+director
  page.should_not have_content(title)
  page.should_not have_content(director)
end


Then /^(?:|I )should see "([^"]*)"$/ do |text|
  puts "You can see"+text
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


#####Scenario 2nd
#####Scenario 2nd
#####Scenario 2nd
When /^I have opted to view movies with the same director$/ do
  click_on 'Find Movies With Same Director'
end


#####Scenario 3rd
#####Scenario 3rd
#####Scenario 3rd
Then /^I should not see "(.*?)"$/ do |something|
  puts "You did not see "+something
  page.should_not have_content(something)
end

When /^I have opted to view movies by the same director$/ do
  puts "We just clicked that button"
  click_on 'Find Movies With Same Director'
end


# New step definitions to be completed for HW3. 
# Note that you may need to add additional step definitions beyond these

##
# Add a declarative step here for populating the DB with movies.

Given /the following movies have been added to RottenPotatoes:/ do |movies_table|
  movie_hash={}
  movies_table.hashes.each do |movie|
    # Each returned movie will be a hash representing one row of the movies_table
    # The keys will be the table headers and the values will be the row contents.
    # You should arrange to add that movie to the database here.
    # You can add the entries directly to the databasse with ActiveRecord methodsQ
    Movie.create(movie)
  end
  puts "this list has been pushed to database successfully"
end



When /^I have opted to see movies rated: "(.*?)"$/ do |arg1|
  # HINT: use String#split to split up the rating_list, then
  # iterate over the ratings and check/uncheck the ratings
  # using the appropriate Capybara command(s)
  flunk "Unimplemented"
end

Then /^I should see only movies rated "(.*?)"$/ do |arg1|
  flunk "Unimplemented" 
end

Then /^I should see all of the movies$/ do
  flunk "Unimplemented"
end



