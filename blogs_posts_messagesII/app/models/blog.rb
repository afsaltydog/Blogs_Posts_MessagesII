class Blog < ApplicationRecord
    has_many :posts, dependent: :delete_all
    has_many :owners
    has_many :users
    has_many :users, through: :owners
    has_many :comments, as: :commentable

    validates :name, presence: true, length: { in: 2..40 }
    validates :description, presence: true, length: { minimum: 2 }

    before_destroy :destroy_posts

    private
    def destroy_posts
        puts "Destroying associated posts before destroying the blog..."
    end
end
