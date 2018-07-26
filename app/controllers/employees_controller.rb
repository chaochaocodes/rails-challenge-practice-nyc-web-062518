class EmployeesController < ApplicationController
  def destroy
    @employee = Employee.find(params[:id])
    @company = @employee.company
    @employee.delete
    redirect_to @company
  end


end
