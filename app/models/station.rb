class Station < ActiveRecord::Base
  def value_types
    ValueType.joins(:measurements).where( :measurements => {:station_id => self.id}).distinct
  end
end
