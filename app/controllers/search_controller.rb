class SearchController < ApplicationController
def result
  @result = PgSearch.multisearch(params[:query]).page(params[:page]).per_page(30)
end
end
