require 'rails_helper'

describe 'verifying bank account', vcr: true do
  let(:user) { FactoryGirl.create :user_with_unverified_bank_account }

  before do
    sign_in(user)
  end

  context 'with correct deposit amounts' do
    it 'gives the user a confirmation notice' do
      fill_in 'First deposit amount', with: '1'
      fill_in 'Second deposit amount', with: '1'
      click_on 'Confirm account & start payments'
      expect(page).to have_content 'account has been confirmed'
    end
  end

  context 'with incorrect deposit ammounts' do
    it 'gives an error notice' do
      fill_in 'First deposit amount', with: '2'
      fill_in 'Second deposit amount', with: '1'
      click_on 'Confirm account & start payments'
      expect(page).to have_content 'Authentication amounts do not match.'
    end
  end
end
