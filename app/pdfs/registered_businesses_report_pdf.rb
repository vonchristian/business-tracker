class RegisteredBusinessesReportPdf < Prawn::Document
  TABLE_WIDTHS = [50, 150, 100, 200 ]
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
    text "LIST OF REGISTERED BUSINESSES", align: :center, style: :bold
    move_down 5
    text " Number of Registered Business: #{@businesses.count}"
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
     [["Permit Number", "Business Name", "Taxpayer", "Address"]] +
    @table_data ||= @businesses.map { |e| [e.permit_number.to_s.rjust(4, "0"), e.business_name, e.taxpayer_name, e.full_address] }
  end

end
