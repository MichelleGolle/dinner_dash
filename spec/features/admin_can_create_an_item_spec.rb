require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    let(:admin){
      User.create(first_name: "Admin",
                  last_name: "astrator",
                  username: "admin",
                  email: "admin@admin.com",
                  password: "password",
                  password_confirmation: "password",
                  role: 1)
    }
  it 'can create a new item' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_item_path
      fill_in "Title", with: "Butterfree"
      fill_in "Description", with: "Bug pokemon"
      fill_in "Price", with: 500
      click_link_or_button "Create Item"
      expect(page).to have_content("Butterfree")
    end
  end
end
