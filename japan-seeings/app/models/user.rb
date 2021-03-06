class User < ActiveRecord::Base
  has_many :spots
  has_secure_password
  validates_presence_of :username, :email, :password

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|user| user.slug == slug}
  end
end
