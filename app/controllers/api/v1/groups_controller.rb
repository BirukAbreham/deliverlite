class Api::V1::GroupsController < ApplicationController
  # GET /api/v1/groups
  def index
    @groups = Group.order(created_at: :desc)
    render 'groups/index.json.jbuilder', status: :ok
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
