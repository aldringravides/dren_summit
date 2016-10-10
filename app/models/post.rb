class Post < ActiveRecord::Base
  attr_accessible :content, :title
  validates :title, uniqueness: true
end
