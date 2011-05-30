require 'spec_helper'

describe PagesController do

  describe "GET 'hellochart'" do
    it "should be successful" do
      get 'hellochart'
      response.should be_success
    end
  end

end
