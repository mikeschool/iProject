class RssController < ApplicationController
	
	require 'rss'
	require 'open-uri'
	
	def index
		
	end

	def xml

	end
	def show
		
		@news =[]
		links = 
		[
			'http://www.trouw.nl/rss.xml',
			'http://www.ad.nl/rss.xml'
		]

		links.each do |url|
			
			file = open(url, "r")
			@data = file.read
			
			@data.gsub! 'media:', ''	
			
			render xml: @data

		end
		
	end
	
	def trouw 
		@news = []
		link = ["http://www.trouw.nl/rss.xml"]
		link.each do |url|
			news = RSS::Parser.parse(open(url))
			channel_title = news.channel.title
			channel_link = news.channel.link
			news.items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
		
	end
	def volkskrant 
		@news = []
		link = ["http://www.volkskrant.nl/nieuws/rss.xml"]
		link.each do |url|
			news = RSS::Parser.parse(open(url))
			channel_title = news.channel.title
			channel_link = news.channel.link
			news.items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
	end
	def ad 
		@news = []
		link = ["http://www.ad.nl/rss.xml"]
		link.each do |url|
			news = RSS::Parser.parse(open(url))
			channel_title = news.channel.title
			channel_link = news.channel.link
			news.items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
	end

=begin
	def update 
		@update = []

		links = 
		[
			'http://www.trouw.nl/rss.xml',
			'http://www.volkskrant.nl/nieuws/rss.xml',
			'http://www.ad.nl/rss.xml'
		]

		links.each do |url|
			items = RSS::Parser.parse(open(url)).items[0..0]
			items.each do |item|
				@update.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		if @@news.include? @update
			@@news  = @@news
		else
			@@news.insert(0, @update)
		end
		render json: @update
	end
=end

end
 	