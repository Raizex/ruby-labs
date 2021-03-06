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
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	
	valid_strings = ["R", "P", "S"]
	game.each do |name, value|
		raise NoSuchStrategyError unless valid_strings.include?(value)
	end

	player1 = game[0]
	player2 = game[1]

	case player1[1]
	when "R"
		if player2[1] == "S"
			return player1
		else
			return player2
		end
	when "P"
		if player2[1] == "R"
			return player1
		else
			return player2
		end
	when "S"
		if player2[1] == "P"
			return player1
		else
			return player2
		end
	end
end

def rps_tournament_winner(tournament)
	left_bracket = tournament[0]
	right_bracket = tournament[1]

	if left_bracket[0][0].instance_of? String
		left_winner = rps_game_winner(left_bracket)
	else
		left_winner = rps_tournament_winner(left_bracket)
	end

	if right_bracket[0][0].instance_of? String
		right_winner = rps_game_winner(right_bracket)
	else
		right_winner = rps_tournament_winner(right_bracket)
	end

	return rps_game_winner([left_winner, right_winner])
end


def test_rps_game_winner(game, winner)

	if rps_game_winner(game) == winner
		print("TestRPSGameWinner: Success\n")
	else
		print("TestRPSGameWinner: Failed\n")
	end
end

def test_rps_game_number_of_players(game)
	if rps_game_winner(game) == WrongNumberOfPlayersError
		print("TestRPSGamePlayers: Success\n")
	else
		print("TestRPSGamePlayers: Failed\n")
	end
end

def test_rps_game_valid_strategy(game)
	if rps_game_winner(game) == NoSuchStrategyError
		print("TestRPSGameValidStrategy: Success\n")
	else
		print("TestRPSGameValidStrategy: Failed\n")
	end
end

game = [ ["Richard", "R"],  ["Michael", "S"] ]
winner = ["Richard", "R"]
test_rps_game_winner(game, winner)

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

# Part4: Anagrams
def combine_anagrams(words)
	ana_dictionary = {}

	words.each do |word|
		key = word.split(//).sort
		if ana_dictionary[key].nil?
			ana_dictionary[key] = [word]
		else
			ana_dictionary[key] << word
		end
	end

	anagrams = []
	ana_dictionary.each do |key, value|
		anagrams << value
	end

	puts anagrams.to_s
end

def test_combine_anagrams
	input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
	output = [ ["cars", "racs", "scar"],
           ["four"],
           ["for"],
           ["potatoes"],
           ["creams", "scream"] ]

    if combine_anagrams(input) == output
    	puts "TestCombineAnagrams: Success"
    else
    	puts "TestCombineAnagrams: Failed"
    end
end
test_combine_anagrams