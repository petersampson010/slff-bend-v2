class PlayerGameweekJoiner < ApplicationRecord
    belongs_to :player
  belongs_to :gameweek
end
