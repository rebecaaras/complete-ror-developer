puts "Welcome to the authenticator"
25.times {print "-"} 
puts "\nThis program will take your input from the user and compare password."
puts "If password is correct, you will get back the user object."

@users = [
          {username: "mashkur", password: "password1"},
          {username: "jack", password: "password2"},
          {username: "arya", password: "password3"},
          {username: "jonshow", password: "password4"},
          {username: "heinsenberg", password: "password5"},
        ]

def auth_user(username, password)
  user = @users.find { |user| user[:username] === username }
  if user&.[](:password) === password
    return user
  end
  "Incorrect credentials"
end

def get_credentials
  print "username: "
  username = gets.chomp
  print "password: "
  password = gets.chomp
  { username: username, password: password }
end

attempts = 0
while attempts < 4
  credentials = get_credentials
  authorization = auth_user(credentials[:username], credentials[:password])
  puts authorization
  attempts+=1
end
