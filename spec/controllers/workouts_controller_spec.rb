require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  # Use Devise test helpers to log in a user before each test
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  let(:valid_attributes) {
    { name: "test name", date: "1/1/2000", caloriesburned: 1, duration: "1 Hour" }
  }

  let(:invalid_attributes) {
    { name: nil, date: nil, caloriesburned: nil, duration: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      Workout.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      workout = Workout.create! valid_attributes
      get :show, params: { id: workout.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      workout = Workout.create! valid_attributes
      get :edit, params: { id: workout.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new workout" do
        expect {
          post :create, params: { workout: valid_attributes }
        }.to change(Workout, :count).by(1)
      end

      it "redirects to the created workout" do
        post :create, params: { workout: valid_attributes }
        expect(response).to redirect_to(Workout.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { workout: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { name: "new test name", date: "1/2/2000", caloriesburned: 2, duration: "2 Hours" }
    }

    context "with valid params" do
      it "updates the requested workout" do
        workout = Workout.create! valid_attributes
        put :update, params: { id: workout.to_param, workout: new_attributes }
        workout.reload
        expect(workout.name).to eq("new test name")
        expect(workout.caloriesburned).to eq(2)
      end

      it "redirects to the workout" do
        workout = Workout.create! valid_attributes
        put :update, params: { id: workout.to_param, workout: valid_attributes }
        expect(response).to redirect_to(workout)
      end
      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          workout = Workout.create! valid_attributes
          put :update, params: { id: workout.to_param, workout: invalid_attributes }
          expect(response).to be_successful
        end
    end
end
end
end