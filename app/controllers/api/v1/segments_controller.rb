class Api::V1::SegmentsController < ApplicationController
  # GET /api/v1/segments
  def index
    @segments = Segment.order(created_at: :desc)
    render "segments/index.json.jbuilder", status: :ok
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
