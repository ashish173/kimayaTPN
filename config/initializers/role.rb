if Role.table_exists? && !Role.all.empty?
  ADMIN = Role.find_by_name('Admin').id
  DOCTOR = Role.find_by_name('Doctor').id
  NUTRITIONIST = Role.find_by_name('Nutritionist').id
  PATIENT = Role.find_by_name('Patient').id
else
  ADMIN = 1
  DOCTOR = 2
  NUTRITIONIST = 3
  PATIENT = 4
end

INVITE = "Invite"
