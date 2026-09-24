class UserSettingsController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def edit
  end

  def show
    @user = current_user
    @best_score = @user.scores
                        .joins(:course)
                        .select("courses.name AS course_name, MAX(scores.score) AS best_score")
                        .group("courses.name")
  end

  def update
    if @user.update(user_params)
      redirect_to user_setting_path, success: t("defaults.message.updated", item: User.model_name.human)
    else
      flash.now[:danger] = t("defaults.message.not_updated", item: User.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :nickname, :avatar, :avatar_cache)
  end
end
