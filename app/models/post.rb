# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  sub_title    :string(255)
#  body         :text
#  published_at :datetime
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base

  # Accessors
  attr_accessible :title, :sub_title, :body, :publish
  def publish
    published_at.strftime("%b %-d, %Y")
  end

  def publish=(date)
    date  = date.split(/[\A,\s\z\s]/)
    date.delete("")
    year  = date[2]
    month = date[0]
    day   = date[1]
    self.published_at = Time.utc(year, month, day)
  end


  # Associations
  belongs_to :user
  

  # Scopes
  scope :published, lambda { where("published_at < ?", Time.now.to_date ) }
  
end