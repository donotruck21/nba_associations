class AssociationsController < ApplicationController
	def index
		players = Player.all.joins(:team).select("players.id", "players.first_name", "players.last_name", "teams.name")
		teams = Team.all

		obj = {
			"players" => players,
			"teams" => teams
		}
		render :json => obj
	end
end
