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
          
        end
      end

      context "contact does not exist" do
        # make the request
        before { get "api/v1/contacts/#{100}", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages"
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

        it "response contains a list of JSON errors messages"
      end
    end

    describe "GET /api/v1/contacts/:id/groups" do
      context "contact does exist" do
        # make the request
        before { get "api/v1/contacts/#{first_contact.id}/groups", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a list of JSON contact groups"
      end

      context "contact does not exist" do
        # make the request
        before { get "api/v1/contacts/#{100}/groups", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end
        
        it "response contains a list of JSON errors messages"
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
