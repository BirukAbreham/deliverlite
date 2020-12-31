require 'rails_helper'

RSpec.describe "Api::V1::Contacts", type: :request do
  # render_views
  describe "Fetch actions" do
    # initialize test data
    let!(:contacts) { create_list(:contact, 10) }
    let(:first_contact) { contacts.first }
    let(:last_contact) { contacts.last }

    # create groups
    let(:groups) { create_list(:group, 3) }
    # related the contacts and groups test data
    before do
      activity_one = create(:contact_activity, contact: first_contact)
      activity_two = create(:contact_activity, contact: first_contact)

      first_contact.groups << groups[0]
      first_contact.groups << groups[1]
      first_contact.groups << groups[2]

      last_contact.groups << groups[0]
      last_contact.groups << groups[1]
    end

    describe "GET /api/v1/contacts" do
      # make the request
      before { get '/api/v1/contacts', params: {} }

      it "it should return status code of 200 OK" do
        expect(response).to have_http_status(200)
      end

      it "response contains a list of JSON contacts" do
        expect(json_parser["data"].size).to eq(10)
      end

      it "response is return in from latest to oldest" do
        expect(json_parser["data"][0]["id"]).to eq(last_contact.id)
      end
    end

    describe "GET /api/v1/contacts/:id" do
      context "contact does exist" do
        # make the request
        before { get "/api/v1/contacts/#{first_contact.id}", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of contact" do
          expect(json_parser["data"]["id"]).to eq(first_contact.id)
          expect(json_parser["data"]["attributes"]["name"]).to eq(first_contact.name)
          expect(json_parser["data"]["attributes"]["email"]).to eq(first_contact.email)
          expect(json_parser["data"]["attributes"]["sent"]).to eq(first_contact.sent)
          expect(json_parser["data"]["attributes"]["open"]).to eq(first_contact.open)
        end

        it "response include related resources" do
          expect(json_parser["included"]["activities"]).to be_an_instance_of(Array)
          expect(json_parser["included"]["activities"].length).to eq(2)
          expect(json_parser["included"]["groups"]).to be_an_instance_of(Array)
          expect(json_parser["included"]["groups"].length).to eq(3)
        end
      end

      context "contact does not exist" do
        # make the request
        before { get "/api/v1/contacts/#{100}", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end
      end
    end

    describe "GET /api/v1/contacts/search" do
    end

    describe "GET /api/v1/contacts/:id/activities" do
      context "contact does exist" do
        # make the request
        before { get "/api/v1/contacts/#{first_contact.id}/activities", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of contact" do
          expect(json_parser["data"]["id"]).to eq(first_contact.id)
          expect(json_parser["data"]["attributes"]["name"]).to eq(first_contact.name)
          expect(json_parser["data"]["attributes"]["email"]).to eq(first_contact.email)
          expect(json_parser["data"]["attributes"]["sent"]).to eq(first_contact.sent)
          expect(json_parser["data"]["attributes"]["open"]).to eq(first_contact.open)
        end

        it "response contains a list of JSON contact activities" do
          expect(json_parser["included"]["activities"]).to be_an_instance_of(Array)
          expect(json_parser["included"]["activities"].length).to eq(2)
          expect(json_parser["included"]["groups"]).to be_nil
        end
      end

      context "contact does not exist" do
        # make the request
        before { get "/api/v1/contacts/#{100}/activities", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end
      end
    end

    describe "GET /api/v1/contacts/:id/groups" do
      context "contact does exist" do
        # make the request
        before { get "/api/v1/contacts/#{first_contact.id}/groups", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of contact" do
          expect(json_parser["data"]["id"]).to eq(first_contact.id)
          expect(json_parser["data"]["attributes"]["name"]).to eq(first_contact.name)
          expect(json_parser["data"]["attributes"]["email"]).to eq(first_contact.email)
          expect(json_parser["data"]["attributes"]["sent"]).to eq(first_contact.sent)
          expect(json_parser["data"]["attributes"]["open"]).to eq(first_contact.open)
        end

        it "response contains a list of JSON contact groups" do
          expect(json_parser["included"]["groups"]).to be_an_instance_of(Array)
          expect(json_parser["included"]["groups"].length).to eq(3)
          expect(json_parser["included"]["activities"]).to be_nil
        end
      end

      context "contact does not exist" do
        # make the request
        before { get "/api/v1/contacts/#{100}/groups", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end
        
        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end
      end
    end
  end

  describe "Operations on contacts" do
    describe "POST /api/v1/contacts" do
      context "with proper contact data" do
        it "it should return status code of 201 CREATED"
        it "response contains a JSON of the created contact"
      end

      context "with improper contact data" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "PUT/PATCH /api/v1/contacts/:id" do
      context "with proper data, contact does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "contact does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end

      context "with improper data, contact does exist" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "DELETE /api/v1/contacts/:id" do
      context "contact does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "contact does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end
  end
end
