require 'pg'

class Availability
  attr_reader :availability_id, :listing_id, :availability_start, :availability_end

  def initialize(availability_id:, listing_id:, availability_start:, availability_end:) 
    @availability_id = availability_id
    @listing_id = listing_id
    @availability_start = availability_start
    @availability_end = availability_end
  end

  def self.create(listing_id:, availability_start:, availability_end:) 
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    availability = connection.exec_params "INSERT INTO availability 
    (listing_id, availability_start, availability_end) 
    VALUES ($1, $2, $3) 
    RETURNING availability_id, listing_id, availability_start, availability_end;", 
    [listing_id, availability_start, availability_end]
    Availability.new(availability_id: availability[0]["listing_id"], 
    listing_id: availability[0]["listing_id"], 
    availability_start: availability[0]["availability_start"], 
    availability_end: availability[0]["availability_end"])
  end

  def self.convert_date(date)
  end
end
