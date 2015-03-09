class BirReportPdf < Prawn::Document
  require "prawn/table"
  TABLE_WIDTHS = [180, 100, 150, 100 ]
  def initialize(businesses=[])
    super(page_size: 'A4', margin: 30)
    @businesses = businesses
    heading_picture
    display_businesses_table
  end

  private
  def heading_picture
    image "#{Rails.root}/app/assets/images/logo.png", width: 80, height: 80, :at => [10, 790]
    text "Republic of the Philippines", size: 10, align: :center
    text "Cordillera Administrative Region", size: 10,  align: :center
    text "Municipality of Tinoc", size: 10, align: :center
    # text " website: www.tinoc.gov.ph | email: lgu_tinoc@gmail.com", size: 6, align: :center, style: :italic
    move_down 5
    text "BUSINESS PERMIT LICENSING OFFICE", align: :center
    move_down 10
    text "BUSINESSES WITHOUT BIR REGISTRATION", align: :center, style: :bold
  end

  def display_businesses_table
    if table_data.empty?
      text "No delinquent businesses found.", align: :center
    else
      table table_data,

        header: true,

        cell_style: { size: 8},
        column_widths: TABLE_WIDTHS
    end
  end
  def table_data
    move_down 5
     [["Business Name", "Taxpayer", "Address", "Mobile Number"]] +
    @table_data ||= @businesses.map { |e| [e.business_name, e.taxpayer_name, e.full_address, e.taxpayer_mobile_number] }
  end

end
