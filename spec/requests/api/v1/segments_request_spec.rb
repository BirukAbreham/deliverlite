require 'rails_helper'

RSpec.describe "Api::V1::Segments", type: :request do
  describe "Fetch actions" do
    # initialize test data
    let!(:segments) { create_list(:segment, 5) }
    let(:first_segment) { segments.first }
    let(:last_segment) { segments.last }

    describe "GET /api/v1/segments" do
      # make the request
      before { get "/api/v1/segments", params: {} }

      it "it should return status code of 200 OK" do
        expect(response).to have_http_status(200)
      end

      it "response contains a list of JSON segments" do
        expect(json_parser["data"].size).to eq(5)
      end

      it "response is returned in a manner from latest to oldest" do
        expect(json_parser["data"][0]["id"]).to eq(last_segment.id)
      end
    end

    describe "GET /api/v1/segments/:id" do
      context "segment does exist" do
        # make the request
        before { get "/api/v1/segments/#{first_segment.id}", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of contact" do
          expect(json_parser["data"]["id"]).to eq(first_segment.id)
          expect(json_parser["data"]["attributes"]["title"]).to eq(first_segment.title)
        end
      end

      context "segment does not exist" do
        # make the request
        before { get "/api/v1/segments/#{100}", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end   
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
