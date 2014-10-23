class SearchesController < ApplicationController
  text_shouts = TextShout.where("body_ILIKE_'%?%'", params[:search][:query])
  
end
