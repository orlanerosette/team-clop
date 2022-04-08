require 'pg'

class Default

  def self.account
    @account = Account.create(first_name: "Sam", 
    last_name: "Smith", 
    email: "samsmith@gmail.com", 
    password: "testPassword")
  end

  def self.beach_villa_listing
    @beach_villa_listing = Listing.create(owner_id: @account.account_id, 
    name: "Clop Villa", 
    description: "A beautiful private villa situated on
     the northern most coast of Cape Code.", 
     price: "200")
  end

  def self.beach_villa_availability
    @beach_villa_availability = Availability.create(
      listing_id: @beach_villa_listing.listing_id, 
      availability_start: "2022-04-14", 
      availability_end: "2022-07-26") 
  end

  def self.city_apartment_listing
    @city_apartment_listing = Listing.create(
      owner_id: @account.account_id, 
      name: "Clop Apartment", 
      description: "A modern studio in the heart of 
      the bright and bustling city Cloptopia.", 
      price: "100")
  end

  def self.city_apartment_availability
    @city_apartment_availability = Availability.create(
      listing_id: @city_apartment_listing.listing_id, 
      availability_start: "2022-04-20", 
      availability_end: "2022-06-20") 
  end
end
