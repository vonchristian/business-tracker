class MayorsFee < ActiveRecord::Base
  has_many :line_of_businesses
enum enterprise_scale: [:micro_industry, :cottage_industry, :small_scale_industry, :medium, :large]

 amount_of_fee_per_annum = case :enterprise_scale
 when :micro_industry then 1_600
 when :cottage_industry then 2_000
 when :small_scale_industry then 2_500
 when :medium then 3_500
 when :large then 4_500
 end
end
