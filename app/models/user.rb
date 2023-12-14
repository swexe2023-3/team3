class User < ApplicationRecord
    has_many :organized_fishing_trips, class_name: 'FishingTrip', foreign_key: 'organizer_id', dependent: :destroy
    has_many :participations, dependent: :destroy
    has_one :user_profile
    accepts_nested_attributes_for :user_profile
    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
    
end
