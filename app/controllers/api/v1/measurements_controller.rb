class Api::V1::MeasurementsController < ApplicationController

  # GET /api/v1/measurements/station/:station_id/value_type/:value_type_id
  def show
    if(params.has_key?(:station_id) && params.has_key?(:value_type_id))
      # 9.5 sec / (Views: 1.3ms | ActiveRecord: 390.6ms)
      # render :json => Measurement.where(:station_id => 2, :value_type_id => 1).order(:measured_at).limit(10).pluck(:measured_at, :measured_value)
      # (Views: 14443.9ms | ActiveRecord: 1139.3ms)
      # render :json => Measurement.where(:station_id => 2, :value_type_id => 1).order(:measured_at).pluck(:measured_at, :measured_value)
      # (Views: 3297.1ms | ActiveRecord: 938.4ms)

      if(params.has_key?(:start) && params.has_key?(:end))
        @measurements = Measurement.where(:station_id => params[:station_id], :value_type_id => params[:value_type_id]).where("measured_at BETWEEN ? AND ?", Time.at(params[:start].to_i/1000), Time.at(params[:end].to_i/1000)).order(:measured_at).pluck(:measured_at, :measured_value)
      else
        @measurements = Measurement.where(:station_id => params[:station_id], :value_type_id => params[:value_type_id]).order(:measured_at).pluck(:measured_at, :measured_value)
      end
    else
      render :json => "Error, wrong parameters"
    end

  end
end
