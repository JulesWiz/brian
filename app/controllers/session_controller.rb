class SessionController < ApplicationController

  def new
    render text: "Display the log in form."
  end

  def create
    # render text: "Log #{params[:user][:email]} in with #{params[:user][:password]}."
    render text: User.authenticate(params[:user][:email], params[:user][:password]).email
  end

  def destroy
    render text: "Log the user out."
  end

end