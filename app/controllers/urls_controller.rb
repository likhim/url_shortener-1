class UrlsController < ApplicationController
	def index
		@url = Url.all
	end

	def create
		@url = Url.new(url_params)
		@url.short_url = SecureRandom.base64[0..8]
		if @url.save
			redirect_to urls_path
		else
			@errors = @url.errors.full_messages
			render :new
		end
	end

	# def new
	# end

	private
	def url_params
		params.require(:url).permit(:long_url)
	end
end
