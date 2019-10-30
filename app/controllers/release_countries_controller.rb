class ReleaseCountriesController < ApplicationController
  before_action :set_release_country, only: [:show, :edit, :update, :destroy]

  # GET /release_countries
  # GET /release_countries.json
  def index
    @release_countries = ReleaseCountry.all
  end

  # GET /release_countries/1
  # GET /release_countries/1.json
  def show
  end

  # GET /release_countries/new
  def new
    @release_country = ReleaseCountry.new
  end

  # GET /release_countries/1/edit
  def edit
  end

  # POST /release_countries
  # POST /release_countries.json
  def create
    @release_country = ReleaseCountry.new(release_country_params)

    respond_to do |format|
      if @release_country.save
        format.html { redirect_to @release_country, notice: 'Release country was successfully created.' }
        format.json { render :show, status: :created, location: @release_country }
      else
        format.html { render :new }
        format.json { render json: @release_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /release_countries/1
  # PATCH/PUT /release_countries/1.json
  def update
    respond_to do |format|
      if @release_country.update(release_country_params)
        format.html { redirect_to @release_country, notice: 'Release country was successfully updated.' }
        format.json { render :show, status: :ok, location: @release_country }
      else
        format.html { render :edit }
        format.json { render json: @release_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /release_countries/1
  # DELETE /release_countries/1.json
  def destroy
    @release_country.destroy
    respond_to do |format|
      format.html { redirect_to release_countries_url, notice: 'Release country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release_country
      @release_country = ReleaseCountry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_country_params
      params.require(:release_country).permit(:code, :name)
    end
end
