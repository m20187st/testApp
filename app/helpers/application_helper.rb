module ApplicationHelper
	include Pagy::Frontend

	def ft_time_ago_in_words(datetime)
		time_ago_in_words(datetime) + '前'
	end
end
