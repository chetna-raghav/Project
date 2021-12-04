class WaitList < ApplicationRecord
  belongs_to :user
  belongs_to :businfo
end
