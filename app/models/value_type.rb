class ValueType < ActiveRecord::Base
  has_many :measurements
  # has_many :stations, through: :measurements
end
