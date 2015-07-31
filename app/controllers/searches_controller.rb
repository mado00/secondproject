class SearchesController < ApplicationController
  	before_action :set_user, only: [:index, :create]
  	# before_action :confirm_logged_in


  def index
	  	@search = Search.new
	  	@searches = Search.all
	  	@bookmarks = Bookmark.limit(10)
	  end

	  def create
	  	require 'open-uri'
	  	
	  	@result = []
	  	if @user && @user.persisted?
	  		@search = @user.searches.create search_params 
	  	end
	  	keyword = URI.encode(params[:search][:url])
	  	url = "https://www.google.com/search?q=#{keyword}"
	  	htmlRequest = Typhoeus::Request.new(
	  		url,
	  		:headers => {"User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36"}
	  		 )

	  	htmlResponse = htmlRequest.run.response_body
	  	contents = Nokogiri::HTML(htmlResponse)

	  	agent = Mechanize.new
	  	contents.css(".srg .g").each do |result|
	  		name = result.css(".r").text
	  		description = result.css(".st").text
	  		url = result.css(".r a").attr("href")
	  		# page_for_image = Typhoeus.get(url)
	  		# find_image = Nokogiri::HTML(open(url))
	  		# @search.results.create(name: name, description: description, url: url)
	  		@result << {name: name, description: description, url: url}

	  	end
	  	@search = Search.new
	  	@bookmarks = Bookmark.limit(24)
	  	@bookmark = Bookmark.new



	  	render :index

	

	  end

	 private
	  
	  def set_user
	  	if current_user.nil?
	  		@user = User.new
	  	else
	  		@user = current_user
	 		end
	 	end

	  def search_params
      params.require(:search).permit(
        :url,
        :user_id
        )
    end
end