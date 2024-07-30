require 'rails_helper'

RSpec.describe RpsGameController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #result" do
    let(:valid_choice) { 'rock' }

    it "returns a success response" do
      get :result, params: { id: valid_choice }
      expect(response).to be_successful
    end

    it "sets the user choice" do
      get :result, params: { id: valid_choice }
      expect(assigns(:user_choice)).to eq(valid_choice)
    end

    it "sets the server choice" do
      allow_any_instance_of(RpsGameService::Main).to receive(:generated_bet).and_return(:scissors)
      get :result, params: { id: valid_choice }
      expect(assigns(:server_choice)).to eq(:scissors)
    end

    it "sets the result" do
      allow_any_instance_of(RpsGameService::Main).to receive(:result).and_return(:user)
      get :result, params: { id: valid_choice }
      expect(assigns(:result)).to eq(:user)
    end
  end
end
