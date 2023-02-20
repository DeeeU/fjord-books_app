# frozen_string_literal: true

module ReportsHelper
  def name_or_email(item)
    if item.user.name.empty?
      item.user.email
    else
      item.user.name
    end
  end
end
