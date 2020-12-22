class Api::V1::SegmentRulesController < ApplicationController
  # GET /api/v1/segment_rules
  def index
    @segment_rules = SegmentRule.order(created_at: :desc)
    render "segment_rules/index.json.jbuilder"
  end

  # GET /api/v1/segment_rules/:id
  def show
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
