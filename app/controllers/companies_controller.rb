class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
    render :new
  end

  def create
    byebug
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def show
    render :show
  end

  def edit
    @company.employees.build
    @employee = Employee.new
    render :edit
  end

  def update
    # byebug
    # @employee = Employee.new()
    if @company.employees.build(e_params)
      @company.employees.last.save
      redirect_to @company
    else
      render :edit
    end
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end

  def e_params
    params.require(:company).require(:employee).permit(:name, :title)
  end

  def office_params
    params.require(:company).require(:office).permit(floor:[])
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
