class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def index
    render_404
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up with MedTracker #{@user.username}"
      redirect_to medications_path
    else
      render 'new'
    end
  end

  def edit
    if logged_in?
    else
      render_404
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to medications_path
    else
      render 'edit'
    end
  end

  def show
    @user_medications = @user.medications.paginate(page: params[:page], per_page: 5)
  end

  private
  def user_params
    if logged_in?
      params.require(:user).permit(:username, :email, :password)
    else
      render_404
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

end
