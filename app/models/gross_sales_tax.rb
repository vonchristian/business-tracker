class GrossSalesTax  < ActiveRecord::Base
  belongs_to :business
  before_save :set_amount
  after_save :check_amount_of_contractors_tax_in_excess_of_two_million

  def manufacturers_electric_power_producers_assemblers_repackers_processors_tax
    self.amount=181.50   if business.gross_sales<10_000
    self.amount=242        if business.gross_sales>=10_000...14_999
    self.amount=330        if business.gross_sales>=15_000...19_999
    self.amount=480        if business.gross_sales>=20_000...29_999
    self.amount=720        if business.gross_sales>=30_000...39_999
    self.amount=900        if business.gross_sales>=40_000...49_999
    self.amount=1_450    if business.gross_sales>=50_000...74_999
    self.amount=1_800    if business.gross_sales>=75_000...99_999
    self.amount=2_400    if business.gross_sales>=100_000...149_999
    self.amount=3_000    if business.gross_sales>=150_000...199_999
    self.amount=4_200    if business.gross_sales>=200_000...299_999
    self.amount=6_000    if business.gross_sales>=300_000...499_999
    self.amount=8_800    if business.gross_sales>=500_000...749_999
    self.amount=11_000  if business.gross_sales>=750_000...999_999
    self.amount=15_500  if business.gross_sales>=1_000_000...1_999_999
    self.amount=18_150  if business.gross_sales>=2_000_000...2_999_999
    self.amount=21_700  if business.gross_sales>=3_000_000...3_999_999
    self.amount=25_400  if business.gross_sales>=4_000_000...4_999_999
    self.amount=26_800  if business.gross_sales>=5_000_000...6_499_999
    self.amount=business.gross_sales*0.01*0.4125 if business.gross_sales>6_500_000
  end

  def wholesalers_dealers_distributors_tax
    self.amount=19.50   if business.gross_sales<1_000.00
    self.amount=35        if business.gross_sales>=1_000.00...1_999.99
    self.amount=55        if business.gross_sales>=2_000.00...2_999.99
    self.amount=79        if business.gross_sales>=3_000.00...3_999.99
    self.amount=110      if business.gross_sales>=4_000.00...4_999.99
    self.amount=133      if business.gross_sales>=5_000.00...5_999.99
    self.amount=155      if business.gross_sales>=6_000.00...6_999.99
    self.amount=180      if business.gross_sales>=7_000.00...7_999.99
    self.amount=200      if business.gross_sales>=8_000.00...9_999.99
    self.amount=240      if business.gross_sales>=10_000.00...14_999.99
    self.amount=300      if business.gross_sales>=15_000.00...19_999.99
    self.amount=360      if business.gross_sales>=20_000.00...29_999.99
    self.amount=480      if business.gross_sales>=30_000.00...39_999.99
    self.amount=720      if business.gross_sales>=40_000.00...49_999.99
    self.amount=1_080  if business.gross_sales>=50_000.00...74_999.99
    self.amount=1_550  if business.gross_sales>=75_000.00...99_999.99
    self.amount=2_000  if business.gross_sales>=100_000.00...149_999.99
    self.amount=2_650  if business.gross_sales>=150_000.00...199_999.99
    self.amount=3_600  if business.gross_sales>=200_000.00...299_999.99
     self.amount=4_800 if business.gross_sales>=300_000.00...499_999.99
    self.amount=7_200  if business.gross_sales>=500_000.00...749_999.99
    self.amount=9_500  if business.gross_sales>=750_000.00...999_999.99
    self.amount=11_000 if business.gross_sales>=1_000_000.00...1_999_999.99
    self.amount=business.gross_sales*0.01*0.4125 if business.gross_sales>2_000_000
  end

  def exporters_producers_millers_manufacturers_of_essential_commodities
    self.amount=manufacturers_electric_power_producers_assemblers_repackers_processors/2
  end


  def retailers_of_essential_commodities
    self.amount=(business.gross_sales*0.02)/2 if business.gross_sales<=400_000
    self.amount=excess_rate_for_retailers/2 if business.gross_sales>400_000
    self.amount=0 if business.gross_sales< 30_000
  end

  def retailers_tax
    self.amount=business.gross_sales*0.02 if business.gross_sales<=400_000
    self.amount=excess_rate_for_retailers if business.gross_sales>400_000
    self.amount=0 if business.gross_sales< 30_000
