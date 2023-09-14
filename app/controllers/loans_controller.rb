class LoansController < ApplicationController
  def index
    @loans = Loan.all
    if params[:user_id].present?
      @loans = @loans.where(user_id: params[:user_id])
    end
    if params[:book_id].present?
      @loans = @loans.where(book_id: params[:book_id])
    end
    if params[:returned].present?
      @loans = @loans.where(returned: params[:returned])
    end

    render json: @loans
  end

  def show
    begin
      render json: loan, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  def create
    loan_params["returned"] = false
    @loan = Loan.new(loan_params)
    @book = Book.find(params[:book_id])
    if @loan.save
      @book.update(available: false)
      render json: @loan, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  def return
    begin
      loan.update(returned: true, return_date: Date.today)
      @book = Book.find(loan.book_id)
      @book.update(available: true)
      render json: loan, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end


  private

  def loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.permit(:user_id, :book_id).merge(returned: false)
  end

end
