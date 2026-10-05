require_relative '../modules/auth'

class Student
  include Auth
  attr_accessor :first_name, :last_name, :email, :username, :password

  def initialize( first_name, last_name, email, username, password)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    @password = password
  end

  def to_s
    "First name: #{@first_name}\nLast name: #{@last_name}\nUsername: #{@username}\nemail address: #{@email}"
  end
end
