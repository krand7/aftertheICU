class ApplicationMailer < ActionMailer::Base
  default from: "After the ICU <#{ActionMailer::Base.smtp_settings[:email]}>"
  add_template_helper(ApplicationHelper)
  layout 'mailer'

  protected

  def setup_email
  end
end
