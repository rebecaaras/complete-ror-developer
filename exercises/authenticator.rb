users = [
          {username: "mashkur", password: "password1"},
          {username: "jack", password: "password2"},
          {username: "arya", password: "password3"},
          {username: "jonshow", password: "password4"},
          {username: "heinsenberg", password: "password5"},
        ]

puts "Welcome to the authenticator"
25.times {print "-"}
puts
puts "This program will take your input from the user and compare password."
puts "If password is correct, you will get back the user object."

while true
  puts "username:"
  username = gets.chomp

  user = users.find { |user| user[:username] === username }
  unless user
    puts "User does not exist."
    break
  end
  
  puts "password:"
  password = gets.chomp

  if user[:password] === password
    puts user
  else
    puts "Password incorrect."
  end
end
