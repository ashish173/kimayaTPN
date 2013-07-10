# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kimaya::Application.initialize!

#using smtp server
ActionMailer::Base.delivery_method = :smtp 

ActionMailer::Base.default :content_type => "text/html"


