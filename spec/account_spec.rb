require 'pg'

RSpec.describe ".create" do
  it "creates an account" do
    account = Account.create(first_name: "Chris", last_name: "Rock", email: "Chrisrock@gmail.com", password: "testPassword")
    expect(account).to be_a Account
    expect(account.first_name).to eq "Chris"
    expect(account.last_name).to eq "Rock"
    expect(account.email).to eq "Chrisrock@gmail.com"
    expect(account.password).to eq "testPassword"
  end
end

RSpec.describe "check" do
  it "returns true if the email & password are correct" do
    account = Account.create(first_name: "Chris", last_name: "Rock", email: "Chrisrock@gmail.com", password: "testPassword")
    expect(account).to be_a Account
    expect(account.check(email: account.email, password: account.password)).to eq true
  end
end

RSpec.describe "check" do
  it "returns false if the email & password are incorrect" do
    account = Account.create(first_name: "Chris", last_name: "Rock", email: "Chrisrock@gmail.com", password: "testPassword")
    expect(account).to be_a Account
    expect(account.check(email: account.email, password: "password")).to eq false
  end
end
