require 'spec_helper'

describe User do 
  let(:valid_user) { User.new(name: "Richie", age: "25", sex: "male", sex_preference: "women", email: "richie@gmail.com", tagline: "GET SOME") }
   
  it { should validate_presence_of (:email) }
  it { should validate_uniqueness_of (:email) }
  it { should validate_presence_of (:name) }
  it { should validate_presence_of (:age) }
  it { should validate_presence_of (:sex) }
  it { should validate_presence_of (:sex_preference) }

  it "can create an account" do 
    expect(valid_user.name).to eq("Richie")
  end

end
