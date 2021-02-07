require "rails_helper"

RSpec.describe "Api::V1::RegistrationsControllers", type: :request do
  context "POST /api/v1/users" do
    it "should register new user" do
      user_params = attributes_for(:user)

      expect {
        post user_registration_path, params: { user: user_params }
      }.to change { User.count }.by(1)

      expect(response).to have_http_status(:success)
    end

    it "should raise validation error if invalid registration attempt" do
      user_params = attributes_for(:user, :invalid)

      expect {
        post user_registration_path, params: { user: user_params }
      }.to change { User.count }.by(0)

      expect(response.status).to eql(422)

      errors = json_body["errors"]

      expect(errors.fetch("email")).to eql(["can't be blank", "can't be blank"])
    end
  end
end
