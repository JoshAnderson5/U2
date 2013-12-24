module DashboardHelper
	def gravatar_for(dashboard, options = { :size => 145 })
		gravatar_image_tag(user.email.downcase, :alt => user.email,
												:class => 'gravatar',
												:gravatar => options)
	end 
end
