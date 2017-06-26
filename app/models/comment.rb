class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
  validates_presence_of :text
  validates :text, length: { minimum: 5 }
end
