require 'pg'

RSpec.describe ".create" do
  it "creates a listing" do
  account = Account.create(first_name: "Sam", last_name: "Smith", email: "samsmith@gmail.com", password: "testPassword")

  listing = Listing.create(owner_id: account.account_id, name: "Townhouse", description: "A beautiful townhouse", price: "100")

  expect(listing).to be_a Listing
  expect(listing.owner_id).to eq account.account_id
  expect(listing.name).to eq "Townhouse"
  expect(listing.description).to eq "A beautiful townhouse"
  expect(listing.price).to eq 100
  end
end

  