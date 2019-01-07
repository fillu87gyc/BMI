# frozen_string_literal: true

class BmiController < ApplicationController
  def index
    if request.get?
      @has_error_mass   = false
      @has_error_height = false
      return
    end
    @has_error_mass   = !input_check_try_int_parse(params[:mass])
    @has_error_height = !input_check_try_int_parse(params[:height])

    return if @has_error_height && @has_error_mass

    @mass = params[:mass].to_i
    @height = params[:height].to_i

    mass = @mass
    height = @height

    update_errors(mass, height) if mass_range_err?(mass) || height_range_err?(height)

    @has_error_height = false
    @has_error_mass = false
    @bmi_result = mass / ((height * height).to_f / 10_000.to_f)
  end

  def show; end

  def create; end

  def mass_range_err?(mass)
    mass > 200 || mass < 1
  end

  def height_range_err?(height)
    height > 200 || height < 10
  end

  def input_check_try_int_parse(str)
    str =~ /^[0-9]+$/
  end

  def update_errors(mass, height)
    @has_error_mass = mass_range_err?(mass)
    @has_error_height = height_range_err?(height)
  end
end
