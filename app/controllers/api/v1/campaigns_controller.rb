class Api::V1::CampaignsController < ApplicationController
  # GET /api/v1/campaigns
  def index
    begin
      @page = Integer(params[:page] || 1)
      @per_page = Integer(params[:per_page] || 10)
      @campaigns = Campaign
        .paginate(page: @page, per_page: @per_page)
        .order(created_at: :desc)
      @total_pages = @campaigns.total_pages
      render "campaigns/index.json.jbuilder", status: :ok
    rescue ArgumentError => exception
      raise QueryParamsError.new("Pagination query params is invalid")
    end
  end

  # GET /api/v1/campaigns/:id
  def show
    if params[:include].nil?
      @campaign = Campaign.find(params[:id])
    end
    render "campaigns/show.json.jbuilder", status: :ok
  end

  # GET /api/v1/campaigns/:id/activities
  def activity
  end

  # GET /api/v1/campaigns/:id/groups
  def groups
  end

  # POST /api/v1/campaigns
  def create
  end

  # PUT/PATCH /api/v1/campaigns/:id
  def update
  end

  # DELETE /api/v1/campaigns/:id
  def destroy
  end
end
