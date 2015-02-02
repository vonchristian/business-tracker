class PermitReportPdf < Prawn::Document
  TABLE_WIDTHS = [180, 150, 150, 30]
  TABLE_HEADERS = ["Permit Number", "Business Name", "Owner", "Status"]

  def initialize(businesses=[])
    super(page_size: 'A4')
    @businesses = businesses
    heading_picture
    display_businesses_table
  end

  private

  def display_businesses_table
    if table_data.empty?
      text "No Expired Permits Found"
    else
      table table_data,

        column_widths: TABLE_WIDTHS
        # font_size: TABLE_FONT_SIZE
    end
  end
def heading_picture
       image "#{Rails.root}/app/assets/images/logo.png", width: 80, height: 80, :at => [10, 780]

    text "Republic of the Philippines", size: 10, align: :center
    text "Cordillera Administrative Region", size: 10,  align: :center
    text "Municipality of Tinoc", size: 10, align: :center
    text " website: www.tinoc.gov.ph | email: lgu_tinoc@gmail.com", size: 6, align: :center, style: :italic
    move_down 5
    text "OFFICE OF THE MUNICIPAL MAYOR", align: :center
  end
  def table_data
    move_down 20
     # :headers => ["Permit Number", "Business Name", "Owner", "Status"]
    @table_data ||= @businesses.map { |e| [e.business_name, e.taxpayer_name, e.full_address, e.no_of_employees] }
  end

end
