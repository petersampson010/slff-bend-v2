class NotifierMailer < ApplicationMailer

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.email}", :subject => "Registration Confirmation")
    end

    def au_registration_confirmation(admin_user)
        if ENV["SET_MAIL"]
            puts 'inside au_reg_conf'
            puts admin_user.email
            puts ENV["SET_API_URL"]
            @admin_user = admin_user
            mail(:to => "#{admin_user.email}", :subject => "Registration Confirmation")
        else
            puts 'Mail config switched off'
        end
    end

end