class AdminUser < ApplicationRecord
    has_secure_password

    has_many :users
    has_many :user_gameweek_joiners, through: :users

    has_many :players

    has_many :gameweeks

    def email_activate
        self.confirm_email = true
        self.confirm_token = nil
        save!(:validate => false)
    end
end
