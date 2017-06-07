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

    def serialize_payments(payments)
      payments.split(",").map { |item| item.to_f }
    end

    def loan_params
      params.require(:loan).permit(:body, payments: [])
    end
  end
end