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
        # expect(json_parser["data"][0]).to eq(last_group)
      end
    end

    describe "GET /api/v1/groups/:id" do
      context "group does exist" do
        it "it should return status code of 200 OK"
        it "response contains a detail information of groups"
      end

      context "group does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end

    describe "GET /api/v1/groups/:id/contacts" do
      context "group does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON group contacts"
      end

      context "group does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end

    describe "GET /api/v1/groups/:id/campaings" do
      context "group does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON group campaings"
      end

      context "group does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
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
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
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
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end
  end
end
