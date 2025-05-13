class WatchedMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :watched_at, comparison: { less_than_or_equal_to: DateTime.now }
end
