module Met
  extend ActiveSupport::Concern

  def get_boards
  	@accessTrello ||= Trello::Member.find(idTrello)
  	boards = @accessTrello.boards
  	boards
  end

  def get_cards(idboard)
  	connect = @accessTrello
    @accessBoard ||= Trello::Board.find(idboard)
  	@cards = @accessBoard.cards
  end

  def get_list(idboard)
    connect = @accessTrello
    @accessBoard ||= Trello::Board.find(idboard)
    @list = @accessBoard.lists
  end

end
