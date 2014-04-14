class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :category
  has_many :favorites, as: :favoritable
  has_many :kudos, as: :kudosible
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true
  after_create :create_action
  default_scope -> { order('created_at DESC') }


  private

  # This code is duplicated across the answers, comments, kudos, and
  # questions. To eliminate duplication I would prefer this be in a module.
  def create_action
    Action.create(
      actionable: self,
      content: 'Answer:',
      user: User.find(Question.find(self.question_id).user_id)
    )
  end

end