end

def excess_rate_for_retailers
  excess=business.gross_sales-400_000
  self.amount=excess*0.01 + 400_000*0.02
  end

def banks_and_other_financial_institutions_tax
  self.amount=business.gross_sales*0.0150
end

def sales_of_services_tax
    self.amount=30   if business.gross_sales<5_000.00
    self.amount=67        if business.gross_sales>=5_000...9_999
    self.amount=114        if business.gross_sales>=10_000...14_999
    self.amount=180       if business.gross_sales>=15_000...19_999
    self.amount=300      if business.gross_sales>=20_000...29_999
    self.amount=420      if business.gross_sales>=30_000...39_999
    self.amount=600      if business.gross_sales>=40_000...49_999
    self.amount=965      if business.gross_sales>=50_000...74_999
    self.amount=1_450      if business.gross_sales>=75_000...99_999
    self.amount=2_170      if business.gross_sales>=100_000...149_999
    self.amount=2_900       if business.gross_sales>=150_000...199_999
    self.amount=3_990       if business.gross_sales>=200_000...249_999
    self.amount=5_080      if business.gross_sales>=250_000...299_999
    self.amount=6_770      if business.gross_sales>=300_000...399_999
    self.amount=9_075  if business.gross_sales>=400_000...499_999
    self.amount=10_150  if business.gross_sales>=500_000...749_999
    self.amount=11_270  if business.gross_sales>=750_000...999_999
    self.amount=12_600  if business.gross_sales>=1_000_000...1_999_999
    self.amount=business.gross_sales*0.01 *0.50 if business.gross_sales>2_000_000
end

def contractors_tax
    self.amount=30   if business.gross_sales<5_000
    self.amount=67        if business.gross_sales>=5_000.00...9_999.99
    self.amount=114        if business.gross_sales>=10_000.00...14_999.99
    self.amount=180       if business.gross_sales>=15_000.00...19_999.99
    self.amount=300      if business.gross_sales>=20_000.00...29_999.99
    self.amount=420      if business.gross_sales>=30_000.00...39_999.99
    self.amount=600      if business.gross_sales>=40_000.00...49_999.99
    self.amount=965      if business.gross_sales>=50_000.00...74_999.99
    self.amount=1_450      if business.gross_sales>=75_000.00...99_999.99
    self.amount=2_170      if business.gross_sales>=100_000.00...149_999.99
    self.amount=2_900       if business.gross_sales>=150_000.00...199_999.99
    self.amount=3_990       if business.gross_sales>=200_000.00...249_999.99
    self.amount=5_080      if business.gross_sales>=250_000.00...299_999.99
    self.amount=6_770      if business.gross_sales>=300_000.00...399_999.99
    self.amount=9_075  if business.gross_sales>=400_000.00...499_999.99
    self.amount=10_150  if business.gross_sales>=500_000.00...749_999.99
    self.amount=11_270  if business.gross_sales>=750_000.00...999_999.99
    self.amount=12_600  if business.gross_sales>=1_000_000.00...1_999_999.99
    self.amount = self.business.gross_sales * 0.01 * 0.50 if  self.business.gross_sales>=2_000_000
end

    private
    def check_amount_of_contractors_tax_in_excess_of_two_million
      if  self.business.contractors? || self.business.sales_of_services? && self.business.gross_sales>=2_000_000 && self.amount<12_600
      self.amount=12_600
      end
    end

    def set_amount
      return manufacturers_electric_power_producers_assemblers_repackers_processors_tax if self.business.manufacturers_electric_power_producers_assemblers_repackers_processors?
      return wholesalers_dealers_distributors_tax if self.business.wholesalers_dealers_distributors?
      return retailers_tax if self.business.retailers?
      return sales_of_services_tax if self.business.sales_of_services?
      return contractors_tax if self.business.contractors?
      return retailers_of_essential_commodities if self.business.retailers_of_essential_commodities?
   end
end

