# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    field :message_id, Integer, null: false
    field :name, String
    field :email, String
    field :msg, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
