collection @users

extends "users/_base"

# user model has_many posts, child will attach an array of all
# the posts.
# child :post do
#   attributes :id, :content, :created_at
# end
