class BusinessPermitPdf < Prawn::Document
  def initialize(business)
   super(top_margin: 30)
   @business = business
   heading_picture
   heading
   # heading_content
   business_name
   permit_number
   taxpayer
   type_of_organization
  address
  line_of_business
  content
  conditions
  transaction_details
  signatory
  dry_seal
  end
  def heading_picture
    y_position = cursor
   # image "#{Rails.root}/app/assets/images/heading.jpg", width: 500, height: 100, :at => [20, y_position]
    image "#{Rails.root}/app/assets/images/logo.png", width: 80, height: 75, :at => [20, y_position]
    text "Republic of the Philippines", align: :center
    text "Cordillera Administrative Region", align: :center
    text "Municipality of Tinoc", align: :center
    text " website: www.tinoc.gov.ph | email: lgu_tinoc@gmail.com", size: 6, align: :center, style: :italic
    move_down 5
    text "OFFICE OF THE MUNICIPAL MAYOR", align: :center
  end
  def heading
    move_down 20
    text "MAYOR'S PERMIT",  align: :center, size: 30, style: :bold
    stroke_horizontal_rule
  end

  # def heading_content
  #   move_down 15
  #   text "Pursuant to the provisions of the Tinoc Revised Municipal Revenue Code of 2014-03 of the Municipality of Tinoc,
  #           PERMIT is hereby granted to:", align: :center, size: 10

  # end

  def business_name
    move_down 20
   text "#{@business.business_name.upcase}", size: 25, style: :bold, align: :center
   text "Business Trade Name", align: :center
  end

  def permit_number
    move_down 10
    text "<u>#{Time.current.year} -  #{@business.permit_number}</u>", align: :center, style: :bold, inline_format: true
    text "Permit Number", align: :center
  end

  def taxpayer
    move_down 10
    text  "#{@business.taxpayer_name.upcase}", align: :center, style: :bold
    text "Proprietor/Manager/President", align: :center
  end

  def type_of_organization
    move_down 10
    text "#{@business.type_of_organization.titleize}", align: :center, style: :bold
    text "Nature of Organization", align: :center
  end

  def address
    move_down 10
    text "#{@business.full_address}", align: :center, style: :bold
    text "Location of Business", align: :center
  end

  def line_of_business
    move_down 10
    text "#{@business.line_of_business}", align: :center, style: :bold
    text "Line of Business/Products/Business Activities", align: :center
  end

  def content
    move_down 10
    text "Permit is hereby granted to the above mentioned person/firm/corporation to engange in the above stated business subject
    to the provisions of the  Revenue Code of 2014-03 of the Municipality of Tinoc and other ordinances or regulations governing the business, trade or activity.", align: :center, size: 10
    move_down 10
     text "Any violation  hereof shall cause the immediate revocation of this permit and the forfeitures of all fees
     and other taxes paid in favor of the Municipal Government of Tinoc.", align: :center, size: 10
    move_down 10
    text "Valid until #{Time.current.end_of_year.strftime('%B %d, %Y')} and shall be renewed on or before the 20th day of January #{Time.now.next_year.year}.", align: :center, size: 10
    move_down 10
    text "Given this <u>#{Time.current.strftime('%B %d, %Y')}</u> at Tinoc, Ifugao.", align: :center, size: 10, inline_format: true
  end
  def conditions
    move_down 15
    text "CONDITIONS FOR THE VALIDITY OF THIS PERMIT"
    text "1. This permit is not valid if not signed by the Municipal Mayor.", size: 10
    text "2. This permit is renewable within the first Twenty Days of January in every year.", size: 10
    text "3. This permit must be displayed in a conspicous place within the business establishment.", size: 10
    text "4. NO SELLING OF LIQUOR", size: 10
    text "5. This permit is NON-TRANSFERABLE", size: 10
    text "6. Non-compliance to the above stated conditions means cancellation of permit to operate", size: 10
  end
  def transaction_details
 text_box "OR Number:    #{@business.official_receipt_number}
                  Amount Paid:  P #{@business.amount_paid}
                  Cedula No:     #{@business.cedula_number}
                  Issued On:      #{@business.date_issued}
                  Issued At:       #{@business.place_issued}", :at => [10, 50], :height => 100, :width => 150, size: 7, style: :italic
  def dry_seal
    text "NOT VALID WITHOUT DRY SEAL"
  end
  end

  def signatory
    move_down 80
    text "MARCELO G. CATALINO, Ph.D.", align: :center, style: :bold
    text "Municipal Mayor", align: :center
    move_down 40

  end
end
