class Api::V1::ContactsController < ApplicationController
  # GET /api/v1/contacts
  def index
    @page = (params[:page] || 1).to_i
    @per_page = (params[:per_page] || 10).to_i
    @contacts = Contact
      .paginate(page: @page, per_page: @per_page)
      .order(created_at: :desc)
    @total_pages = @contacts.total_pages
    render "contacts/index.json.jbuilder", status: :ok
  end

  # GET /api/v1/contacts/:id
  def show
    @contact = Contact.with_relations(params[:id])
    render "contacts/show.json.jbuilder", status: :ok
  end

  # GET /api/v1/contacts/search
  def search
  end

  # GET /api/v1/contacts/:id/activities
  def activity
    @contact = Contact.activities(params[:id])
    render "contacts/show.json.jbuilder", status: :ok
  end

  # GET /api/v1/contacts/:id/groups
  def groups
    @contact = Contact.contact_groups(params[:id])
    render "contacts/show.json.jbuilder", status: :ok
  end

  # POST /api/v1/contacts
  def create
  end

  # PUT/PATCH /api/v1/contacts/:id
  def update
  end

  # DELETE /api/v1/contacts/:id
  def destroy
  end
end
