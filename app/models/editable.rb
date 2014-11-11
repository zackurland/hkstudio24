class Editable < ActiveRecord::Base
  belongs_to :page

  def display
    "#{display_start}#{text}#{display_end}".html_safe
  end
end
