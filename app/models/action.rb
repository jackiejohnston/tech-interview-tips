class Action < ActiveRecord::Base
  belongs_to :actionable, polymorphic: true
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end