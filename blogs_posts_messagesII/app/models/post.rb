class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  has_many :messages, dependent: :delete_all
  has_many :comments, as: :commentable

  validates :title, presence: true, length: { in: 7..40 }
  validates :content, presence: true, length: { minimum: 2 }

    before_destroy :destroy_messages

    private
    def destroy_messages
        puts "Destroying associated messages before destroying the post..."
    end
end
