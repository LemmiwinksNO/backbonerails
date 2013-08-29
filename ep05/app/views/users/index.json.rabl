collection @users

attributes :id, :first_name, :last_name, :full_name, :created_at, :updated_at

# Make our times more readable.
node do |user|
  {
    :created_at_formatted => user.created_at.strftime("%m/%d/%Y"),
    :updated_at_formatted => time_ago_in_words(user.updated_at)
  }
end

# user model has_many posts, child will attach an array of all
# the posts.
# child :post do
#   attributes :id, :content, :created_at
# end
