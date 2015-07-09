require 'rails_helper'

describe "Users" do

  let(:json) { JSON.parse(response.body) }

  describe "GET /users/:id" do
    
    let(:user) { User.create(name: "Foo") }
    
    before do
      get "/users/#{user.id}"
    end

    it "returns user by id" do
      expect(response).to be_success
      expect(json["id"]).to be user.id
    end

    it "returns user with name" do
      expect(response).to be_success
      expect(json["name"]).to eq "Foo"
    end

    it "returns 404 for user that doesn't exist" do
      get '/users/missing'
      expect(response).to be_missing
    end
  end
end
