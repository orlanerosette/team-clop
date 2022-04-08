require 'pg'

class Listing
  attr_reader :listing_id, :owner_id, :name, :description, :price

  def initialize(listing_id:, owner_id:, name:, description:, price:) 
    @listing_id = listing_id
    @owner_id = owner_id
    @name = name 
    @description = description
    @price = price.to_f
  end

  def self.create(owner_id:, name:, description:, price:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    listing = connection.exec_params "INSERT INTO listings 
    (owner_id, name, description, price) 
    VALUES ($1, $2, $3, $4) 
    RETURNING listing_id, owner_id, name, description, price;", 
    [owner_id, name, description, price]
    Listing.new(listing_id: listing[0]["listing_id"],
    owner_id: listing[0]["owner_id"],
    name: listing[0]["name"],
    description: listing[0]["description"],
    price: listing[0]["price"])
  end
end
