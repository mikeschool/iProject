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
			'http://www.ad.nl/rss.xml',
			"http://www.volkskrant.nl/nieuws/rss.xml"

		]

		links.each do |url|
			items = RSS::Parser.parse(open(url)).items[0..2]
			
			items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
	end
	
	def trouw 
		@news = []
		link = ["http://www.trouw.nl/rss.xml"]
		link.each do |url|
			rss = RSS::Parser.parse(open(url))
			channel_title = rss.channel.title
			channel_link = rss.channel.link
			rss.items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
		
	end
	def volkskrant 
		@news = []
		link = ["http://www.volkskrant.nl/nieuws/rss.xml"]
		link.each do |url|
			rss = RSS::Parser.parse(open(url))
			channel_title = rss.channel.title
			channel_link = rss.channel.link
			rss.items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
	end
	def ad 
		@news = []
		link = ["http://www.ad.nl/rss.xml"]
		link.each do |url|
			rss = RSS::Parser.parse(open(url))
			channel_title = rss.channel.title
			channel_link = rss.channel.link
			rss.items.each do |item|
				@news.push({'link' => item.link, 'title' => item.title, 'description' =>item.description})
			end
		end
		render json: @news
	end

end
 	