require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exe("TRUNCATE accounts, listings, availability, bookings;")
end
