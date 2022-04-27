module HelperModule
    
    def find_from_params(field, params)
        size = params.keys.length
        if size===1 
            key = params.keys[0]
            value = params.values[0]
            return field.filter{|x| x[key].to_s===value}
        elsif size>1
            keys = params.keys
            values = params.values
            for i in (0..size-1) do 
                field=field.filter{ |x| x[keys[i]].to_s===values[i]}
            end
            return field
        else
            return field
        end
    end

    private 

    def key 
        if ENV["RAILS_ENV"] === 'development'
            return Rails.application.secrets.secret_key_base
        else 
            return ENV["SECRET_KEY_BASE"]
        end 
    end 

    def jwt_encode(payload, expiration = 7.days.from_now.to_i)
        payload[:exp] = expiration
        return JWT.encode(payload, key, 'HS256')
    end 

    def jwt_decode(token)
        return JWT.decode(token, key, 'HS256')[0]
    end 

    def authenticate_request
        if ENV["ST_JWT_AUTH"] 
            puts '**** AUTHENTICATING ****'
            auth_header = request.headers["Authorization"]
            puts 'auth header: ' + auth_header
            token = auth_header.split(' ').last if auth_header
            puts 'auth token: ' + token
            begin
                @decoded = jwt_decode(token)
                puts 'decoded'
                puts @decoded
                if @decoded["user_id"] 
                    @current_user = User.find(@decoded["user_id"])
                elsif @decoded["admin_user_id"]
                    @current_user = AdminUser.find(@decoded["admin_user_id"])
                    @admin_user_token = true
                end
            rescue ActiveRecord::RecordNotFound => e
                puts  e
                puts e.message
                render json: { errors: e.message }, status: :unauthorized
            rescue JWT::DecodeError => e
                puts  e
                puts e.message

                render json: { errors: e.message }, status: :unauthorized
            end
        else 
            puts 'Auth config switched off'
        end
    end

end