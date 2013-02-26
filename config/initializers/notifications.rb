if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => "localhost",
    :port => 1025,
    :domain => "kimaya.joshsoftware.com"
  }
elsif Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => EY::Config.get(:sendgrid, 'SENDGRID_SMTP_HOST'),
    :port           => '587',
    :authentication => :plain,
    :user_name      => EY::Config.get(:sendgrid, 'SENDGRID_USERNAME'),
    :password       => EY::Config.get(:sendgrid, 'SENDGRID_PASSWORD'),
    :domain         => 'shopgodt.com'
  }
end
