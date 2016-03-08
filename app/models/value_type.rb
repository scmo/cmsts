class ValueType < ActiveRecord::Base
  has_many :measurements
  # has_many :stations, through: :measurements
  has_and_belongs_to_many :stations
end
