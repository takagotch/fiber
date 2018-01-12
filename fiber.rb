#f.resume
f = Fiber.new {
  puts "Fiber says xxx"
  Fiber.yield
  puts "Fiber says yyy"
}

puts "Caller says xxx"
f.resume
puts "Caller says yyy"
f.resume

#


