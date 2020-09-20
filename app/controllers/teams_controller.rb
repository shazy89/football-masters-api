class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    @teams = Team.all

    render json: @teams, include: [:players]
  end

  # GET /teams/1
  def show
    render json: @team, include: [:players]
  end

  # POST /teams
  def create
    players =  params[:team][:players]
    @team = Team.new(team_params)
    players.each do |player|
      @team.players.build(playername: player[:playerN], position: player[:playerP])
    end
    if @team.save
      render json: @team, status: :created, location: @team, include: [:players]
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end
    
  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity, include: [:players]
    end
  end

  # DELETE /teams/1
  def destroy

    @team.players.destroy_all
    @team.destroy
    render json: @team, include: [:players]
  end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = Team.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def team_params
        params.require(:team).permit(:username, players_attributes: [:playerN, :playerP])
      end
  end
       
          




