class Url < ActiveRecord::Base
	validates :long_url, presence: true, format: URI::regexp
	validates :short_url, presence: true

	def self.retrieve_short_url(proper_long_url)
		if Url.find_by(long_url: proper_long_url) == nil
			return nil
		else
			Url.find_by(long_url: proper_long_url).short_url
		end
	end

	## Method 2 by Faith
	# def self.retrieve_short_url(proper_long_url)
	# 	Url.find_by(long_url: proper_long_url).short_url if Url.find_by(long_url: proper_long_url) != nil
	# end

	# def shorten
	# 	if self.short_url == nil
	# 		self.short_url = "clone" + SecureRandom.base64[0..8]
	# 	end
	# end
end
