require 'spec_helper'

describe MoviesController do
  describe 'looking for movies with a same director' do
    before :each do
      @fake_results = [mock('Movie'), mock('Movie')]
    end
    it 'should call the model method that performs search for movie with same director' do
      Movie.should_receive(:find_similar).with("1").and_return(@fake_results)
      post :similar, {:id => 1}
    end
    describe 'movies found' do
      before :each do
        Movie.stub(:find_similar).and_return(@fake_results)
        post :similar, {:id => 1}
      end
      it 'should select similar movies template for rendering' do
        response.should render_template('similar')
      end
      it 'should make search results available to template' do
        assigns(:movies).should == @fake_results
      end
    end
  end
end