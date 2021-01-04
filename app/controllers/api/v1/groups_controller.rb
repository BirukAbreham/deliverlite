class Api::V1::GroupsController < ApplicationController
  # GET /api/v1/groups
  def index
    begin
      @page = Integer(params[:page] || 1)
      @per_page = Integer(params[:per_page] || 10)
      @groups = Group
        .paginate(page: @page, per_page: @per_page)
        .order(created_at: :desc)
      @total_pages = @groups.total_pages
      render 'groups/index.json.jbuilder', status: :ok
    rescue ArgumentError => exception
      raise QueryParamsError.new("Pagination query params is invalid")
    end
  end

  # GET /api/v1/groups/:id
  def show
    if params[:include].nil?
      @group = Group.find(params[:id])
    end
    render "groups/show.json.jbuilder", status: :ok
  end

  # GET /api/v1/groups/:id/contacts
  def contacts
  end

  # GET /api/v1/groups/:id/campaigns
  def campaigns
  end

  # POST /api/v1/groups
  def create
  end

  # PUT/PATCH /api/v1/groups/:id
  def update
  end

  # DELETE /api/v1/groups/:id
  def destroy
  end
end
