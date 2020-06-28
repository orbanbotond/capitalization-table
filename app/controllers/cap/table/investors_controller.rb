require_dependency "cap/table/application_controller"

module Cap::Table
  class InvestorsController < ApplicationController
    before_action :authenticate_user!
    around_action :set_tenant
    before_action :set_investor, only: [:show, :edit, :update, :destroy, :negotiate, :invest, :re_invest]

    # GET /investors
    def index
      @investors = ::Cap::Table::Investor.all
    end

    # GET /investors/1
    def show
    end

    # GET /investors/new
    def new
      @investor = ::Cap::Table::Investor.new
    end

    # GET /investors/1/edit
    def edit
    end

    def negotiate
      @investor.negotiate!

      redirect_to investors_path, notice: 'Investor was put in negotiation state.'
    end

    def invest
      @investor.invest!

      redirect_to investors_path, notice: 'Investor was put in invest state.'
    end

    def re_invest
      @investor.reinvest!

      redirect_to investors_path, notice: 'Investor was put in re_invest state.'
    end

    # POST /investors
    def create
      @investor = ::Cap::Table::Investor.new(investor_params)

      if @investor.save
        redirect_to @investor, notice: 'Investor was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /investors/1
    def update
      if @investor.update(investor_params)
        redirect_to @investor, notice: 'Investor was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /investors/1
    def destroy
      @investor.destroy
      redirect_to investors_url, notice: 'Investor was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_investor
        @investor = ::Cap::Table::Investor.find(params[:id])
      end

      def set_tenant
        Mongoid::Multitenancy.with_tenant(current_user) do
          yield
        end
      end

      # Only allow a trusted parameter "white list" through.
      def investor_params
        params.require(:investor).permit(:name, :amount, :willing_to_reinvest, :negotiation_state)
      end
  end
end
