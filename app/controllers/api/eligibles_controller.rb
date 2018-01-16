class Api::EligiblesController < ApplicationController
  def index
    @user = current_user
    if current_user.gender === 'male' &&
      current_user.sexual_orientation === 'straight'
      @eligibles = User.where(:gender => 'female', :sexual_orientation => 'straight') + User.where(:gender => 'female', :sexual_orientation => 'bisexual')
      @eligibles.each do |el|
        # if !current_user.rejects_by_id.include?(el.id)
          Eligible.create(user_id: current_user.id, eligible_id: el.id)
        # end
      end
    elsif current_user.gender === 'male' &&
      current_user.sexual_orientation === 'gay'
      @eligibles = User.where(:gender => 'male', :sexual_orientation => 'bisexual') + User.where(:gender => 'male', :sexual_orientation => 'gay')
      @eligibles.each do |el|
        # if !current_user.rejects_by_id.include?(el.id)
          Eligible.create(user_id: current_user.id, eligible_id: el.id)
        # end
      end
    elsif current_user.gender === 'female' &&
      current_user.sexual_orientation === 'straight'
      @eligibles = User.where(:gender => 'male', :sexual_orientation => 'straight') + User.where(:gender => 'male', :sexual_orientation => 'bisexual')
      @eligibles.each do |el|
        # if !current_user.rejects_by_id.include?(el.id)
          Eligible.create(user_id: current_user.id, eligible_id: el.id)
        # end
      end
    elsif current_user.gender === 'female' &&
      current_user.sexual_orientation === 'lesbian'
      @eligibles = User.where(:gender => 'female', :sexual_orientation => 'bisexual') + User.where(:gender => 'female', :sexual_orientation => 'gay')
      @eligibles.each do |el|
        # if !current_user.rejects_by_id.include?(el.id)
          Eligible.create(user_id: current_user.id, eligible_id: el.id)
        # end
      end
    end
  end

  def create
    user_id = current_user.id
    eligible_id = params[:user_id]
    @eligible = Eligible.new(user_id: user_id, eligible_id: eligible_id)

    if @eligible.save
      render :show
    else
      render json: @eligible.errors.full_messages, status: 422
    end
  end

  def destroy
    @eligible = Eligible.find_by(user_id: current_user.id, eligible_id: params[:id])

    if @eligible.delete
      render :show
    else
      render json: @eligible.errors.full_messages, status: 422
    end
  end
end
