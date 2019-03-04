class FeedbacksController < ApplicationController
  before_action :find_feedback, only: [:show, :index, :edit, :update, :destroy]
  def index; end

  def show; end

  def new
    @feedback = Feedback.new
  end

  def edit; end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html do
          redirect_to @feedback, notice: t("feedback.mess_create")
        end
      else
        format.html{render :new}
      end
    end
  end

  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html do
        redirect_to feedbacks_url, notice: t("feedback.mess_destroy")
      end
      format.json{head :no_content}
    end
  end

  private

  def find_feedback
    return if @feedback = Feedback.find_by(id: params[:id])
    redirect_to root_path
  end

  def feedback_params
    params.require(:feedback).permit(:product_id,
      :user_id, :content, :title, :name)
  end
end
