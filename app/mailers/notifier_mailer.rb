class NotifierMailer < ApplicationMailer

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.email}", :subject => "Registration Confirmation")
    end

    def au_registration_confirmation(admin_user)
        @admin_user = admin_user
        mail(:to => "#{admin_user.email}", :subject => "Registration Confirmation")
    end

end