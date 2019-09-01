class BizlistsController < ApplicationController

  def index
    @username = current_user.name
  end

end
