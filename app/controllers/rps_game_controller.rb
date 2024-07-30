class RpsGameController < ApplicationController
  def index
  end

  def result
    @user_choice = params[:id]
    game_service = RpsGameService::Main.new(user_bet: @user_choice)
    @server_choice = game_service.generated_bet
    @result = game_service.result
  end
end
