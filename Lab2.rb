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


print("Test1: success") if palindrome?("Abracadabra") else print("Test1: Failed")
print("Test2: success") if palindrome?("Madam, I'm Adam!") else print("Test2: Failed")
print("Test3: success") if palindrome?("A man, a plan, a canal -- Panama") else print("Test2: Failed")
