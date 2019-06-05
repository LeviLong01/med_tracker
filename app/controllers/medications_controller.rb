class MedicationsController < ApplicationController

  before_action :set_medication, only: [:edit, :update, :show, :destroy]

  def index
    if logged_in?
      @medications = Medication.paginate(page: params[:page], per_page: 5)
    else
      redirect_to root_path
    end
  end

  def new
    @medication = Medication.new
  end

  def edit
    if logged_in?
    else
      redirect_to root_path
    end
  end

  def create
    @medication = Medication.new(medication_params)
    @medication.user = User.first
    if @medication.save
      flash[:success] = "Medication was successfully created"
      redirect_to medication_path(@medication)
    else
      render 'new'
    end
  end

  def update
    if @medication.update(medication_params)
      flash[:success] = "Medication was successfully updated"
      redirect_to medication_path(@medication)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @medication.destroy
    flash[:danger] = "Medication was successfully deleted"
    redirect_to medications_path
  end

  private

  def set_medication
    if logged_in?
      @medication = Medication.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def medication_params
    params.require(:medication).permit(:medicationname, :unitvalue, :unitmeasurement, :description)
  end

end