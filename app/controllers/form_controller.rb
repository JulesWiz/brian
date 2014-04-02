class FormController < ApplicationController

  before_action :is_authenticated?, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @forms = Form.desc(:created_at).entries
    @family = @forms.select{|x| x.relationship == "family"}
    @friends = @forms.select{|x| x.relationship == "friends"}
  end

  def new
    @user = current_user
    @form = @user.forms.new
  end

  def create
    @user = current_user
    @form = @user.forms.new(form_params)
    if @form.save
      redirect_to root_url, notice: "You have successfully send your love."
    else
      render :new
      flash[:alert] = "Please fill in all fields"
    end
  end

  def show
  end

  def edit
  end

  def update
    if
      @form.update(params[:form].permit(:name, :relationship, :message, :year, :image))
      redirect_to @form
    else
      render :edit
    end
  end

  def destroy
    @form.destroy
    redirect_to root_url, notice: "Your form has been deleted."
  end

  private

  def form_params
    params.require(:form).permit(:user_id, :id, :name, :relationship, :message, :year, :image)
  end

  def set_message
    @form = Form.find(params[:id])
  end


end