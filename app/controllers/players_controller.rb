class PlayersController < ApplicationController
	def index
		players = Player.all.joins(:team).select("players.id", "players.first_name", "players.last_name", "teams.name")
		teams = Team.all

		obj = {
			"players" => players,
			"teams" => teams
		}
		render :json => obj
	end

	def create
		@team = Team.where(name: params[:team])[0]
		Player.create(first_name: params[:player][:first_name], last_name: params[:player][:last_name], team: @team)
  		render_players
	end

	def destroy
  		Player.find(params[:id]).destroy
  		render_players
  	end









	private
  	def render_players
  		render :json => Player.all.joins(:team).select("players.id", "players.first_name", "players.last_name", "teams.name")
  	end

  	def player_params
  		params.require(:player).permit(:first_name, :last_name, :team)
  	end
end
