class AddExaminationsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_add_examination, only: [:show, :edit, :update, :destroy]

  # GET /add_examinations
  # GET /add_examinations.json
  def index
    @add_examinations = AddExamination.all
  end

  # GET /add_examinations/1
  # GET /add_examinations/1.json
  def show
  end

  # GET /add_examinations/new
  def new
    @add_examination = AddExamination.new
  end

  # GET /add_examinations/1/edit
  def edit
  end

  # POST /add_examinations
  # POST /add_examinations.json
  def create
    @add_examination = AddExamination.new(add_examination_params)

    respond_to do |format|
      if @add_examination.save
        format.html { redirect_to @add_examination, notice: 'Add examination was successfully created.' }
        format.json { render :show, status: :created, location: @add_examination }
      else
        format.html { render :new }
        format.json { render json: @add_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_examinations/1
  # PATCH/PUT /add_examinations/1.json
  def update
    respond_to do |format|
      if @add_examination.update(add_examination_params)
        format.html { redirect_to @add_examination, notice: 'Add examination was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_examination }
      else
        format.html { render :edit }
        format.json { render json: @add_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_examinations/1
  # DELETE /add_examinations/1.json
  def destroy
    @add_examination.destroy
    respond_to do |format|
      format.html { redirect_to add_examinations_url, notice: 'Add examination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_examination
      @add_examination = AddExamination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_examination_params
      params.require(:add_examination).permit(:category, :subject_id, :place, :comment)
    end
end
