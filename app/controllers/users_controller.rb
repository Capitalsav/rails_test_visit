class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :validate_file_format, only: :upload

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      flash[:success] = 'User was successfully destroyed.'
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def new_upload
  end

  def upload
    respond_to do |format|
      if User::parse_csv_users(params[:file_csv])
        flash[:success] = 'Information uploaded'
        format.html { redirect_to users_path }
      else
        flash[:danger] = 'Invalid data'
        format.html { redirect_back fallback_location: root_path }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :date, :number, :description)
    end

    def validate_file_format
      format_file = params[:file_csv].original_filename.split('.').last
      unless format_file == 'csv'
        respond_to do |format|
          flash[:danger] = "Invalid format - #{format_file}! Only CSV available!"
          format.html {  redirect_back fallback_location: root_path }
        end
      end
    end
end
