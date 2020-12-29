require 'rails_helper'

RSpec.describe "Api::V1::Contacts", type: :request do
  # render_views
  describe "Fetch actions" do
    # initialize test data
    let!(:contacts) { create_list(:contact, 10) }
    let(:first_contact) { contacts.first }
    let(:last_contact) { contacts.last }

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

      context "endpoint contains query params of included relations e.g 'activities' & 'groups'" do
        # make the request
        before { get "/api/v1/contacts/#{first_contact.id}", params: { includes: ['activity', 'groups'] } }

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

        it "response contains included additional data about the relations in the included part"
      end

      context "endpoint contians unprocessable query params" do
        # make the request
        before { get "/api/v1/contacts/#{first_contact.id}", params: { includes: ['xyz'] } }

        it "it should return status code of 400 BAD REQUEST" do
          expect(response).to have_http_status(400)
        end

        it "response contains a list of JSON error messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Query Params is Invalid")
        end
      end
    end

    describe "GET /api/v1/contacts/search" do
    end

    describe "GET /api/v1/contacts/:id/activities" do
      context "contact does exist" do
        # make the request
        before { get "api/v1/contacts/#{first_contact.id}/activities", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a list of JSON contact activities"
      end

      context "contact does not exist" do
        # make the request
        before { get "api/v1/contacts/#{100}/activities", params: {} }

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

        it "response contains a list of JSON contact groups"
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
