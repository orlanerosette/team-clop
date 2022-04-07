require 'pg'

class Account
  attr_reader :account_id, :first_name, :last_name, :email, :password

  def initialize(account_id:, first_name:, last_name:, email:, password:) 
    @account_id = account_id
    @first_name = first_name
    @last_name = last_name
    @email = email 
    @password = password  
  end

  def self.create(first_name:, last_name:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
      account = connection.exec_params "INSERT INTO accounts (first_name, last_name, email, password) VALUES ($1, $2, $3, $4) RETURNING user_id, first_name, last_name, email, password;", [first_name, last_name, email, password]
      Account.new(account_id: account[0]["user_id"], first_name: account[0]["first_name"], last_name: account[0]["last_name"], email: account[0]["email"], password: account[0]["password"])
  end

  def check(email:, password:)
    return true if @email == email && @password == password
    return false
  end
end
