class AddExaminationsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :destroy]
    before_action :ensure_correct_user, only: [:edit, :update, :destroy]
    before_action :set_add_examination, only: [:show, :edit, :update, :destroy]

    # GET /add_examinations
    # GET /add_examinations.json
    def index
        @q = AddExamination.ransack(params[:q])
        # @add_examinations = AddExamination.all
        @add_examinations = @q.result.includes(:subject).page(params[:page])
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
        @add_examination = @current_user.add_examinations.build(add_examination_params)
        respond_to do |format|
            if @add_examination.save
                format.html { redirect_to @add_examination, notice: '正常に作成できました' }
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
                format.html { redirect_to @add_examination, notice: '正常に更新されました' }
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
            format.html { redirect_to add_examinations_url, notice: '正常に削除されました' }
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
            params.require(:add_examination).permit(:scheduled_at, :category, :subject_id, :place, :comment)
        end

        def ensure_correct_user
            @add_examination = AddExamination.find_by(id:params[:id])
            if (@add_examination.user_id != @current_user.id) && @current_user.admin_user == false
                flash[:alert] = "権限がありません"
                redirect_to add_examinations_path
            end
        end

end