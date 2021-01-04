class Api::V1::SegmentsController < ApplicationController
  # GET /api/v1/segments
  def index
    begin
      @page = Integer(params[:page] || 1)
      @per_page = Integer(params[:per_page] || 10)
      @segments = Segment
        .paginate(page: @page, per_page: @per_page)
        .order(created_at: :desc)
      @total_pages = @segments.total_pages
      render "segments/index.json.jbuilder", status: :ok
    rescue ArgumentError => exception
      raise QueryParamsError.new("Pagination query params is invalid")
    end
  end

  # GET /api/v1/segments/:id
  def show
    if params[:include].nil?
      @segment = Segment.find(params[:id])
    end
    render "segments/show.json.jbuilder", status: :ok
  end

  # GET /api/v1/segments/:id/rules
  def rules
  end

  # POST /api/v1/segments
  def create
  end

  # PUT/PATCH /api/v1/segments/:id
  def update
  end

  # DELETE /api/v1/segments/:id
  def destroy
  end
end
