class MedicationsController < ApplicationController

  before_action :set_medication, only: [:edit, :update, :show, :destroy]

  def index
    render_404
  end

  def new
    @medication = Medication.new
  end

  def edit
    if logged_in?
    else
      render_404
    end
  end

  def create
    @medication = Medication.new(medication_params)
    @medication.user = current_user
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
      render_404
    end
  end

  def medication_params
    params.require(:medication).permit(:medicationname, :unitvalue, :unitmeasurement, :description)
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end
