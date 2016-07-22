class Article < ActiveRecord::Base
	belongs_to :author
	validates_presence_of :title,:body
	# validates_uniqueness_of :title
	scope :published, -> {where(is_published: true)}
end
