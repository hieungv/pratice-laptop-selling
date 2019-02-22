class User < ApplicationRecord
  has_many :feedbacks
  has_many :orders
end
