require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET index" do
    it "has a 200 status code - Admin" do
      sign_in create(:user, type: "Admin")
      get :index
      expect(response.status).to eq(200)
    end

    it "has a 200 status code - Normal" do
      sign_in create(:user, type: "Normal")
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns @users" do
      sign_in create(:user, type: "Normal")
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "has a 200 status code - Admin" do
      sign_in create(:user, type: "Admin")
      get :show, id: 1
      binding.pry
      expect(response.status).to eq(200)
    end

    it "has a 200 status code - Normal" do
      sign_in create(:user, type: "Normal")
      get :show
      expect(response.status).to eq(200)
    end

    it "assigns @users" do
      sign_in create(:user, type: "Admin")
      get :show
      expect(response).to render_template(:show)
    end
  end
end
