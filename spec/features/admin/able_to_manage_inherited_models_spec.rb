require 'rails_helper'

feature 'Admin is able to manage inherited models:' do

  scenario 'Manage models logged in', :js do
    user_sign_in('admin', '123')
    inheritance_guided_tour(
      [User, Company, Scholarship, Branch, Position])
  end
end
