class User < ApplicationRecord
    has_many :owners
    has_many :messages
    has_many :blogs
    has_many :blogs, through: :owners
    has_many :posts, dependent: :delete_all
    has_many :comments, as: :commentable

    validates :first_name, :last_name, presence: true, length: { in: 2..40 }
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

    before_destroy :destroy_posts

    private
    def destroy_posts
        puts "Destroying associated posts and owners before destroying the user..."
    end
end
