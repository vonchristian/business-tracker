class BusinessPermitPdf < Prawn::Document
  require "prawn/table"
  def initialize(business)
   super(margin: 30, page_size: 'A4')
   @business = business
   heading_picture
   business_name
   permit_number
   taxpayer
   image_taxpayer
   type_of_organization
   address
   line_of_business
   content
   conditions
   signatory
   dry_seal
   transaction_details
  end
  def heading_picture
    y_position = cursor
       image "#{Rails.root}/app/assets/images/border.png", width: 530, height: 790, :at => [0, y_position]
    image "#{Rails.root}/app/assets/images/heading.jpg", width: 500, height: 90, :at => [15, 767]

    # text "Republic of the Philippines", size: 10, align: :center
    # text "Cordillera Administrative Region", size: 10,  align: :center
    # text "Municipality of Tinoc", size: 10, align: :center
    # text " website: www.tinoc.gov.ph | email: lgu_tinoc@gmail.com", size: 6, align: :center, style: :italic
    # move_down 5
    # text "OFFICE OF THE MUNICIPAL MAYOR", align: :center
  end


  # def heading_content
  #   move_down 15
  #   text "Pursuant to the provisions of the Tinoc Revised Municipal Revenue Code of 2014-03 of the Municipality of Tinoc,
  #           PERMIT is hereby granted to:", align: :center, size: 10

  # end

  def business_name
    move_down 110
    y_position =cursor
    image "#{Rails.root}/app/assets/images/permit_background.png", width: 488, height: 670, :at => [10, y_position]
    move_down 10
   text "MAYOR'S PERMIT",  align: :center, size: 25, style: :bold
   stroke do
    horizontal_line 50, 500 ,at: 638
  end
  text "Pursuant to the provisions of the Revised Municipal Revenue Code 2014 - 03
          of the Municipality of Tinoc, PERMIT is hereby granted to:", align: :center, size: 10
   move_down 8
   text "#{@business.business_name.upcase}", size: 16, style: :bold, align: :center
   text "Business Trade Name", align: :center
  end

  def permit_number
    move_down 10
    text "<u>PERMIT NUMBER: #{Time.current.year}  -  #{@business.permit_number}</u>", size: 12, align: :center, style: :bold, inline_format: true
  end

  def taxpayer
    move_down 10
    text  "#{@business.taxpayer_name.upcase}", align: :center, style: :bold
    text "Taxpayer/Proprietor/Manager/President", align: :center
  end

  def image_taxpayer
    if @business.taxpayer.profile_image.present?

    image "#{@business.taxpayer.profile_image}", :at => [40, 150]
  end
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
    text "Permit is hereby granted to the above mentioned person/firm/corporation to engange in the above
    stated business subject to the provisions of the  Revenue Code of 2014-03 of the Municipality of Tinoc
    and other ordinances or regulations governing the business, trade or activity.", align: :center, size: 10
    move_down 10
     text "Any violation  hereof shall cause the immediate revocation of this permit and the forfeitures of all fees
     and other taxes paid in favor of the Municipal Government of Tinoc.", align: :center, size: 10
    move_down 10
    text "Valid until #{Time.current.end_of_year.strftime('%B %d, %Y')} and shall be renewed on or before the 20th day of January #{Time.now.next_year.year}.", align: :center, size: 10
    move_down 10
    text "Given this <u>#{Time.now.strftime('%B %d, %Y')}</u> at Tinoc, Ifugao.", align: :center, size: 10, inline_format: true
  end
  def conditions
    text_box "CONDITIONS FOR THE VALIDITY OF THIS PERMIT
    1. This permit is not valid if not signed by the Municipal Mayor.
     2. This permit is renewable within the first Twenty Days of January in every year.
     3. This permit must be displayed in a conspicous place within the business establishment.
     4. NO SELLING OF LIQUOR.
     5. This permit is NON-TRANSFERABLE.
     6. Non-compliance to the above stated conditions means cancellation of permit.", :at => [40,240], height: 100, width: 400, size: 10
  end


  def signatory
    text_box "MARCELO G. CATALINO, Ph.D.
                            Municipal Mayor", :at => [250, 100], align: :center, style: :bold

end
  def dry_seal
    text_box "NOT VALID WITHOUT SEAL", :at=>[360, 12], size: 8
  end

  def transaction_details
 text_box "OR Number:    #{@business.official_receipt_number}
                  Amount Paid:  P #{@business.amount_paid}
                  Cedula No:     #{@business.cedula_number}
                  Issued On:      #{@business.date_issued}
                  Issued At:       #{@business.place_issued}", :at => [360, 60], :height => 100, :width => 150, size: 7, style: :italic
  end
end
