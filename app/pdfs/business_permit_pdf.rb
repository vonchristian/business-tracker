class BusinessPermitPdf < Prawn::Document
  def initialize(business)
   super(top_margin: 30)
   @business = business
   heading_picture
   heading
   heading_content
   business_name
   permit_number
   owner
   type_of_organization
  address
  line_of_business
  content
  transaction_details
  signatory
  end
  def heading_picture
    y_position = cursor
    image "#{Rails.root}/app/assets/images/logo.png", width: 80, height: 80, :at => [20, y_position]
    text "Republic of the Philippines", align: :center
    text "Cordillera Administrative Region", align: :center
    text "Municipality of Tinoc", align: :center
    move_down 5
    text "OFFICE OF THE MUNICIPAL MAYOR", align: :center
  end
  def heading
    move_down 20
    text "MAYOR'S PERMIT",  align: :center, size: 30, style: :bold
    stroke_horizontal_rule
  end

  def heading_content
    move_down 15
    text "Pursuant to the provisions of the Tinoc Revised Municipal Revenue Code of 2014-03 of the Municipality of Tinoc,
            PERMIT is hereby granted to:", align: :center, size: 10

  end

  def business_name
    move_down 15
   text "#{@business.business_name.upcase}", size: 25, style: :bold, align: :center
   text "Business Trade Name", align: :center
  end

  def permit_number
    move_down 20
    text "<u>#{Time.current.year} -  #{@business.permit_number}</u>", align: :center, style: :bold, inline_format: true
    text "Permit Number", align: :center
  end

  def owner
    move_down 20
    text  "#{@business.owner_name.upcase}", align: :center, style: :bold
    text "Proprietor/Manager/President", align: :center
  end

  def type_of_organization
    move_down 15
    text "#{@business.type_of_organization_id}", align: :center
    text "Nature of Organization", align: :center
  end

  def address
    move_down 15
    text "#{@business.full_address}", align: :center, style: :bold
    text "Location of Business", align: :center
  end

  def line_of_business
  end

  def content
    move_down 5
    text "Permit is hereby granted to the above mentioned person/firm/corporation to engange in the above stated business subject
    to the provisions of the Tinoc Ifugao Revenue Code and other ordinances or regulations governing the business trade or activity", align: :center, size: 10
    move_down 10
     text "Any violation  hereof shall cause the immediate revocation of this permit and the forfeitures of all fees and other taxes paid in favor of the Municipal Government of Tinoc.", align: :center, size: 10
    move_down 10
    text "Valid until #{Time.current.end_of_year.strftime('%B %d, %Y')} and shall be renewed on or before #{(Time.current.end_of_year + 20.days).strftime('%B %d, %Y')}.", align: :center, size: 10
    move_down 10
    text "Given this <u>#{Time.current.strftime('%B %d, %Y')}</u> at Tinoc, Ifugao.", align: :center, size: 10, inline_format: true
  end
  def transaction_details
 text_box "OR Number:    #{@business.official_receipt_number}
                  Amount Paid:  P #{@business.amount_paid}.00
                  Cedula No:     #{@business.cedula_number}
                  Issued On:      #{@business.date_issued}
                  Issued At:       #{@business.place_issued}", :at => [10, 50], :height => 100, :width => 100, size: 7, style: :italic
  end

  def signatory
    move_down 100
    text "MARCELO G. CATALINO, Ph.D.", align: :center, style: :bold
    text "Municipal Mayor", align: :center
    move_down 40

  end
end
