require 'fiber'

class Rdv
  def initalize
  end

  def push(it)
  end

  def pop
  end
end

if __FILE__ == $0
	rdv = Rdv.new
	Fiber.new do
		10.times do |n|
			rdv.push(n)
			p [:push, n]
		end
	end.resume
	Fiber.new do
		10.times do |n|
			p [:pop, rdv.pop]
		end
	end.resume
end

