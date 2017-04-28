class BoardsController < ApplicationController

	def index
		@boards = User.find(4).get_boards
	end

	def show
		@boardslists = User.find(4).get_list(params[:trello])
		@boardscards = User.find(4).get_cards(params[:trello])
	end
end
