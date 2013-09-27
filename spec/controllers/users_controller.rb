require 'spec_helper'

describe UsersController do 

  describe "GET #index" do 

    it "should render the index page" do
      get :index
      response.should render_template :index
    end
  end



end
