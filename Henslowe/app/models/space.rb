class Space < ActiveRecord::Base
  belongs_to :theater
  attr_accessible :address, :name, :seating_capacity, :theater_id, :calendar

   def embed_calendar
  	embed_code_start = "<iframe src=\"https://www.google.com/calendar/embed?showTitle=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src="
    embed_code_finish = "&amp;color=%23B1440E&amp;ctz=America%2FNew_York\" style=\" border-width:0 \" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>"
    s = self.calendar
  	embed = embed_code_start + s + embed_code_finish
  end
end
