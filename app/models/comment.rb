class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :content, presence: true
  belongs_to :user
  after_create :create_action
  default_scope -> { order('created_at DESC') }

  private

  # This code is duplicated across the answers, comments, kudos, and
  # questions. To eliminate duplication I would prefer this be in a module.
  def create_action
    Action.create(
      actionable: self,
      content: 'Comment:',
      user: User.find(self.user_id)
    )
  end

end