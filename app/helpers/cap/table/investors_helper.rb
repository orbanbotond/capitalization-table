module Cap::Table
  module InvestorsHelper
    def state_transition_links(investor)
      buffer = ""
      buffer = buffer + link_to( 'Negotiate', negotiate_investor_path(investor), method: :put) if investor.may_negotiate?
      buffer = buffer + link_to( 'Invest', invest_investor_path(investor), method: :put) if investor.may_invest?
      buffer = buffer + link_to( 'ReInvest', re_invest_investor_path(investor), method: :put) if investor.may_reinvest?
      buffer.html_safe
    end
  end
end
