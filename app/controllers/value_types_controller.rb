class ValueTypesController < ApplicationController
  before_action :set_value_type, only: [:show, :edit, :update, :destroy]

  # GET /value_types
  # GET /value_types.json
  def index
    @value_types = ValueType.all
  end

  # GET /value_types/1
  # GET /value_types/1.json
  def show
  end

  # GET /value_types/new
  def new
    @value_type = ValueType.new
  end

  # GET /value_types/1/edit
  def edit
  end

  # POST /value_types
  # POST /value_types.json
  def create
    @value_type = ValueType.new(value_type_params)

    respond_to do |format|
      if @value_type.save
        format.html { redirect_to @value_type, notice: 'Value type was successfully created.' }
        format.json { render :show, status: :created, location: @value_type }
      else
        format.html { render :new }
        format.json { render json: @value_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_types/1
  # PATCH/PUT /value_types/1.json
  def update
    respond_to do |format|
      if @value_type.update(value_type_params)
        format.html { redirect_to @value_type, notice: 'Value type was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_type }
      else
        format.html { render :edit }
        format.json { render json: @value_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_types/1
  # DELETE /value_types/1.json
  def destroy
    @value_type.destroy
    respond_to do |format|
      format.html { redirect_to value_types_url, notice: 'Value type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_type
      @value_type = ValueType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_type_params
      params.require(:value_type).permit(:name, :details, :unit)
    end
end
