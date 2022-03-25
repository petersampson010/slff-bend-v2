# frozen_string_literal: true

module Types
  class PlayerGameweekJoinerType < Types::BaseObject
    field :pg_id, Integer, null: false
    field :minutes, Integer
    field :assists, Integer
    field :goals, Integer
    field :own_goals, Integer
    field :y_cards, Integer
    field :r_cards, Integer
    field :bonus, Integer
    field :penalty_miss, Integer
    field :goals_conceded, Integer
    field :total_points, Integer
    field :player_id, Integer, null: false
    field :gameweek_id, Integer, null: false
    field :admin_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
