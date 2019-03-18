class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :commentable
  
  validates :author, presence: true, length: { in: 2..20 }
  validates :message, presence: true, length: { minimum: 15 }
end
