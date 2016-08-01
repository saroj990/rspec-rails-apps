class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments

  	def full_name
		[first_name.try(:downcase),last_name.try(:downcase)].join " "
	end

	def self.by_letter(letter) 
		where("last_name LIKE ?","%#{letter}%")
	end

	def self.asc(field_name)		
		order(User.arel_table[field_name.to_sym])
	end

	def self.desc(field_name)
		order(User.arel_table[field_name.to_sym].desc)
	end	
end
