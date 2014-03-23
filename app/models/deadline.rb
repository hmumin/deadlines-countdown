class Deadline < ActiveRecord::Base

	validates :title, presence: true,
				length: { minimum: 8 }


	validates :date, presence: true

	validates :description, presence: true,
				length: { maximum: 230 }

   #validates_format_of :date, :with => /\A[0-9]{4}-[0-1][0-9]-[0-3][0-9]\z/, :message => "Enter Date in this format: YYYY-MM-DD" 
	belongs_to :user	

end
