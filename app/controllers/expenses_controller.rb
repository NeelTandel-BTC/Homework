# conrtoller for expense
class ExpensesController < ApplicationController
  def index
    @all_expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    create_or_update
    redirect_to expenses_path
  end

  def create_or_update
    expense_params = params[:expense]
    Expense.find_or_create_by(detail: expense_params[:detail]).tap do |e|
      price = expense_params[:price].to_i + e.price.to_i
      e.update(price: price, image: expense_params[:image])
      FirstJobJob.perform_later 3
    end
  end

  def self.job_done(args)
    flash.now[:notice] = "job done in #{args}"
    redirect_to new_expense_path
  end
end
