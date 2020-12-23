require 'rails_helper'

RSpec.describe "Api::V1::SegmentRules", type: :request do
  describe "Fetch actions" do
    # initialize test data
    let!(:segment_rules) { create_list(:segment_rule, 5) }
    let(:first_segment_rule) { segment_rules.first }
    let(:last_segment_rule) { segment_rules.last }

    describe "GET /api/v1/segment_rules" do
      # make the request
      before { get "/api/v1/segment_rules", params: {} }

      it "it should return status code of 200 OK" do
        expect(response).to have_http_status(200)
      end

      it "response contains a list of JSON segments" do
        expect(json_parser["data"].size).to eq(5)
      end

      it "response is returned in a manner latest to oldest" do
        expect(json_parser["data"][0]["id"]).to eq(last_segment_rule.id)
      end
    end

    describe "GET /api/v1/segment_rules/:id" do
      context "segment_rule does exist" do
        # make the request
        before { get "/api/v1/segment_rules/#{first_segment_rule.id}", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of contact" do
          expect(json_parser["data"]["id"]).to eq(first_segment_rule.id)
          expect(json_parser["data"]["attributes"]["operator"]).to eq(first_segment_rule.operator)
          expect(json_parser["data"]["attributes"]["arguments"]).to eq(first_segment_rule.arguments)
        end
      end

      context "segment_rule does not exist" do
        # make the request
        before { get "/api/v1/segment_rules/#{100}", params: {} }

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
