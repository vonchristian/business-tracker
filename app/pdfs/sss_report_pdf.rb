class SssReportPdf < Prawn::Document
  require "prawn/table"
  TABLE_WIDTHS = [150, 120, 120, 60, 80 ]
  def initialize(businesses=[])
    super(page_size: 'A4', margin: 30, layout: 'landscape')
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
    text "BUSINESS PERMITS LICENSING OFFICE", align: :center
    move_down 10
    text "LIST OF BUSINESSES GRANTED MAYOR'S PERMIT", align: :center, style: :bold
  end

  def display_businesses_table
    if table_data.empty?
      text "No businesses found.", align: :center
    else
      table table_data,

        header: true,

        cell_style: { size: 8},
        column_widths: TABLE_WIDTHS
    end
  end
  def table_data
    move_down 5
     [["Name of Enterprise", "Address", "President/Treasurer/Taxpayer", "Contact Details", "Date of Permit"]] +
    @table_data ||= @businesses.map { |b| [b.business_name, b.full_address, b.taxpayer_name, b.taxpayer_contact_details, b.date_of_application] }
  end

end
