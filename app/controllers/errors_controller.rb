class ErrorsController < ApplicationController
    def catch_404
      response = {"message" => "page not found"}
      render json: response, status: 404
    end
end