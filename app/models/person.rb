class Person < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true, length: {minimum: 10, maximum: 10   }
	validates :partysize, presence: true, numericality: {only_integer:true, :greater_than => 0, :less_than_or_equal_to => 12 }
	validates :waitminutes, presence: true, numericality: {only_integer:true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 240  }

	before_save :calculate_seating_time

	def calculate_seating_time
		if self.created_at.blank?
			self.seating_time = (Time.now + self.waitminutes*60).strftime "%I:%M %P (%m/%d)"
		else
			self.seating_time = (self.created_at.localtime + self.waitminutes*60).strftime "%I:%M %P (%m/%d)"
		end
	end

end
