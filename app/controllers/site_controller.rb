class SiteController < ApplicationController

  def index
    # render json: User.all.entries
    @users = User.all.entries # come from routes.rb #this is the logic
  end

  def privacy
  end

  def terms
  end

end