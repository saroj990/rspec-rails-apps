class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_presence_of :title,:body

  mount_uploader :cover ,CoverUploader
	# validates_uniqueness_of :title
	scope :published, -> {where(is_published: true)}


  def self.get_total_likes
    
  end

  def increment_likes
  
  end 

  def decrement_likes

  end

end
