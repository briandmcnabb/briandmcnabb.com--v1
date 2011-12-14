# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  sub_title    :string(255)
#  body         :text
#  publish_date :date
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base
  # Accessors
  attr_accessible :title, :sub_title, :body, :published_at

  # Associations
  belongs_to :user
  
  # Scopes
  scope :published, lambda { where("publish_date < ?", Time.now.to_date ) }

  # Methods
  def published_at=(date)
    Time.utc(date.year, date.month, date.day)
  end
  
end
