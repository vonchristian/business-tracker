class AddCertificateOfSssCoverageAndComplianceToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :certificate_of_sss_coverage_and_compliance, :boolean
  end
end
