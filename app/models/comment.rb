class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :opinion

  scope :recent, -> { order(created_at: :desc) }
  scope :agreed, -> { where(choice: 'agree') }
  scope :disagreed, -> { where(choice: 'disagree') }
end
