class SubstitutesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_substitute, only: [:show, :edit, :update, :destroy]

  # GET /substitutes
  # GET /substitutes.json
  def index
    @q = Substitute.ransack(params[:q])
    # @substitutes = Substitute.all
    @substitutes = @q.result.includes(:subject)
    
  end

  # GET /substitutes/1
  # GET /substitutes/1.json
  def show
  end

  # GET /substitutes/new
  def new
    @substitute = Substitute.new
  end

  # GET /substitutes/1/edit
  def edit
  end

  # POST /substitutes
  # POST /substitutes.json
  def create
    @substitute = Substitute.new(
      substitute_params,
      user_id: @current_user.id
    )

    respond_to do |format|
      if @substitute.save
        format.html { redirect_to @substitute, notice: 'Substitute was successfully created.' }
        format.json { render :show, status: :created, location: @substitute }
      else
        format.html { render :new }
        format.json { render json: @substitute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /substitutes/1
  # PATCH/PUT /substitutes/1.json
  def update
    respond_to do |format|
      if @substitute.update(substitute_params)
        format.html { redirect_to @substitute, notice: 'Substitute was successfully updated.' }
        format.json { render :show, status: :ok, location: @substitute }
      else
        format.html { render :edit }
        format.json { render json: @substitute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /substitutes/1
  # DELETE /substitutes/1.json
  def destroy
    @substitute.destroy
    respond_to do |format|
      format.html { redirect_to substitutes_url, notice: 'Substitute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_substitute
      @substitute = Substitute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def substitute_params
      params.require(:substitute).permit(:changed_at, :period, :subject_id)
    end
end
