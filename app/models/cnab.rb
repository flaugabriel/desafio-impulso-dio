class Cnab < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  belongs_to :store 
end
