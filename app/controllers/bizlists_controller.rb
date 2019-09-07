class BizlistsController < ApplicationController
  before_action :require_login

  def index
    @username = current_user.username
  end

  def new
    @username = current_user.username
  end

end
