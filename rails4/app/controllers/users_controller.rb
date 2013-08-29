class UsersController < ApplicationController
  respond_to :json

  def index
    # We send @users to index.json.rabl, which is expecting it and
    # validates the attributes of each User object.
    @users = User.all
  end

end