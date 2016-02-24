class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :opinion

  scope :agreed, -> { where(choice: 'agree') }
  scope :disagreed, -> { where(choice: 'disagree') }
end
