module Api
  class LoansController < BaseController
    def index
      render json: Loan.all
    end

    def create
      @loan = Loan.new(loan_params)
      if @loan.save
        render json: @loan
      else
        render json: { errors: @loan.errors, status: :unprocessable_entity }
      end
    end

    private

    def loan_params
      params.require(:loan).permit(:body, :term, payments: [])
    end
  end
end
