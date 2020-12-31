class Api::V1::ContactsController < ApplicationController
  # GET /api/v1/contacts
  def index
    @contacts = Contact.order(created_at: :desc)
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
