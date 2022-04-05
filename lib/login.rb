class Login
  attr_reader :email, :password

  def initialize (email, password) 
    @email = email 
    @password = password  
  end

  def check
    email = 'will.smith@slap.co.uk'
    password = 'ilovechrisrock2022' 
    return true if @email == email && @password == password
  end

end

