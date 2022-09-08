class PdcasController < ApplicationController
    before_action :set_user
    before_action :set_pdca

    def index
      @pdcas = @user.pdcas
    end

    def show
    end

    def new
        @pdca = Pdca.new
    end

    def create
        @pdca = @user.pdcas.build(pdca_params)
        if @pdca.save
            flash[:success] = "タスクを新規作成しました。"
            redirect_to user_pdcas_url @user
        else
            flash[:danger] = "5文字以上入力してください。"
            render :new
        end
    end

    def update
      if @pdca.update(pdca_params)
        flash[:success] = "タスクを更新しました。"
        redirect_to user_pdca_url(@user, @pdca)
      else
        render :edit
      end
    end


    def edit
    end

    def destroy
      @pdca.destroy
      flash[:success] = "タスクを削除しました。"
      redirect_to user_pdcas_url @user
    end

    private

    def pdca_params
      params.require(:pdca).permit(:plan, :do, :check, :adjust)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_pdca
     @pdca = @user.pdcas.find_by(id: params[:id])   
    end
end
