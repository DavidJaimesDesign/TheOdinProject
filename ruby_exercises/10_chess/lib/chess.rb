require "chess/version"

module Chess
  # Your code goes here...
end
#coordinates thrown to pieces are valid need a coordinate validator

require_relative "./chess/board.rb"
require_relative "./chess/piece.rb"
require_relative "./chess/pawn.rb"
require_relative "./chess/rook.rb"
require_relative "./chess/bishop.rb"
require_relative "./chess/queen.rb"
require_relative "./chess/king.rb"
require_relative "./chess/knight.rb"
require_relative "./chess/end_game.rb"
require_relative "./chess/game.rb"
require_relative "./chess/castle.rb"