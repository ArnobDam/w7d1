class User < ApplicationRecord
    validates :password, length { minimum: 6 }, allow_nil: true

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        (user && user.is_password?(password)) ? user : nil
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        bcrypt_object = BCrypt::Password.new(self.password_digest)
        bcrypt_object.is_password?(password)
    end

    def generate_unique_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        @session_token = generate_unique_session_token
    end


    private

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end
end
