require 'rails_helper'

RSpec.describe "Api::V1::Segments", type: :request do
  describe "Fetch actions" do
    describe "GET /api/v1/segments" do
      it "it should return status code of 200 OK"
      it "response contains a list of JSON segments"
    end

    describe "GET /api/v1/segments/:id" do
      context "segment does exist" do
        it "it should return status code of 200 OK"
        it "response contains a detail information of segments"
      end

      context "segment does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end

    describe "GET /api/v1/segments/:id/rules" do
      context "segment does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON segment rules"
      end

      context "segment does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end
  end

  describe "Operations on segments" do
    describe "POST /api/v1/segments" do
      context "with proper segment data" do
        it "it should return status code of 201 CREATED"
        it "response contains a JSON of the created segment"
      end

      context "with improper segment data" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "PUT/PATCH /api/v1/segments/:id" do
      context "with proper data, segment does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "segment does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end

      context "with improper data, segment does exist" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "DELETE /api/v1/segments/:id" do
      context "segment does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "segment does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end
  end
end
