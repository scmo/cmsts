class Station < ActiveRecord::Base
  has_and_belongs_to_many :value_types
  # def value_types
  #   ValueType.joins(:measurements).where( :measurements => {:station_id => self.id}).distinct
  # end
end
