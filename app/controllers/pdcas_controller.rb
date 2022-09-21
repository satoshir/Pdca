class PdcasController < ApplicationController
    before_action :set_user
    before_action :set_pdca

    def index
      @today = Date.today
      @pdcas = @user.pdcas
      @pdcas = Pdca.where(done_at:nil).order(:time)
      @pdcas_done = Pdca.where.not(done_at:nil)
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
            flash.now[:danger] = "5文字以上入力してください。"
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

    def done
      @today = Date.today
      pdca = Pdca.find(params[:id])
      pdca.update(done_at: @today )
      redirect_to :action => "index"
    end


    def edit
    end

    def destroy
      @pdca.destroy
      flash[:success] = "タスクを削除しました。"
      redirect_to user_pdcas_url @user
    end

    # def finish
    # end
    




    private

    def pdca_params
      params.require(:pdca).permit(:plan, :do, :check, :adjust, :time, :title, :done_at)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_pdca
     @pdca = @user.pdcas.find_by(id: params[:id])   
    end
end
