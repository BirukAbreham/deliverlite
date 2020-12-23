require 'rails_helper'

RSpec.describe "Api::V1::Groups", type: :request do
  describe "Fetch actions" do
    # initialize test data
    let!(:groups) { create_list(:group, 5) }
    let(:first_group) { groups.first }
    let(:last_group) { groups.last }

    describe "GET /api/v1/groups" do
      # make the request
      before { get "/api/v1/groups", params: {} }

      it "it should return status code of 200 OK" do
        expect(response).to have_http_status(200)
      end

      it "response contains a list of JSON groups" do
        expect(json_parser["data"].size).to eq(5)
      end

      it "response is returned in formmat latest to oldest" do
        expect(json_parser["data"][0]["id"]).to eq(last_group.id)
      end
    end

    describe "GET /api/v1/groups/:id" do
      context "group does exist" do
        # make the request
        before { get "/api/v1/groups/#{first_group.id}", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of groups" do
          expect(json_parser["data"]["id"]).to eq(first_group.id)
          expect(json_parser["data"]["attributes"]["name"]).to eq(first_group.name)
          expect(json_parser["data"]["attributes"]["total"]).to eq(first_group.total)
          expect(json_parser["data"]["attributes"]["active"]).to eq(first_group.active)
          expect(json_parser["data"]["attributes"]["unsubscribed"]).to eq(first_group.unsubscribed)
        end
      end

      context "group does not exist" do
        # make the request
        before { get "/api/v1/groups/#{100}", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end    
      end
    end

    describe "GET /api/v1/groups/:id/contacts" do
      context "group does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON group contacts"
      end

      context "group does not exist" do
        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end    
      end
    end

    describe "GET /api/v1/groups/:id/campaings" do
      context "group does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON group campaings"
      end

      context "group does not exist" do
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

  describe "Operations on groups" do
    describe "POST /api/v1/groups" do
      context "with proper group data" do
        it "it should return status code of 201 CREATED"
        it "response contains a JSON of the created group"
      end

      context "with improper group data" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "PUT/PATCH /api/v1/groups/:id" do
      context "with proper data, group does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "group does not exist" do
        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end
      end

      context "with improper data, group does exist" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "DELETE /api/v1/groups/:id" do
      context "group does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "group does not exist" do
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
end
