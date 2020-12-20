require 'rails_helper'

RSpec.describe "Api::V1::Campaigns", type: :request do
  describe "Fetch actions" do
    describe "GET /api/v1/campaigns" do
      it "it should return status code of 200 OK"
      it "response contains a list of JSON campaigns"
    end

    describe "GET /api/v1/campaigns/:id" do
      context "campaign does exist" do
        it "it should return status code of 200 OK"
        it "response contains a detail information of campaigns"
      end

      context "campaign does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end

    describe "GET /api/v1/campaigns/:id/activities" do
      context "campaign does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON campaign activities"
      end

      context "campaign does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end

    describe "GET /api/v1/campaigns/:id/groups" do
      context "campaign does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON campaign groups"
      end

      context "campaign does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end
  end

  describe "Operations on campaigns" do
    describe "POST /api/v1/campaigns" do
      context "with proper campaign data" do
        it "it should return status code of 201 CREATED"
        it "response contains a JSON of the created campaign"
      end

      context "with improper campaign data" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "PUT/PATCH /api/v1/campaigns/:id" do
      context "with proper data, campaign does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "campaign does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end

      context "with improper data, campaign does exist" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "DELETE /api/v1/campaigns/:id" do
      context "campaign does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "campaign does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end
  end
end
