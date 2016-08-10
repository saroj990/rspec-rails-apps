class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar,AvatarUploader
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

  def has_about_section?
    about_user.present?
  end

  def self.user_has_role?(email,role)   
    role_flag = false;
    if email.present?
      user = User.where(:email => email).first
      if user.present?
        role_flag = user.has_role?(role)
      end
    end
    role_flag
  end

end
