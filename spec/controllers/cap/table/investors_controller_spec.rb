require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

module Cap::Table
  RSpec.describe InvestorsController, type: :controller do
    before do
      @routes = Engine.routes
    end

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create email: 'bo@gmail.com', password: 'dummypwd123', password_confirmation: 'dummypwd123'
      sign_in @user
      @user_2 = User.create email: 'bb@gmail.com', password: 'dummypwd123', password_confirmation: 'dummypwd123'
    end

    after(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_out @user
    end

    # This should return the minimal set of attributes required to create a valid
    # Investor. As you add validations to Investor, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      {
        name: "Logic Optimum",
        amount: "10000000",
        willing_to_reinvest: true,
        user_id: @user.id.to_s
      }
    }

    let(:invalid_attributes) {
      {
        name: nil,
        amount: "10000000"
      }
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # InvestorsController. Be sure to keep this updated too.
    let(:valid_session) { {"warden.user.user.key" => session["warden.user.user.key"]} }

    describe "GET #index" do
      it "returns a success response" do
        investor = Investor.create! valid_attributes
        investor_for_other_user = Investor.create! valid_attributes.merge(name: 'another_investor', user: @user_2)
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
        expect(assigns(:investors).all.to_a).to include(investor)
        expect(assigns(:investors).all.to_a).to_not include(investor_for_other_user)
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        investor = Investor.create! valid_attributes
        get :show, params: {id: investor.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        investor = Investor.create! valid_attributes
        get :edit, params: {id: investor.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Investor" do
          expect {
            post :create, params: {investor: valid_attributes}, session: valid_session
          }.to change(Investor, :count).by(1)
          expect(Investor.last.user).to eq(@user)
        end

        it "redirects to the created investor" do
          post :create, params: {investor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Investor.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {investor: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          valid_attributes
        }

        it "updates the requested investor" do
          investor = Investor.create! valid_attributes
          put :update, params: {id: investor.to_param, investor: new_attributes}, session: valid_session
          investor.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the investor" do
          investor = Investor.create! valid_attributes
          put :update, params: {id: investor.to_param, investor: valid_attributes}, session: valid_session
          expect(response).to redirect_to(investor)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          investor = Investor.create! valid_attributes
          put :update, params: {id: investor.to_param, investor: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested investor" do
        investor = Investor.create! valid_attributes
        expect {
          delete :destroy, params: {id: investor.to_param}, session: valid_session
        }.to change(Investor, :count).by(-1)
      end

      it "redirects to the investors list" do
        investor = Investor.create! valid_attributes
        delete :destroy, params: {id: investor.to_param}, session: valid_session
        expect(response).to redirect_to(investors_url)
      end
    end
  end
end
