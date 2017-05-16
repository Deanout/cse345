class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
    attr_writer :login
    scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }

    validates :username,
              presence: true,
              uniqueness: {
                  case_sensitive: false
              } # etc.
    extend FriendlyId
    friendly_id :username, use: :slugged

    validate :validate_username
    def validate_username
        errors.add(:username, :invalid) if User.where(email: username).exists?
    end

    def login
        @login || username || email
    end
    def online?
      updated_at > 10.minutes.ago
    end

    def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
            where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
        else
            if conditions[:username].nil?
                where(conditions).first
            else
                where(username: conditions[:username]).first
            end
        end
    end
end
