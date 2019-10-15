class Api::SqlController < ApplicationController
  def submit
    con = ActiveRecord::Base.connection
    @result = con.select_all(params["sql"])

    @keys = @result.columns
    @result = @result.rows


    respond_to do |format|
      format.json {
        render json: {
          result: @result,
          keys: @keys
        }
      }
    end
  end
end