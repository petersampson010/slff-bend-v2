# frozen_string_literal: true

module Types
  class RecordType < Types::BaseObject
    field :record_id, Integer, null: false
    field :sub, Boolean
    field :captain, Boolean
    field :vice_captain, Boolean
    field :user_id, Integer, null: false
    field :player_id, Integer, null: false
    field :gameweek_id, Integer, null: false
    field :admin_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
