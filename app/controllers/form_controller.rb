class FormController < ApplicationController

  before_action :is_authenticated?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @forms = Form.desc(:created_at).entries
    @family = @forms.select{|x| x.relationship == "family"}
    @friends = @forms.select{|x| x.relationship == "friends"}
    # @form = Form.find_by(id: params[:id])
    # @forms = Form.where(relationship: relationship).limit(10).entries
    # @relationship = Form::RELATIONSHIP.map {|relationship| [relationship, relationship]}
  end

  def new
  end

  def create
    @user = current_user
    @form = @user.forms.build(form_params)
    if @form.save
      # redirect_to form_url(@form.id), notice: "You have successfully send your love."
      redirect_to root_url, notice: "You have successfully send your love."
    else
      render :new
      flash[:alert] = "Please fill in all fields"
    end
  end

  def show
    @form = Form.find(params[:id])
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    if
      @form.update(params[:form].permit(:name, :relationship, :message, :year, :image))
      redirect_to @form
    else
      render :edit
    end
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    redirect_to root_url, notice: "Your form has been deleted."
  end

  private

  def form_params
    params.require(:form).permit(:user_id, :id, :name, :relationship, :message, :year, :image)
  end


end