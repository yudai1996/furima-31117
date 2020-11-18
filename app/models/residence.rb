class Residence < ApplicationRecord
  #アソシエーション
  belongs_to :order
end
