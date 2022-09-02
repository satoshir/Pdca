class PdcasController < ApplicationController
    def index
      @pdcas = @user.pdca
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def destroy
    end

    private

    def pdca_params
    end

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_pdca
    end
end
