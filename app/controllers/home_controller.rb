class HomeController < ApplicationController
  def submit_sql
    con = ActiveRecord::Base.connection
    @result = con.select_all(params[:sql]).to_a
    p @result
    render json: @result
  end
end