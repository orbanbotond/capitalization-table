 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

module Cap::Table
  RSpec.describe "/investors", type: :request do
    # Investor. As you add validations to Investor, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      skip("Add a hash of attributes valid for your model")
    }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    describe "GET /index" do
      it "renders a successful response" do
        Investor.create! valid_attributes
        get investors_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        investor = Investor.create! valid_attributes
        get investor_url(investor)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_investor_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        investor = Investor.create! valid_attributes
        get edit_investor_url(investor)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Investor" do
          expect {
            post investors_url, params: { investor: valid_attributes }
          }.to change(Investor, :count).by(1)
        end

        it "redirects to the created investor" do
          post investors_url, params: { investor: valid_attributes }
          expect(response).to redirect_to(investor_url(Investor.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Investor" do
          expect {
            post investors_url, params: { investor: invalid_attributes }
          }.to change(Investor, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post investors_url, params: { investor: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested investor" do
          investor = Investor.create! valid_attributes
          patch investor_url(investor), params: { investor: new_attributes }
          investor.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the investor" do
          investor = Investor.create! valid_attributes
          patch investor_url(investor), params: { investor: new_attributes }
          investor.reload
          expect(response).to redirect_to(investor_url(investor))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          investor = Investor.create! valid_attributes
          patch investor_url(investor), params: { investor: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested investor" do
        investor = Investor.create! valid_attributes
        expect {
          delete investor_url(investor)
        }.to change(Investor, :count).by(-1)
      end

      it "redirects to the investors list" do
        investor = Investor.create! valid_attributes
        delete investor_url(investor)
        expect(response).to redirect_to(investors_url)
      end
    end
  end
end