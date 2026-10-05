module Auth
  require 'bcrypt'

  def create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  def authenticate_user(username, password, secured_users)
    secured_users.each do |user_record|
      return user_record if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
    end
    "Incorrect credentials"
  end
end
