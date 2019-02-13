# conrtoller for expense
class ExpensesController < ApplicationController
  def index
    @all_expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    expense_params = params[:expense]
    Expense.find_or_create_by(detail: expense_params[:detail]).tap do |e|
      price = expense_params[:price].to_i + e.price.to_i
      e.update(price: price, image: expense_params[:image])
    end
    redirect_to expenses_path
  end
end
