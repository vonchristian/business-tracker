module Business::EnterpriseScaleSetter
    def micro_industry?
      self.asset_size<=150_000
    end

    def cottage_industry?
      self.asset_size<=1_500_000
    end

    def small_scale_industry?
      self.asset_size<=15_000_000
    end

    def medium_industry?
      self.asset_size<=60_000_000
    end

    def large_industry?
      self.asset_size>60_000_001
    end

    private
    def set_enterprise_scale
      return self.enterprise_scale=:micro if self.micro_industry?
      return self.enterprise_scale=:cottage if self.cottage_industry?
      return self.enterprise_scale=:small_scale if self.small_scale_industry?
      return self.enterprise_scale=:medium if self.medium_industry?
      return self.enterprise_scale=:large if self.large_industry?
    end
  end
