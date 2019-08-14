class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find( params[:id] )
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new( user_params )

    if @user.save 
      login!( @user )
      redirect_to user_path( @user )
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require( :user ).permit( :username, :password )
    end
end
