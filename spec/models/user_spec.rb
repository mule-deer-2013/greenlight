require 'spec_helper'

describe User do 
  let(:valid_user) {User.new(name: "Richie", age: "25", sex: "male", sex_preference: "women", tagline: "GET SOME" )}
  
    it "can create an account" do 
      valid_user.should be_valid 
    end
  

end
