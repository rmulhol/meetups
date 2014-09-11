class Board
  
	def initialize
	  @board = [] 
    @colors = {0 => "orange", 1 => "red", 2 => "blue", 3 => "yellow", 4 => "green", 5 => "pink"}
		@pink_index = 0
	end

	def define_board
		100.times do @board.push(rand(6)) end
		@board.sort!
  end

  def colorify_board
	  @board.map! do |element|
		  element = @colors[element]
		end
	end

  def find_first_pink
    @pink_index = @board.index("pink")
	end

  def assign_sticky
					5.times do 
						object_to_change = rand(self.find_first_pink) 
						@board[object_to_change] = @board[object_to_change] + " sticky"	
					end
	end	

  def assign_pink
					@board.map! do |element|
									if element == "pink"
													rando = rand(2)
													if rando == 0
																	element = element + " candy cane"
													else
																	element = element + " gum drop"
													end
									else
													element
									end
					end
	end


	def shuffle_board
					@board.shuffle!
	end

end

my_board = Board.new
my_board.define_board
my_board.colorify_board
my_board.assign_sticky
my_board.assign_pink
puts my_board.shuffle_board.inspect
