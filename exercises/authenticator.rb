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
puts "This program will take your input from the user and compare password"
puts "If password is correct, you will get back the user object."

while true
  puts "username:"
  username = gets.chomp
  puts "password:"
  password = gets.chomp

  user = users.select { |user| user[:username] === username }
  if user.length === 0
    puts "User does not exist."
    return
  end

  if user[0][:password] === password
    puts user[0]
  else
    puts "Password incorrect"
  end
end
