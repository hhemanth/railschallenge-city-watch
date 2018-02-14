class EmergenciesController < ApplicationController
  def create
    response = {}
    if new_emergency(emergency_params).save
      render json: {"emergency"=>new_emergency}, serializers: EmergencySerializer, status: 201
    else
      render json: {"message" => errors_for(new_emergency)}, status: 422
    end
  end

  def show
    render json: {"emergency"=> emergency}, serializers: EmergencySerializer, status: 200
  end

  def index
    render json: {"emergencies" => Emergency.all}, serializers: EmergencySerializer, status: 200
  end

  private

  def emergency
    @emergency ||= Emergency.find(params[:id])
  end

  def errors_for(e)
    e.errors.messages.reduce({}) {|acc, (k, v)| acc.merge(k => v.sort) }
  end

  def new_emergency(attrs={})
    @emergency ||= Emergency.new(attrs)
  end

  def emergency_params
    params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
  end

end
