class MedicationsController < ApplicationController

  before_action :set_medication, only: [:edit, :update, :show, :destroy]

  def index
    @medication = Medication.all
  end

  def new
    @medication = Medication.new
  end

  def edits

  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save
      flash[:notice] = "Medication was successfully created"
      redirect_to medication_path(@medication)
    else
      render 'new'
    end
  end

  def update
    if @medication.update(medication_params)
      flash[:notice] = "Medication was successfully updated"
      redirect_to medication_path(@medication)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @medication.destroy
    flash[:notice] = "Medication was successfully deleted"
    redirect_to medications_path
  end

  private

  def set_medication
    @medication = Medication.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(:medicationname, :unitvalue, :unitmeasurement, :description)
  end

end