require 'rails_helper'

RSpec.describe ErrorMessage do
  describe "Error Message PORO" do
    it "sends back the correct attributes" do
      message = "User cannot be added as a friend."
      status_code = 400
      error = ErrorMessage.new(message, status_code)

      expect(error).to be_a ErrorMessage

      expect(error.message).to be_a(String)
      expect(error.message).to eq("User cannot be added as a friend.")

      expect(error.status_code).to be_an(Integer)
      expect(error.status_code).to eq(400)
    end
  end
end