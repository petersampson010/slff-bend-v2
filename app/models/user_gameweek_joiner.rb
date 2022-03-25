class UserGameweekJoiner < ApplicationRecord
    belongs_to :user
  belongs_to :gameweek
end
