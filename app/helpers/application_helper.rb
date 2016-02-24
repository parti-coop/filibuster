module ApplicationHelper
  def x_email(someone)
    return if someone.blank?
    "****#{someone.email[4..-1]}"
  end
end
