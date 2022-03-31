class NotifierMailer < ApplicationMailer

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.email}", :subject => "Registration Confirmation")
    end

    def au_registration_confirmation(admin_user)
        puts 'inside au_reg_conf'
        puts admin_user.email
        puts ENV["SET_API_URL"]
        mail(:to => "#{admin_user.email}", :subject => "Registration Confirmation")
    end

end