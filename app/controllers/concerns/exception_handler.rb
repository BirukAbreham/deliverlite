module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class QueryParamsError < StandardError; end

  included do
    # record not found
    rescue_from ActiveRecord::RecordNotFound do |e|
      @errors = Array.[](
        {
          status: 404,
          title: "Record Not Found",
          detail: "#{e.message}"
        }
      )
      render "errors/not_found.json.jbuilder", status: :not_found
    end

    # query params is invalid
    rescue_from ExceptionHandler::QueryParamsError do |e|
      @errors = Array.[](
        status: 400,
        title: "Query Params is invalide",
        detail: "#{e.message}"
      )
      render "errors/bad_request.json.jbuilder", status: :bad_request
    end
  end
end
