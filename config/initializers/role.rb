unless Role.all.empty?
  ADMIN = Role.find_by_name('Admin').id
  DOCTOR = Role.find_by_name('Doctor').id
  NUTRITIONIST = Role.find_by_name('Nutritionist').id
  PATIENT = Role.find_by_name('Patient').id
end

INVITE = "Invite"
