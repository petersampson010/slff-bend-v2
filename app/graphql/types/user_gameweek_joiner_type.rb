# frozen_string_literal: true

module Types
  class UserGameweekJoinerType < Types::BaseObject
    field :ug_id, Integer, null: false
    field :total_points, Integer, null: false
    field :user_id, Integer, null: false
    field :gameweek_id, Integer, null: false
    field :admin_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
