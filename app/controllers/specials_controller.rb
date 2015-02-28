class SpecialsController < ApplicationController
  before_action :set_special, only: [:show, :edit, :update, :destroy]

  # GET /specials
  def index
    @specials = Special.all
  end

  # GET /specials/1
  def show
  end

  # GET /specials/new
  def new
    @special = Special.new
  end

  # GET /specials/1/edit
  def edit
  end

  # POST /specials
  def create
    @special = Special.new(special_params)

    if @special.save
      redirect_to @special, notice: 'Special was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /specials/1
  def update
    if @special.update(special_params)
      redirect_to @special, notice: 'Special was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /specials/1
  def destroy
    @special.destroy
    redirect_to specials_url, notice: 'Special was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special
      @special = Special.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def special_params
      params.require(:special).permit(:name, :details, :fine_print)
    end
end
