require 'pg'

feature ".account" do
  scenario "creates a default account" do
    account = Default.account
    expect(account).to be_a Account
    expect(account.first_name).to eq "Sam"
    expect(account.last_name).to eq "Smith"
    expect(account.email).to eq "samsmith@gmail.com"
    expect(account.password).to eq "testPassword"
  end
end

feature ".beach_villa_listing" do
  scenario "creates a default beach villa listing" do
    account = Default.account
    beach_villa_listing = Default.beach_villa_listing
    expect(beach_villa_listing).to be_a Listing
    expect(beach_villa_listing.owner_id).to eq account.account_id
    expect(beach_villa_listing.name).to eq "Clop Villa"
    expect(beach_villa_listing.description).to eq "A beautiful private villa situated on the northern most coast of Cape Code."
    expect(beach_villa_listing.price).to eq 200
  end
end

feature ".beach_villa_availability" do
  scenario "creates a default beach villa availability" do
    account = Default.account
    beach_villa_listing = Default.beach_villa_listing
    beach_villa_availability = Default.beach_villa_availability
    expect(beach_villa_availability).to be_a Availability
    expect(beach_villa_availability.listing_id).to eq beach_villa_listing.listing_id
    expect(beach_villa_availability.availability_start).to eq "2022-04-14"
    expect(beach_villa_availability.availability_end).to eq "2022-07-26"
  end
end

feature ".city_apartment_listing" do
  scenario "creates a default city apartment listing" do
    account = Default.account
    city_apartment_listing = Default.city_apartment_listing
    expect(city_apartment_listing).to be_a Listing
    expect(city_apartment_listing.owner_id).to eq account.account_id
    expect(city_apartment_listing.name).to eq "Clop Apartment"
    expect(city_apartment_listing.description).to eq "A modern studio in the heart of the bright and bustling city Cloptopia."
    expect(city_apartment_listing.price).to eq 100
  end
end

feature ".city_apartment_availability" do
  scenario "creates a default city apartment availability" do
    account = Default.account
    city_apartment_listing = Default.city_apartment_listing
    city_apartment_availability = Default.city_apartment_availability
    expect(city_apartment_availability).to be_a Availability
    expect(city_apartment_availability.listing_id).to eq city_apartment_listing.listing_id
    expect(city_apartment_availability.availability_start).to eq "2022-04-20"
    expect(city_apartment_availability.availability_end).to eq "2022-06-20" 
  end
end
