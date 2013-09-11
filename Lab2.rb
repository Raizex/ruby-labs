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


# Part2: Palnidrome?
def palindrome?(string)
	string.downcase!
	string = string[/[a-z]/]

	string == string.reverse
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


#Part3: Count Words
def count_words(string)
	hash = {}

	string.downcase.scan(/\b[\w]+/).each do |word|
		if hash[word].nil?
			hash[word] = 1
		else
			hash[word] += 1
		end
	end

	return hash
end

puts count_words("A man, a plan, a canal -- Panama")
	# => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
puts count_words("Doo bee doo bee doo")
	# => {'doo' => 3, 'bee' => 2}


# Part3: Rock Paper Scissors
def rps_game_winner(game)
	# code goes here
end

def rps_tournament_winner(tournament)
	# your code here
end

def test_rps_game
	game = [ ["Richard", "R"],  ["Michael", "S"] ]
	winner = ["Richard", "R"]

	if rps_game_winner(game) == winner
		print("TestRPSGame: Success\n")
	else
		print("TestRPSGame: Failed\n")
	end
end
test_rps_game

def test_rps_tourny
	tournament = [
	    [
	        [ ["Armando", "P"], ["Dave", "S"] ],
	        [ ["Richard", "R"],  ["Michael", "S"] ],
	    ],
	    [
	        [ ["Allen", "S"], ["Omer", "P"] ],
	        [ ["David E.", "R"], ["Richard X.", "P"] ]
	    ]
	]

	winner = ["Richard", "R"]

	if rps_tournament_winner(tournament) == winner
		print("TestRPSTourny: Success\n")
	else
		print("TestRPSTourny: Failed\n")
	end
end
test_rps_tourny
