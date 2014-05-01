class Row < SimpleDelegator

  def initialize(row)
    super
    @delegate_sd_obj = build_struct row
  end

  def __getobj__
    @delegate_sd_obj
  end

  def __setobj__(obj)
    @delegate_sd_obj = obj
  end

  def company_attributes
    {
      permalink: company_permalink,
      name: company_name,
      category_code: company_category_code,
      country_code: company_country_code,
      state_code: company_state_code,
      region: company_region,
      city: company_city
    }
  end

  def investor_attributes
    {
      permalink: investor_permalink,
      name: investor_name,
      category_code: investor_category_code,
      country_code: investor_country_code,
      state_code: investor_state_code,
      region: investor_region,
      city: investor_city
    }
  end

  def investing_attributes
    {
      round_type: funding_round_type,
      amount: raised_amount_usd
    }
  end

  private

  def build_struct(row)
    OpenStruct.new({
      company_permalink: row[0],
      company_name: row[1],
      company_category_code: row[2],
      company_country_code: row[3],
      company_state_code: row[4],
      company_region: row[5],
      company_city: row[6],
      investor_permalink: row[7],
      investor_name: row[8],
      investor_category_code: row[9],
      investor_country_code: row[10],
      investor_state_code: row[11],
      investor_region: row[12],
      investor_city: row[13],
      funding_round_type: row[14],
      funded_at: row[15],
      funded_month: row[16],
      funded_quarter: row[17],
      funded_year: row[18],
      raised_amount_usd: row[19]
    })
  end
end
