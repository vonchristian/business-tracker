class AddOfficialReceiptNumberToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :official_receipt_number, :string
  end
end
