require 'rails_helper'

describe 'users creation' do
  let! (:account) { create(:account_with_schema) }
  let(:user) { account.owner }
  before { set_subdomain(account.subdomain) }

  it 'shows the owner in the list of users' do
    sign_user_in(user)
    visit users_path
    expect(page).to have_content user.first_name
    expect(page).to have_content user.first_name
  end
end

