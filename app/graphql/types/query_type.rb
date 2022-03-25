module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :admin_users,
    [Types::AdminUserType],
    null: false,
    description: "Return a list of AdminUsers"

    def admin_users
      AdminUser.all 
    end

    field :users,
    [Types::UserType],
    null: false,
    description: "Return a list of Users"

    def users
      User.all 
    end
  end
end
