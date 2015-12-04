class Page < ActiveRecord::Base

  scope :user, -> { where(title: 'allowed') }
end
