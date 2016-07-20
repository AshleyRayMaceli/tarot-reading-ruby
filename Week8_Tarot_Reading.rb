require 'zodiac'

class TarotDeck
	attr_accessor :deck, :reading, :positions

	def initialize
		@deck = ["0. The Fool", "I. The Magician", "II. The High Priestess", "III. The Empress", 
						"IV. The Emperor", "V. The Hierophant", "VI. The Lovers", "VII. The Chariot",
						"VIII. Justice", "IX. The Hermit", "X. The Wheel of Fortune", "XI. Strength",
						"XII. The Hanged Man", "XIII. Death", "XIV. Temperance", "XV. The Devil", 
						"XVI. The Tower", "XVII. The Star", "XVIII. The Moon", "XIX. The Sun", "XX. Judgement", 
						"XXI. The World", "Ace of Cups", "Two of Cups", "Three of Cups", "Four of Cups",
						"Five of Cups", "Six of Cups", "Seven of Cups", "Eight of Cups", "Nine of Cups",
						"Ten of Cups", "Daughter of Cups", "Sun of Cups", "Mother of Cups", "Father of Cups",
						"Ace of Pentacles", "Two of Pentacles", "Three of Pentacles", "Four of Pentacles",
						"Five of Pentacles", "Six of Pentacles", "Seven of Pentacles", "Eight of Pentacles",
						"Nine of Pentacles", "Ten of Pentacles", "Daughter of Pentacles", "Son of Pentacles",
						"Mother of Pentacles", "Father of Pentacles", "Ace of Swords", "Two of Swords",
						"Three of Swords", "Four of Swords", "Five of Swords", "Six of Swords", "Seven of Swords",
						"Eight of Swords", "Nine of Swords", "Ten of Swords", "Daughter of Swords",
						"Son of Swords", "Mother of Swords", "Father of Swords", "Ace of Wands", "Two of Wands",
						"Three of Wands", "Four of Wands", "Five of Wands", "Six of Wands", "Seven of Wands",
						"Eight of Wands", "Nine of Wands", "Ten of Wands", "Daughter of Wands", "Son of Wands",
						"Mother of Wands", "Father of Wands"]

		@reading = []
		@positions = ["Upright", "Reversed"]
	end

	def deal_card
    self.reading << deck.shuffle.pop
  end
end

class Player
	attr_reader :name
	attr_accessor :dob

	def initialize
	  puts ""
	  puts "☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼"
    puts "Welcome to your Tarot Card reading!! First, please tell me your name."
 		puts "☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼"
    @name = gets.chomp.capitalize
    @dob = []
 	end

 	def ask_birthday
		puts "Nice to meet you, #{self.name}. And when is your birthday? Please give me the year first"
		self.dob[0] = gets.chomp.to_i
		puts "And in what month? Tell me with numbers, please."
		self.dob[1] = gets.chomp.to_i
		puts "And finally what day? Again, tell me with numbers, please."
		self.dob[2] = gets.chomp.to_i
		star_sign = Date.new(self.dob[0], self.dob[1], self.dob[2]).zodiac_sign
		puts "\nGreat! So you are a #{star_sign}!"
		puts "\nNow, it is time to begin your reading, #{self.name}."
	end
end

class TarotReading
	attr_accessor :player, :deck

	def initialize
		@player = Player.new
		@deck = TarotDeck.new
		player.ask_birthday
		start_reading
	end

	def upright_reversed
		puts TarotDeck.new.positions.shuffle.last 
	end

	def shuffle!
		puts "First, I need you to shuffle the deck for me. How many times would you like the deck to be shuffled?"
		n = gets.chomp.to_i
		n.times{TarotDeck.new.deck.shuffle!} 
		puts "\n"
		puts "The deck has been shuffled #{n} times."
	end

	def start_reading
		while true do
			puts ""
			puts "Please choose what type of reading you would like:"
			puts ""
			puts "☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯"
			puts "[1] Pull one card from the deck."
			puts "[2] A three card reading"
			puts "[exit] If you decide you do not want a reading anymore."
			puts "☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯☯"
			choice = gets.chomp
		
			case choice
			when "1"
				shuffle!
				puts ""
				puts TarotDeck.new.deal_card
				upright_reversed
			when "2"
				shuffle!
				multiple_cards
			when "exit"
				puts ""
				puts "☽ I understand. Have a wonderful day! ☾"
				puts ""
				return false
			end
		end
	end

	def multiple_cards
		puts "\nThe first card represents The Body"
		puts TarotDeck.new.deal_card
		upright_reversed
		puts "\nThe second card represents The Mind"
		puts TarotDeck.new.deal_card
		upright_reversed
		puts "\nAnd finally the third represents The Soul"
		puts TarotDeck.new.deal_card
		upright_reversed
	end
end

TarotReading.new
