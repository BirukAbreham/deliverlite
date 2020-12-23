class Api::V1::SegmentRulesController < ApplicationController
  # GET /api/v1/segment_rules
  def index
    @segment_rules = SegmentRule.order(created_at: :desc)
    render "segment_rules/index.json.jbuilder", status: :ok
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
