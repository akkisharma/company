class Api::V1::EmployeesController < ApplicationController

  def show
  	employee_hierarchy = Employee.find(params[:id]).path rescue {}
  	render json: {status: "SUCCESS", message: "load employee hierarchy", data: employee_hierarchy}, status: :ok
  end

  def create
  	response = {}
  	employee = Employee.find(params[:parent_id]) rescue nil
  	if employee.present?
  		employee_params.delete(:parent_id)
  		if children = employee.children.create!(employee_params)
  			response = {status: "SUCCESS", message: "employee created under #{employee.email} - #{employee.role.name}", data: children}
  		else
  			response = {status: "FAILED", message: "employee not saved #{employee.email} - #{employee.role.name}", data: children}
  		end
  	end
  	render json: response, status: :ok
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :salary, :rating, :parent_id, :role_id)
  end

end
