require 'rails_helper'

RSpec.describe "Api::V1::SegmentRules", type: :request do
  describe "Fetch actions" do
    describe "GET /api/v1/segment_rules" do
      it "it should return status code of 200 OK"
      it "response contains a list of JSON segments"
    end

    describe "GET /api/v1/segment_rules/:id" do
      context "segment_rule does exist" do
        it "it should return status code of 200 OK"
        it "response contains a detail information of segment_rules"
      end

      context "segment_rule does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"    
      end
    end
  end

  describe "Operations on segment rules" do
    describe "POST /api/v1/segment_rules" do
      context "with proper segment_rule data" do
        it "it should return status code of 201 CREATED"
        it "response contains a JSON of the created segment_rule"
      end

      context "with improper segment_rule data" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "PUT/PATCH /api/v1/segment_rules/:id" do
      context "with proper data, segment_rule does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "segment_rule does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end

      context "with improper data, segment_rule does exist" do
        it "it should return status code of 422 UNPROCESSABLE ENTITY"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "DELETE /api/v1/segment_rules/:id" do
      context "segment_rule does exist" do
        it "it should return status code of 204 NO CONTENT"
        it "resonse contains nothing empty"
      end

      context "segment_rule does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end
  end
end
