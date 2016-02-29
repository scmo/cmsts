class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:update]

  # GET /measurements
  # GET /measurements.json
  def index
    if(params.has_key?(:import) && params[:import] == "true")
      Dir.glob(Rails.public_path.join('import').join('*data.txt')) do |item|
        valueTypeDetail = ''
        valueType = nil
        stnDetail = ''
        stn = nil
        require 'csv'
        CSV.foreach(item, :headers => true,  :col_sep => ';' ) do |row|

          # Get station ID
          if(row['stn'] != stnDetail)
            stn =  Station.find_by( details: row['stn'])
            stnDetail = row['stn']
          end
          # Create Unix Timestamp
          tz =Time.zone = 'Bern'
          tz = Time.zone.parse(row[1])

            # puts row[1]
          # Get value_type ID
          if(row.to_hash.keys[2] != valueTypeDetail)
            valueType = ValueType.find_by(:details => row.to_hash.keys[2])
            valueTypeDetail = row.to_hash.keys[2]
          end
          Measurement.new(station_id: stn.id, value_type_id: valueType.id, measured_at: tz.utc.iso8601, measured_value: row[2] ).save!
        end
      end
    end
    # @measurements = Measurement.all
    @measurements = Measurement.where(:station_id => 2, :value_type_id => 1).order(:measured_at)
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create
    @measurement = Measurement.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @measurement, notice: 'Measurement was successfully created.' }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    puts "saaaaali"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:station, :value_type, :measured_at, :measured_value, :active)
    end
end
