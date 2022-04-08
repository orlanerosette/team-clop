require 'pg'

RSpec.describe ".create" do
  it "creates a booking" do
    account = Account.create(first_name: "Sam", last_name: "Smith", email: "samsmith@gmail.com", password: "testPassword")
    listing = Listing.create(owner_id: account.account_id, name: "Townhouse", description: "A beautiful townhouse", price: "100")
    availability = Availability.create(listing_id: listing.listing_id, availability_start: "2022-04-14", availability_end: "2022-04-20") 
    booking = Booking.create(listing_id: listing.listing_id, customer_id: account.account_id, booking_start: "2022-04-15", booking_end: "2022-04-19", status: 2)
    expect(booking).to be_a Booking
    expect(booking.booking_start).to eq "2022-04-15"
    expect(booking.booking_end).to eq "2022-04-19"
  end
end
