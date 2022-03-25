# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :user_id, Integer, null: false
    field :email, String
    field :team_name, String, null: false
    field :password_digest, String, null: false
    field :transfers, Integer
    field :budget, Float
    field :gw_start, Integer
    field :confirm_email, Boolean
    field :confirm_token, String
    field :admin_user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
