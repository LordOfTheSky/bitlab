def user_sign_in(user, password)
  visit root_path
  expect(page).to have_css('#username')
  fill_in 'username', with: user
  fill_in 'password', with: password
  click_on 'Iniciar sesión'
end

def user_sign_out(full_name='System Administrator')
  click_on full_name
  click_link 'Cerrar sesión'
end

def access_page(page_name, user='admin', password='123')
  user_sign_in(user, password)
  page_name.split('/').each do |link|
    click_link(link)
  end
end

def submit
  find("input[type='submit']").click
end

def count_abilities
  Role.models.size * Permission.abilities.size
end

def count_check_abilities
  all('input.check_boxes:checked', visible: false).size
end

def click_item_of(main_object, selector, position)
  within main_object do 
    all(selector).send(position).click
  end
end
