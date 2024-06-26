class AuthenticationService
    def self.encode_token(user_id)
      exp = 24.hours.from_now.to_i
      payload = { user_id: user_id, exp: exp }
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end
  
    def self.decode_token(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')[0]
    rescue JWT::DecodeError
      nil
    end
  
    def self.authenticate(email, password)
        
      user = User.find_by(email: email)
      if  user && user.valid_password?(password)
        return user
       
      end
  end
end