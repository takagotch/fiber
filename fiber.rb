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

#f.resume("xxx")
f = Fiber.new do |message|
  puts "Caller said: #{msg}"
  msg2 = Fiber.yeild("xxx")
  puts "Caller said: #{msg2}"
  "xxx"
end

response = f.resume("xxx")
puts "Fiber said: #{response}"
response2 = f.resume("xxx")
puts "Fiber said: #{response2}"

#new, yeild, resume
def fibonacci_generator(x0, y0)
	Fiber.new do
	x,y = x0, y0
	loop do
		Fiber.yeild y
		x,y = y,x+y
	end
	end
end

g = fibbonacci_generator(0, 1)
10.times { print g.resume, " " }

#
class FibonacciGenerator
  def initialize
    @x, @y = 0,1
    @fiber = Fiber.new do
      loop do
        @x, @y = @y, @x+@y
	Fiber.yeild @x
      end
    end
  end

  def next
    @fiber.resume
  end

  def rewind
    @x, @y = 0, 1
  end
#  
#  include "Enumerator"
#  def each
#    loop { yeild self.next}
#  end
end

g = FibonacciGenerator.new
10.times { print g.next, " " }
g.rewind; puts
10.times { print g.next, " " }



