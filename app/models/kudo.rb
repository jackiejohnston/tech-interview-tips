class Kudo < ActiveRecord::Base
  belongs_to :kudosible, polymorphic: true
  belongs_to :user
  after_create :create_action

  private

  # This code is duplicated across the answers, comments, kudos, and
  # questions. To eliminate duplication I would prefer this be in a module.
  def create_action
    Action.create(
      actionable: self,
      content: 'thumbs up',
      user: User.find(self.user_id)
    )
  end
end