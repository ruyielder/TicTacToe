require_relative 'app/game'
require_relative 'app/board'
require_relative 'app/player_client'

board = Board.create_with_default_size
clients = [
    PlayerClient.new(:'X'),
    PlayerClient.new(:'O')
]
game = Game.new(board, clients)
game.run