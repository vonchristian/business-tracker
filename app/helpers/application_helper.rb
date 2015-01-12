module ApplicationHelper
 def flash_class(level)
  case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-alert"
  end
end

def current_subdomain
 "Local Government of Tinoc"
end

def site_name
    # Change the value below between the quotes.
    "Business Tracker"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "http://www.business-tracker.ph/"
    else
      # Our dev & test URL
      "http://business-tracker.dev:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "ITWORX Web Design and Development"
  end

  def meta_description
    # Change the value below between the quotes.
    "crafting creative and high quality web applications"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "business licensing, business permit, licensing system"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | Business Tracker"
    end
  end

end
