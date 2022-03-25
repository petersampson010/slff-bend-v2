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

    field :players,
    [Types::PlayerType],
    null: false,
    description: "Return a list of Players"

    def players
      Player.all 
    end

    field :gameweeks,
    [Types::GameweekType],
    null: false,
    description: "Return a list of Gameweeks"

    def gameweeks
      Gameweek.all 
    end

    field :player_gameweek_joiners,
    [Types::PlayerGameweekJoinerType],
    null: false,
    description: "Return a list of PGJs"

    def player_gameweek_joiners
      PlayerGameweekJoiner.all 
    end

    field :user_gameweek_joiners,
    [Types::UserGameweekJoinerType],
    null: false,
    description: "Return a list of UGJs"

    def user_gameweek_joiners
      UserGameweekJoiner.all 
    end

    field :messages,
    [Types::MessageType],
    null: false,
    description: "Return a list of messages"

    def messages
      Message.all 
    end

    field :records,
    [Types::RecordType],
    null: false,
    description: "Return a list of records"

    def player_gameweek_joiners
      Record.all 
    end
  end
end
