class SearchController < ApplicationController
  def index
    page_number = 1
    results = []
    page = []

    while page_number == 1 || page.size == 25 do
      page = get_page(page_number)
      results = results.concat(page)
      page_number += 1
    end

    @total_search_results = results.size
    @members = results.first(25)
  end

  private

  def get_page page_number
    response = conn.get("/api/v1/characters?affiliation=#{search_params[:nation]}&perPage=25&page=#{page_number}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('http://last-airbender-api.herokuapp.com')
  end

  def search_params
    params[:nation] = params[:nation].split('_').map{ |element| element.capitalize}.join('+')
    params.permit(:nation)
  end
end
