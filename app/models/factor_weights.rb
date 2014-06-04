#nodoc
class FactorWeights < ActiveRecord::Base
  validates :chloroform_weight, :bromoform_weight, :bromodichloromethane_weight,
    :dibromichloromethane_wieight, presence: true
end
