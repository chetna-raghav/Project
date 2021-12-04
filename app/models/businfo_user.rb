class BusinfoUser < ApplicationRecord
  belongs_to :user
  belongs_to :businfo
end
