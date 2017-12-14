class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :img_url,
      :date_of_birth, :gender, :sexual_orientation, :age_preference, :introduction,
      :dream_job, :cooking_preference, :book_preference, :movie_preference, :pet_preference,
      :favorite_youtuber, :outdoor_activity_preference, :indoor_activity_preference, :inside_joke,
      :intelligence_level, :what_do_you_do, :post_first_date)
  end
end
