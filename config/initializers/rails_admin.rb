# RailsAdmin config file. Generated on February 20, 2013 13:33
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Kimaya', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated
  config.yell_for_non_accessible_fields = false

  # If you want to track changes on your models:
  # config.audit_with :history, 'Admin'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Admin'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Admin', 'Admission', 'AnthropometricMeasurement', 'BiochemistryAssessment', 'BloodAnalysis', 'BloodSugarMonitor', 'Diagnosis', 'Electrolyte', 'EnteralDiagnosis', 'Gender', 'Hospital', 'Investigation', 'MotherHistory', 'Patient', 'PatientHistory', 'Report', 'Tpn', 'TpnAdditive', 'TpnMarketAdditive', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Admin', 'Admission', 'AnthropometricMeasurement', 'BiochemistryAssessment', 'BloodAnalysis', 'BloodSugarMonitor', 'Diagnosis', 'Electrolyte', 'EnteralDiagnosis', 'Gender', 'Hospital', 'Investigation', 'MotherHistory', 'Patient', 'PatientHistory', 'Report', 'Tpn', 'TpnAdditive', 'TpnMarketAdditive', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Admin  ###

  # config.model 'Admin' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your admin.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Admission  ###

  # config.model 'Admission' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your admission.rb model definition

  #   # Found associations:

  #     configure :patient, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :hospital, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :patient_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :admitted_on, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  AnthropometricMeasurement  ###

  # config.model 'AnthropometricMeasurement' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your anthropometric_measurement.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :weight, :float 
  #     configure :head_circ, :float 
  #     configure :length, :float 
  #     configure :weight_measured_date, :date 
  #     configure :head_circ_measured_date, :date 
  #     configure :length_measured_date, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BiochemistryAssessment  ###

  # config.model 'BiochemistryAssessment' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your biochemistry_assessment.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :serum_urea, :string 
  #     configure :serum_creatinine, :string 
  #     configure :triglycerides, :string 
  #     configure :urine_area, :string 
  #     configure :bilirubin, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BloodAnalysis  ###

  # config.model 'BloodAnalysis' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your blood_analysis.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :ph, :string 
  #     configure :pco2, :string 
  #     configure :pao2, :string 
  #     configure :hco3, :string 
  #     configure :abe, :string 
  #     configure :so2, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BloodSugarMonitor  ###

  # config.model 'BloodSugarMonitor' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your blood_sugar_monitor.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :blood_sugar_monitored_on, :time 
  #     configure :details, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Diagnosis  ###

  # config.model 'Diagnosis' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your diagnosis.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :hypoglycemia, :boolean 
  #     configure :hypoglycemia_episode, :string 
  #     configure :hyperglycemia, :boolean 
  #     configure :hyperglycemia_episode, :string 
  #     configure :sepsis, :string 
  #     configure :exhange, :boolean 
  #     configure :thrombocytopenia, :boolean 
  #     configure :dol, :string 
  #     configure :haemorrhage, :boolean 
  #     configure :grade, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Electrolyte  ###

  # config.model 'Electrolyte' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your electrolyte.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :sodium, :string 
  #     configure :potassium, :string 
  #     configure :calcium, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  EnteralDiagnosis  ###

  # config.model 'EnteralDiagnosis' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your enteral_diagnosis.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :ebm, :boolean 
  #     configure :formula_feeds, :boolean 
  #     configure :enteral_nutrition, :string 
  #     configure :total_enteral_calories, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Gender  ###

  # config.model 'Gender' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your gender.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Hospital  ###

  # config.model 'Hospital' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your hospital.rb model definition

  #   # Found associations:

  #     configure :users, :has_many_association 
  #     configure :patients, :has_many_association 
  #     configure :investigations, :has_many_association 
  #     configure :tpns, :has_many_association 
  #     configure :admissions, :has_many_association 
  #     configure :mother_history, :has_many_association 
  #     configure :reports, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :doctors_count, :integer 
  #     configure :nutritionists_count, :integer 
  #     configure :patients_count, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Investigation  ###

  # config.model 'Investigation' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your investigation.rb model definition

  #   # Found associations:

  #     configure :patient, :belongs_to_association 
  #     configure :hospital, :belongs_to_association 
  #     configure :blood_analysis, :has_one_association 
  #     configure :diagnosis, :has_one_association 
  #     configure :biochemistry_assessment, :has_one_association 
  #     configure :electrolyte, :has_one_association 
  #     configure :tpn_additive, :has_one_association 
  #     configure :enteral_diagnosis, :has_one_association 
  #     configure :anthropometric_measurement, :has_one_association 
  #     configure :blood_sugar_monitors, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :patient_id, :integer         # Hidden 
  #     configure :investigated_on, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  MotherHistory  ###

  # config.model 'MotherHistory' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your mother_history.rb model definition

  #   # Found associations:

  #     configure :patient, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :patient_id, :integer         # Hidden 
  #     configure :is_anc, :boolean 
  #     configure :g, :float 
  #     configure :p, :float 
  #     configure :a, :float 
  #     configure :maternal_usg, :string 
  #     configure :age, :string 
  #     configure :pre_pregnancy_weight, :string 
  #     configure :height, :string 
  #     configure :toxemia, :string 
  #     configure :diabetes, :string 
  #     configure :is_antenatal_steroids, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :medical_history, :string 
  #     configure :other_medical_problems, :text 
  #     configure :hospital_id, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Patient  ###

  # config.model 'Patient' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your patient.rb model definition

  #   # Found associations:

  #     configure :hospital, :belongs_to_association 
  #     configure :mother_history, :has_one_association 
  #     configure :patient_history, :has_one_association 
  #     configure :investigations, :has_many_association 
  #     configure :daily_tpn_additives, :has_many_association 
  #     configure :tpns, :has_many_association 
  #     configure :admission, :has_one_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :gender_id, :string 
  #     configure :name, :string 
  #     configure :registration_number, :string 
  #     configure :date_of_birth, :date 
  #     configure :birth_weight, :float 
  #     configure :address, :string 
  #     configure :city, :string 
  #     configure :pincode, :string 
  #     configure :state, :string 
  #     configure :residence_telephone, :string 
  #     configure :emergency_telephone, :string 
  #     configure :mobile_number, :string 
  #     configure :additional_detail, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  PatientHistory  ###

  # config.model 'PatientHistory' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your patient_history.rb model definition

  #   # Found associations:

  #     configure :patient, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :patient_id, :integer         # Hidden 
  #     configure :gestational_age, :string 
  #     configure :gender_details, :string 
  #     configure :ga, :string 
  #     configure :mode_of_delivery, :string 
  #     configure :rupture_of_membranes, :string 
  #     configure :apgar_score_1, :string 
  #     configure :apgar_score_5, :string 
  #     configure :apgar_score_20, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Report  ###

  # config.model 'Report' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your report.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :start_date, :date 
  #     configure :end_date, :date 
  #     configure :patient, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Tpn  ###

  # config.model 'Tpn' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your tpn.rb model definition

  #   # Found associations:

  #     configure :patient, :belongs_to_association 
  #     configure :amino_acid_additive, :belongs_to_association 
  #     configure :sodium_chloride_additive, :belongs_to_association 
  #     configure :potassium_chloride_additive, :belongs_to_association 
  #     configure :calcium_additive, :belongs_to_association 
  #     configure :magnesium_additive, :belongs_to_association 
  #     configure :hospital, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :patient_id, :integer         # Hidden 
  #     configure :current_weight, :float 
  #     configure :day_of_tpn, :integer 
  #     configure :dextrose_conc, :float 
  #     configure :administration, :string 
  #     configure :total_fluid_intake, :float 
  #     configure :feed_volume, :float 
  #     configure :fat_volume, :float 
  #     configure :fat_concentration, :float 
  #     configure :factor, :float 
  #     configure :losses, :float 
  #     configure :amino_acid, :float 
  #     configure :sodium_chloride, :float 
  #     configure :potassium_chloride, :float 
  #     configure :calcium, :float 
  #     configure :magnesium, :float 
  #     configure :mvi, :float 
  #     configure :amino_acid_additive_id, :integer         # Hidden 
  #     configure :sodium_chloride_additive_id, :integer         # Hidden 
  #     configure :potassium_chloride_additive_id, :integer         # Hidden 
  #     configure :calcium_additive_id, :integer         # Hidden 
  #     configure :magnesium_additive_id, :integer         # Hidden 
  #     configure :heparin, :float 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :tpn_date, :date 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  TpnAdditive  ###

  # config.model 'TpnAdditive' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your tpn_additive.rb model definition

  #   # Found associations:

  #     configure :investigation, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investigation_id, :integer         # Hidden 
  #     configure :day_of_life, :integer 
  #     configure :day_of_tpn, :integer 
  #     configure :fluid_intake, :float 
  #     configure :enteral_feeds, :float 
  #     configure :tpn_volume, :float 
  #     configure :amino_acids, :float 
  #     configure :lipids, :float 
  #     configure :tpn_calories, :float 
  #     configure :dir, :float 
  #     configure :ner, :float 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :hospital_id, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  TpnMarketAdditive  ###

  # config.model 'TpnMarketAdditive' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your tpn_market_additive.rb model definition

  #   # Found associations:

  #     configure :tpn, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :market_name, :string 
  #     configure :constant, :float 
  #     configure :unit, :string 
  #     configure :max_value, :float 
  #     configure :min_value, :float 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:

  #     configure :hospital, :belongs_to_association 
  #     configure :user_patients, :has_many_association 
  #     configure :admissions, :has_many_association 
  #     configure :tpns, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :city, :string 
  #     configure :pincode, :string 
  #     configure :residence_telephone, :string 
  #     configure :emergency_telephone, :string 
  #     configure :mobile_number, :string 
  #     configure :additional_detail, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :roles_mask, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :hospital_id, :integer         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
