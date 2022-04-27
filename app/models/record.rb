class Record < ApplicationRecord
    belongs_to :player
    belongs_to :user
    belongs_to :gameweek

end
