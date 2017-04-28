require 'rails_helper'

feature 'Admin is able to manage sessions:' do

  scenario 'Sign in with valid data', :js do
    user_sign_in('admin', '123')
    expect(page).to have_text(User.last.full_name)
  end

  scenario 'Sign in with invalid data', :js do
    user_sign_in("admin", '12345')
    expect(page).to have_text("Usuario y/o contraseña inválida")
  end

  scenario 'Sign out', :js do
    user_sign_in('admin', '123')
    user_sign_out
    expect(page).to have_css("#password")
  end

  scenario 'Visit login path while logged in', :js do
    user_sign_in('admin', '123')
    visit login_path
    expect(page).to have_text(User.last.full_name)
  end
end
