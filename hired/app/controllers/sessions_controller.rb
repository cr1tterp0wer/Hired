class SessionsController < ApplicationController
 # before_action :set_session, only: [:show, :new, :edit, :update, :destroy]

  # GET /sessions/1
  # GET /sessions/1.json
  def new 
    if logged_in?
      redirect_to user_path( current_user )
    end
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @user = User.find_by_credentials( session_params[:username],
                                      session_params[:password] )
    unless @user.nil?
      login!( @user )
      redirect_to user_path( @user )
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    logout!
    redirect_to :new_session
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require( :user ).permit( :username, :password )
    end
end
