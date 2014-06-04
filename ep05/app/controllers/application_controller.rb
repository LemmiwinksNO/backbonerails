class ApplicationController < ActionController::Base
  protect_from_forgery

	def index
    # @users = User.all
    # gon.foo = "bar"
    # gon.users = @users
    gon.rabl  # Will open views/application/index.json.rabl
    @user = User.first
    # gon.rabl "app/views/users/show.json.rabl", as: "current_user"
    gon.rabl :template => "app/views/users/show.json.rabl", as: "current_user"
	end

end
