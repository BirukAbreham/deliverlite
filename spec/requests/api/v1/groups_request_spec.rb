require 'rails_helper'

RSpec.describe "Api::V1::Groups", type: :request do
  describe "Fetch actions" do
    describe "GET /api/v1/groups" do
      it "it should return status code of 200 OK"
      it "response contains a list of JSON groups"
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
