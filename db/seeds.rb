def print_errors(errors)
  errors.each do |error|
    # @logger.error error
    puts error
  end
end

def seed_create(model, params)
 model = model.to_s.classify.constantize
 instance = model.create(params)
 if !instance.is_a?(Array)
  print_errors(instance.errors.full_messages)
  # @logger.info "success #{model.name}" if instance.persisted?
 else
  instance.each do |i|
    print_errors(i.errors.full_messages)
    # @logger.info "success #{model.name}" if i.persisted?
  end
 end
end


permissions = [
  { controller: "Role", assignment: [ 0, 1, 2, 3 ] },
  { controller: "User", assignment: [ 0, 1, 2, 3 ] }
]

roles = [
  { name: 'Admin' }
]

users = [
  { username: "nac13k", first_name: "Francisco", last_name: "Lumbreras" },
  { username: "daniel", first_name: "Daniel", last_name: "Avila" },
  { username: "beto", first_name: "Alberto", last_name: "Lumbreras" }
]

# @logger = Logger.new('log/seed-errors.log')

roles.each do |role|
  seed_create(:role, role)
end

permissions.each do |permission|
  seed_create(:permission, permission.merge(role: Role.last))
end

users.each do |user|
  seed_create(:user, user.merge({ password: '123456',
    password_confirmation: '123456', role: Role.last}))
end