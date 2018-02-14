class EmergenciesController < ApplicationController
	def create
		response = {}
		emergency = Emergency.new(emergency_params)
		passed_params = params["emergency"].keys
		valid_params = ["code", "fire_severity", "police_severity", "medical_severity"]
		extra_params = passed_params - valid_params
		if extra_params.size > 0
			response["message"] = "found unpermitted parameter: #{extra_params.first}"
			status_code = 422
			render json: response, status: status_code and return
		end

		if emergency.valid?
			emergency.save!
			response['emergency'] = emergency.slice(:code, :fire_severity, :medical_severity, :police_severity)
			status_code = 201
		else
			response["message"] = emergency.errors
			status_code = 422
		end

		render json: response, status: status_code
	end

  def index
		response = {

		}

		render json: response, status: status_code

	end

	private

	def emergency_params
		params.require(:emergency).permit(:code, :fire_severity, :police_severity, :medical_severity)
	end

end