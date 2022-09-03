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
          redirect_to user_pdcas_url @pdca
        else
          render :new
        end
      end

    def edit
    end

    def destroy
    end

    private

    def pdca_params
      params.permit(:plan, :do, :check, :adjust)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_pdca
    end
end
