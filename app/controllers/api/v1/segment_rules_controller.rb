class Api::V1::SegmentRulesController < ApplicationController
  # GET /api/v1/segment_rules
  def index
    begin
      @page = Integer(params[:page] || 1)
      @per_page = Integer(params[:per_page] || 10)
      @segment_rules = SegmentRule
        .paginate(page: @page, per_page: @per_page)
        .order(created_at: :desc)
      @total_pages = @segment_rules.total_pages
      render "segment_rules/index.json.jbuilder", status: :ok
    rescue ArgumentError => exception
      raise QueryParamsError.new("Pagination query params is invalid")
    end
  end

  # GET /api/v1/segment_rules/:id
  def show
    if params[:include].nil?
      @segment_rule = SegmentRule.find(params[:id])      
    end
    render "segment_rules/show.json.jbuilder", status: :ok
  end

  # POST /api/v1/segment_rules
  def create
  end

  # PUT/PATCH /api/v1/segment_rules/:id
  def update
  end

  # DELETE /api/v1/segment_rules/:id
  def destroy
  end
end
