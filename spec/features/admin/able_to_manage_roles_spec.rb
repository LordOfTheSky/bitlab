require 'rails_helper'

feature 'Admin is able to manage roles' do

  scenario 'Create Role', :js do
    role_name = "gateway"
    access_page('catálogos/Roles')
    find('#create_object').click
    fill_in 'role_name', with: role_name
    all('label.collection_check_boxes').each { |check| check.click }
    submit
    expect(page).to have_text(role_name)
    click_item_of('table', '.btn.btn-success', 'last')
    expect(count_check_abilities).to eq(count_abilities)
  end

  scenario 'Edit Role', :js do
    role_name = "testing"
    access_page('catálogos/Roles')
    click_item_of('table', '.btn.btn-success', 'last')
    fill_in 'role_name', with: role_name
    all('label.collection_check_boxes').each_with_index do |check, i| 
      check.click if (i % 2) == 0
    end
    submit
    expect(page).to have_text(role_name)
    click_item_of('table', '.btn.btn-success', 'last')
    expect(count_check_abilities).to eq(count_abilities / 2)
  end

  scenario 'Destoy Role', :js do
    access_page('catálogos/Roles')
    click_item_of('table', '.btn.btn-danger', 'last')
    page.driver.browser.switch_to.alert.accept
    expect(page).to_not have_text('testing')
  end  

end
