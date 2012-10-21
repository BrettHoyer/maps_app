require 'json'
require 'open-uri'
class PeopleController < ApplicationController

  def all
    infoall=Information.last
    @name=infoall.name
    @address=infoall.address.gsub! /\s+/, '+'
    @city=infoall.city.gsub! /\s+/, '+'
    @state=infoall.state.gsub! /\s+/, '+'

    map=open("http://maps.googleapis.com/maps/api/geocode/json?address=#{@address}+#{@city}+#{@state}&sensor=false").read
    output=JSON.parse(map)
    @lat=output["results"][0]["geometry"]["location"]["lat"]
    @lng=output["results"][0]["geometry"]["location"]["lng"]
  end
  
  def add_info
  end
  
  def create
    i=Information.new
    i.name=params["name"]
    i.address=params["address"]
    i.city=params["city"]
    i.state=params["state"]
    i.save
    
    redirect_to '/information'
  end
end