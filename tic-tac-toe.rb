class Board
	def initialize (board)
		@board = board
		@turn = 0
	end

	def go
		@board.each do |x|
			x.each do |cell|
				print cell
			end
			puts
		end
	end

	def play (x, y) #turn= even, then x is placed. position is array coordinate
		if (@turn%2 == 0)
			@board[x][y] = "X "
			@turn+=1
		else
			@board[x][y] = "O "
			@turn+=1
		end
	end

	def win?
		if ((@board[0][0]==@board[0][1]&&@board[0][1]==@board[0][2])||(@board[1][0]==@board[1][1]&&@board[1][1]==@board[1][2])||(@board[2][0]==@board[2][1]&&@board[2][1]==@board[2][2])) #Vertical win
			return true
		elsif ((@board[0][0]==@board[1][0]&&@board[1][0]==@board[2][0])||(@board[0][1]==@board[1][1]&&@board[1][1]==@board[2][1])||(@board[0][2]==@board[1][2]&&@board[1][2]==@board[2][2])) #Horizontal win
			return true
		elsif ((@board[0][0]==@board[1][1]&&@board[1][1]==@board[2][2])||(@board[0][2]==@board[1][1]&&@board[1][1]==@board[2][0])) #Diagonal win
			return true
		else
			return false
		end
	end
	def turn
		return @turn
	end
end

def playceholder
	board = Array.new
	board = [["_|","_|","_"],["_|","_|","_"],[" |"," |"," "]]
	new_game = Board.new(board)
	puts "Welcome to Tic-Tac-Toe!"
	while 1
		turn = new_game.turn
		puts"Turn is #{turn}"
		if (turn%2 == 0)
			player = "One"
		else
			player = "Two"
		end
		puts "Player #{player}, enter your move (x,y)"
		input = gets.chomp
		input = input.split(",")
		x= input[0].to_i
		y= input[1].to_i
		new_game.play(x,y)
		new_game.go
		turn = new_game.turn
		if (turn==9)
			puts "There is no space left on the board!"
			break
		end
		if new_game.win?
			if ((turn - 1) % 2 == 0)
				winner = "One"
			else
				winner = "Two"
			end

			puts "Player #{winner} wins!"
			break
		end
	end
end

playceholder