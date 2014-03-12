class SiteController < ApplicationController

  def index
    # render json: User.all.entries
    @users = User.all.entries
  end

  def privacy
  end

  def terms
  end

end