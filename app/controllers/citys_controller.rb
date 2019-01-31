class CitysController < ApplicationController

  
  def self.index
    @city = City.all
  end

end
