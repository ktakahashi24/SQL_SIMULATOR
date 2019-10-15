class Api::SqlController < ApplicationController
  def submit
    con = ActiveRecord::Base.connection
    @result = con.select_all(params["sql"]).to_a
    p @result

    respond_to do |format|
      format.json { render json: @result }
    end
  end
end