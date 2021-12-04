#email:text
#password_digest:string

#password string and password_conne ction 
class Busowner < ApplicationRecord
    has_many :businfos

    has_secure_password
    validates :email,presence: true
end
