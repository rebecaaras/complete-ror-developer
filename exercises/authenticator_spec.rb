require "rspec"
require_relative "./authenticator"

RSpec.describe Authenticator do
  context "when credentials are correct" do
    it "returns the user" do
      user = described_class.new.auth_user("mashkur", "password1")
      expect(user).to eq ({username: "mashkur", password: "password1"})
    end
  end

  context "when credentials are incorrect" do
    it "returns the 'Incorrect credentials'" do
      user = described_class.new.auth_user("incorrect_user", "incorrectpwd")
      expect(user).to eq ("Incorrect credentials")
    end
  end

end
