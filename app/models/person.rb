class Person < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true, length: {minimum: 10,   }

	before_save :calculate_seating_time

	def calculate_seating_time
		if self.created_at.blank?
			self.seating_time = (Time.now + self.waitminutes*60).strftime "%I:%M %P (%m/%d)"
		else
			self.seating_time = (self.created_at.localtime + self.waitminutes*60).strftime "%I:%M %P (%m/%d)"
		end
	end

end
