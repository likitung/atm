module Api::V1
  class AtmsController < ApiController
    before_action :set_atm, only: %i[deposit]

    def create
      @atm = Atm.new(atm_params)

      if @atm.save
        render :show, status: 201
      else
        render json: { errors: @atm.errors }, status: :unprocessable_entity
      end
    end

    def deposit
      command = DepositToAtm.call(@atm, banknote_params)
      if command.success?
        @deposit = command.result
        render json: @deposit, status: 201
      else
        render json: { errors: command.errors }, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_atm
      @atm = Atm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atm_params
      params.require(:atm).permit(:name, banknotes_attributes:[:value])
    end

    def banknote_params
      params.require(:banknote)
    end
  end
end
