require 'rails_helper'

RSpec.describe "Api::V1::Campaigns", type: :request do
  describe "Fetch actions" do
    # initialize test data
    let!(:campaigns) { create_list(:campaign, 5) }
    let(:first_campaign) { campaigns.first }
    let(:last_campaign) { campaigns.last }

    describe "GET /api/v1/campaigns" do
      context "Pagination params are not provided" do
        # make the request
        before { get "/api/v1/campaigns", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a list of JSON campaigns" do
          expect(json_parser["data"].size).to eq(5)
        end

        it "response is return in from latest to oldest" do
          expect(json_parser["data"][0]["id"]).to eq(last_campaign.id)
        end

        it "response contains pagination meta information" do
          expect(json_parser["meta"]["page"]).to eq(1)
          expect(json_parser["meta"]["per_page"]).to eq(10)
          expect(json_parser["meta"]["total_pages"]).to eq(1)
        end
      end

      context "Pagination params are provided" do
        before { get "/api/v1/campaigns", params: { page: 1, per_page: 2} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a list of JSON campaigns" do
          expect(json_parser["data"].size).to eq(2) # per_page is 2
        end

        it "response contains pagination meta information" do
          expect(json_parser["meta"]["page"]).to eq(1)
          expect(json_parser["meta"]["per_page"]).to eq(2)
          expect(json_parser["meta"]["total_pages"]).to eq(3)
        end
      end

      context "Pagination query param is invalid" do
        before { get "/api/v1/campaigns", params: { page: 1, per_page: "xyz" } }

        it "it should return status code of 400 BAD REQUEST" do
          expect(response).to have_http_status(400)
        end

        it "response contains a list of JSON error messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Query Params is invalid")
        end
      end
    end

    describe "GET /api/v1/campaigns/:id" do
      context "campaign does exist" do
        # make the request
        before { get "/api/v1/campaigns/#{first_campaign.id}", params: {} }

        it "it should return status code of 200 OK" do
          expect(response).to have_http_status(200)
        end

        it "response contains a detail information of campaigns" do
          expect(json_parser["data"]["id"]).to eq(first_campaign.id)
          expect(json_parser["data"]["attributes"]["status"]).to eq(first_campaign.status)
          expect(json_parser["data"]["attributes"]["sent_at"]).to eq(first_campaign.sent_at)
          expect(json_parser["data"]["attributes"]["total_recipients"]).to eq(first_campaign.total_recipients)
        end
      end

      context "campaign does not exist" do
        # make the request
        before { get "/api/v1/campaigns/#{100}", params: {} }

        it "it should return status code of 404 NOT FOUND" do
          expect(response).to have_http_status(404)
        end

        it "response contains a list of JSON errors messages" do
          expect(json_parser["errors"].length()).to eq(1)
          expect(json_parser["errors"][0]["title"]).to eq("Record Not Found")
        end   
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
