class AddCapitalInvestmentToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :capital_investment, :decimal
    add_column :businesses, :capital_investment_tax, :decimal
  end
end
