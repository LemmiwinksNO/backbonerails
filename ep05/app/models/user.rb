class User < ActiveRecord::Base

  # has_many :posts  # rabl has access to these

  attr_accessible :first_name, :last_name

  def full_name  # rabl has access to this.
    "#{first_name} #{last_name}"
  end

end
