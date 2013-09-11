# Part1: Hello World
class HelloWorldClass
	def initialize(name)
		@name = name.capitalize
	end
	def sayHi
		puts "Hello #{@name}!"
	end
end
hello = HelloWorldClass.new("Justin Huffman")
hello.sayHi

def palindrome?(string)
	# your code here
end

def palintest(number, string)
	if palindrome?(string)
		print("PalinTest#{number}: Success\n")
	else
		print("PalinTest#{number}: Failed\n")
	end
end

palintest(1, "Abracadabra")
palintest(2, "Madam, I'm Adam!")
palintest(3, "A man, a plan, a canal -- Panama")