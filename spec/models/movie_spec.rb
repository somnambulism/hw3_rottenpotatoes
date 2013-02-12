require 'spec_helper'

describe Movie do
  describe 'looking for movies by director of given movie' do
    it 'should return movies with same director as given movie' do
      movie1 = Movie.create!(:title => 'movie1', :director => 'test')
      movie2 = Movie.create!(:title => 'movie2', :director => 'test')
      movie3 = Movie.create!(:title => 'movie2', :director => 'test1')
      Movie.find_similar(movie1.id).should == [movie1, movie2]
    end
  end
end