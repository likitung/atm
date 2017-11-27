module Api::V1
  class BanknotesController < ApiController
    def create
      @banknote = Banknote.new(banknote_params)
      if @banknote.save
        render :show, status: 201
      else
        render json: { errors: @banknote.errors }, status: :unprocessable_entity
      end
    end

    private

    def set_banknote
      @atm = Banknote.find(params[:id])
    end

    def banknote_params
      params.require(:banknote).permit(:value)
    end
  end
end
