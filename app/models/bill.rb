class Bill < ApplicationRecord
  belongs_to :order
  has_many :detail_bill
end
