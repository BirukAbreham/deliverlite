module ExceptionHandler
  extend ActiveSupport::Concern

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
  end
end
