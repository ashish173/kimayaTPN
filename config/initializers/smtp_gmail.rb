ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => '587',
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => "shailesh@joshsoftware.com",
  :password => "josh123",
  :domain => "joshsoftware.com"
}

module ActionMailer
  class Base
    def perform_delivery_smtp(mail)
      destinations = mail.destinations
      mail.ready_to_send
      sender = (mail['return-path'] && mail['return-path'].spec) || Array(mail.from).first
      smtp = Net::SMTP.new(smtp_settings[:address], smtp_settings[:port])
      smtp.enable_starttls_auto if smtp_settings[:enable_starttls_auto] && smtp.respond_to?(:enable_starttls_auto)
      smtp.start(smtp_settings[:domain], smtp_settings[:user_name], smtp_settings[:password],
                 smtp_settings[:authentication]) do |smtp|
        smtp.sendmail(mail.encoded, sender, destinations)
                 end
    end
  end
end
