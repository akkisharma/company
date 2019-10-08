class Api::V1::EmployeesController < ApplicationController


	## 2. Create a rest endpoint to print hierarchy given any position in the above mentioned organization (Direction: bottom to top).
  def show
  	employee_hierarchy = Employee.find(params[:id]).path rescue {}
  	render json: {status: "SUCCESS", message: "load employee hierarchy", data: employee_hierarchy}, status: :ok
  end

  ## 1. Create a rest endpoint to input employee details(name ,id, salary,rating etc) in any order (employees might be input before his manager)
  def create
  	response = {}
  	employee = Employee.find(params[:parent_id]) rescue nil
  	if employee.present?
			children = employee.children.new(name: employee_params[:name], email: employee_params[:email], salary: employee_params[:salary].to_d, rating: employee_params[:rating].to_f, role_id: employee_params[:role_id].to_i)
  		if children.save
  			response = {status: "SUCCESS", message: "employee created under #{employee.email} - #{employee.role.name}", data: children}
  		else
  			response = {status: "FAILED", message: "employee not saved #{employee.email} - #{employee.role.name}", data: children}
  		end
  	end
  	render json: response, status: (children.present? ? :ok : :unprocessable_entity)
  end

  ## 3. Top 10 employees with ratio of salary
  def ratio_salary
  	employees = Employee.order(salary: :desc).limit(10)
  	render json: {status: "SUCCESS", message: "Top 10 ratio salary employee hierarchy", data: employees}, status: :ok
  end


  private

  def employee_params
    params.permit(:name, :email, :salary, :rating, :parent_id, :role_id)
  end

end
