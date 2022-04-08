require 'pg'

class Booking
  attr_reader :booking_id, :listing_id, :customer_id, :booking_start, :booking_end, :status

  def initialize(booking_id:, listing_id:, customer_id:, booking_start:, booking_end:, status:) 
    @booking_id = booking_id
    @listing_id = listing_id 
    @customer_id = customer_id 
    @booking_start = booking_start 
    @booking_end = booking_end 
    @status = status.to_i
  end

  def self.create(listing_id:, customer_id:, booking_start:, booking_end:, status:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    booking = connection.exec_params "INSERT INTO bookings
    (listing_id, customer_id, booking_start, booking_end, status) 
    VALUES ($1, $2, $3, $4, $5) 
    RETURNING booking_id, listing_id, customer_id, booking_start, booking_end, status;", 
    [listing_id, customer_id, booking_start, booking_end, status]
    Booking.new(booking_id: booking[0]["booking_id"], 
    listing_id: booking[0]["listing_id"],
    customer_id: booking[0]["customer_id"],
    booking_start: booking[0]["booking_start"],
    booking_end: booking[0]["booking_end"],
    status: booking[0]["status"])
  end
end
