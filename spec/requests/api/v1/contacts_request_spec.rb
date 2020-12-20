require 'rails_helper'

RSpec.describe "Api::V1::Contacts", type: :request do
  describe "Fetch actions" do
    describe "GET /api/v1/contacts" do
      it "it should return status code of 200 OK"
      it "response contains a list of JSON contacts"
    end

    describe "GET /api/v1/contacts/:id" do
      context "contact does exist" do
        it "it should return status code of 200 OK"
        it "response contains a detail information of contact"
      end

      context "contact does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "GET /api/v1/contacts/search" do
    end

    describe "GET /api/v1/contacts/:id/activities" do
      context "contact does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON contact activities"
      end

      context "contact does not exist" do
        it "it should return status code of 404 NOT FOUND"
        it "response contains a list of JSON errors messages"
      end
    end

    describe "GET /api/v1/contacts/:id/groups" do
      context "contact does exist" do
        it "it should return status code of 200 OK"
        it "response contains a list of JSON contact groups"
      end

      context "contact does not exist" do
        it "it should return status code of 404 NOT FOUND"
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
