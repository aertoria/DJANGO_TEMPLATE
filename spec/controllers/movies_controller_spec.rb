require 'spec_helper'

describe MoviesController do
  describe 'dir' do
    it 'should be given movie_title and movie_director' do
       fake_results = [mock('movie_result')]
       post :dir, {:movie_director => 'Ridley Scott', :movie_title => 'Blase Runner'}
    end
  end

  describe 'destory' do
     m = Movie.new()
     
  end

  describe 'create' do
     it 'should create a new movie' do
        
     end
  end
end
