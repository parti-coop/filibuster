module ApplicationHelper
  def x_email(email)
    return if email.blank?
    "****#{email[4..-1]}"
  end
end
