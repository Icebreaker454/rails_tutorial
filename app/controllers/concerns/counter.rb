module Counter
	extend ActiveSupport::Concern

	private

	def set_count
		if session[:counter].nil?
			session[:counter] = 1
		else
			session[:counter] +=1 
		end
	end
end