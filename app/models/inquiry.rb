# == Schema Information
#
# Table name: inquiries
#
#  id          :integer         not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  timetable   :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Inquiry < ActiveRecord::Base

TIMETABLE = %w[ '1 week' '2 weeks' '3 weeks' '1 month' '2 months' '3+ months' 'ongoing' ]

end
