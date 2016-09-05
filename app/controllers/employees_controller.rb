class EmployeesController < ApplicationController
  def index
    @employees = Employee.joins(:person)
  end
end
