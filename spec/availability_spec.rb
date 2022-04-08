require 'pg'

RSpec.describe ".create" do
  it "creates an availability" do
    account = Account.create(first_name: "Sam", last_name: "Smith", email: "samsmith@gmail.com", password: "testPassword")
    listing = Listing.create(owner_id: account.account_id, name: "Townhouse", description: "A beautiful townhouse", price: "100")
    availability = Availability.create(listing_id: listing.listing_id, availability_start: "2022-04-14", availability_end: "2022-04-20") 
    expect(availability).to be_a Availability
    expect(availability.listing_id).to eq listing.listing_id
    expect(availability.availability_start).to eq "2022-04-14"
    expect(availability.availability_end).to eq "2022-04-20"
  end
end
