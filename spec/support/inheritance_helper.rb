def visit_index(model)
  visit polymorphic_path(model)
  index_expectation(model)
end

def create_object(model)
  values = Hash.new
  visit polymorphic_path(model)
  page.find('#create_object').click
  model.permitted_params.each do |attr|
    attribute_name = human_attr(model, attr)
    expect(page).to have_text(attribute_name)
    v = dynamic_fill(model, attr, attribute_name)
    values[v[0]] = v[1]
  end
  page.find('#submit_object').click
  index_expectation(model)
  [:password, :password_confirmation].each { |x| values.delete(x) }
  (model.where(values).count).should be > 0
end

def inheritance_guided_tour(models)
  models.each do |model|
    visit_index(model)
    create_object(model)
  end
end

private

def index_expectation(model)
  expect(page).to have_text((model.model_name.human count: 2).capitalize)
  model.listed_params.each do |attr|
    expect(page).to have_text(human_attr(model, attr))
  end
  model.all.each do |object|
    model.listed_params.each do |attr|
      expect(page).to have_text(object.send(attr))
    end
  end
end

def dynamic_fill(model, attr, human_name)
  except = [:password, :password_confirmation]
  type = except.include?(attr) ? :string : model.columns_hash[attr.to_s].type
  if except.include? attr
    value = 'vg5msvy1uerg7'
    fill_in human_name, with: value
  elsif attr.to_s.last(3) != "_id"
    value = type == :string ? Faker::Lorem.word : Faker::Number.number(10)
    fill_in human_name, with: value
  else
    selection = classify_association(attr).all.sample
    value = selection.id
    select selection.name, from: human_name
  end
  return [attr, value]
end

def pluralize_association(attr)
  attr.to_s.delete('_id').classify.pluralize.downcase
end

def classify_association(attr)
  attr.to_s.delete('_id').classify.constantize
end

def attribute_type(model, attr)
  model.columns_hash[attr.to_s].type
end
