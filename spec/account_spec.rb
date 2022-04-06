require 'pg'

RSpec.describe ".create" do
  it "creates an account" do
    account = Account.create(first_name: "Chris", last_name: "Rock", email: "Chrisrock@gmail.com", password: "testPassword")
  expect(account).to be_a Account
  end
end

  