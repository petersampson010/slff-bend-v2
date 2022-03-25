# frozen_string_literal: true

module Types
  class PlayerType < Types::BaseObject
    field :player_id, Integer, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :position, String, null: false
    field :price, Float, null: false
    field :availability, String, null: false
    field :admin_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
