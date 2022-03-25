# frozen_string_literal: true

module Types
  class AdminUserType < Types::BaseObject
    field :admin_user_id, Integer, null: false
    field :email, String, null: false
    field :password_digest, String, null: false
    field :club_name, String, null: false
    field :confirm_email, Boolean
    field :confirm_token, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
