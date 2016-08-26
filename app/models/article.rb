class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_presence_of :title,:body
	# validates_uniqueness_of :title
	scope :published, -> {where(is_published: true)}

  def article_user
    self.user
  end

end
