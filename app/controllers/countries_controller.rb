class CountriesController < ApplicationController
  def states
    country = Country.find_country_by_name(params[:country])
    if country
      render json: { states: country.states.values.map{|value| value["name"]} }
    else
      render json: { errors: { country: ["is invald"] } }
    end
  end
end
