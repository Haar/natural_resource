class Page < ActiveRecord::Base

  scope :user, -> { where(title: 'allowed') }

  delegate :to_s, to: :title
end
