class PatientProfilesController < ApplicationController
  before_action :set_patient_profile, only: [:show, :edit, :update, :destroy]

  # GET /patient_profiles
  def index
    @patient_profiles = PatientProfile.all
  end

  # GET /patient_profiles/1
  def show
  end

  # GET /patient_profiles/new
  def new
    @patient_profile = PatientProfile.new
  end

  # GET /patient_profiles/1/edit
  def edit
  end

  # POST /patient_profiles
  def create
    @patient_profile = PatientProfile.new(patient_profile_params)

    if @patient_profile.save
      redirect_to @patient_profile, notice: 'Patient profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /patient_profiles/1
  def update
    if @patient_profile.update(patient_profile_params)
      redirect_to @patient_profile, notice: 'Patient profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patient_profiles/1
  def destroy
    @patient_profile.destroy
    redirect_to patient_profiles_url, notice: 'Patient profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_profile
      @patient_profile = PatientProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patient_profile_params
      params.require(:patient_profile).permit(:state_id, :certification, :state_id_expires, :certification_expires, :symptoms)
    end
end
