require 'json'

class StimulusController < ApplicationController

  def getstates
    render json: {a: 'b', b: 'c'}.as_json
  end
end
