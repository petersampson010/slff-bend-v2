# frozen_string_literal: true

module Types
  class GameweekType < Types::BaseObject
    field :gameweek_id, Integer, null: false
    field :date, String, null: false
    field :opponent, String, null: false
    field :score, String
    field :gameweek, Integer, null: false
    field :complete, Boolean, null: false
    field :admin_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
