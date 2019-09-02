class BizlistsController < ApplicationController

  def index
    @username = current_user.username
  end

end
