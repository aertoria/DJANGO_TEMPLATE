require 'spec_helper'

describe MoviesController do
  describe 'dir' do
    it 'happy path: should call the model method in movie class and return list of movie object' do
      #m = stub_model(Movie)
      #Movie.stub(:sd_service).and_return{[m]}
      post 'dir', {:movie_director => 'Yi', :movie_title => 'SUMER'}
      assigns[:notes].should eq('good')
    end


     it 'sad path: should call the model method in movie class and return list of movie object' do
      #m = stub_model(Movie)
      #Movie.stub(:sd_service).and_return{[m]}
      post 'dir', {:movie_title => 'COOL'}
      assigns[:notes].should eq('COOL has no director')
      assigns[:movies].should eq([])
    end
  end
end





