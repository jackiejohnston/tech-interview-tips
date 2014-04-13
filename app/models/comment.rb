class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :content, presence: true
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end