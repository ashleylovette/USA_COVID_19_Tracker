module CRUD
    def self.create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    def self.create_secure_users
        User.seed.each do |user_record|
            User.new(user_record[:username], create_hash_digest(user_record[:password]))
        end
    end

    def self.authenticate_user(username, password)
        currUser = nil
        User.all.each do |user|
        if user.username == username && user.password == password
            currUser = user
            break;
        end
    end
    currUser
end
end