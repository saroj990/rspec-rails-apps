class Author < ActiveRecord::Base
	has_many :articles

	def name
		[first_name.downcase,last_name.downcase].join " "
	end

	def self.by_letter(letter) 
		where("last_name LIKE ?","%#{letter}%")
	end

	def self.asc(field_name)		
		order(Author.arel_table[field_name.to_sym])
	end

	def self.desc(field_name)
		order(Author.arel_table[field_name.to_sym].desc)
	end	
end
