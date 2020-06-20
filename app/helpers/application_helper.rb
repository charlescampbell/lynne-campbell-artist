# frozen_string_literal: true

module ApplicationHelper
  def sold(painting)
    return 'text-decoration: line-through;' if painting.sold
    ''
  end
end
