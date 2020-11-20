class Residence < ApplicationRecord
  #アソシエーション
  belongs_to :order, optional: true#外部キーのnilを許可
end
