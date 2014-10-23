class SearchesController < ApplicationController

  def show 
    @shouts = Shout.text_shouts(text_shout_ids)
  end

  private

  def text_shout_ids
    TextShout.search(params[:search]).pluck(:id)
  end

end
