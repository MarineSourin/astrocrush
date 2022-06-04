class UsersController < ApplicationController

  def index
    # Faire en sorte que l'index proposé corresponde a ce que l'utilisateur recherche
    @users = User.where(gender: current_user.looking_for)

  end

  def show
    current_user
    @mate = User.find(params[:id])
  end
end
