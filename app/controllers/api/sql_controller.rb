class Api::SqlController < ApplicationController
  def submit
    con = ActiveRecord::Base.connection
    begin
      @result = con.select_all(params["sql"])

      @keys = @result.columns
      @result = @result.rows
      respond_to do |format|
        format.json {
          render json: {
            result: @result,
            keys: @keys
          },
          status: 200
        }
      end
    rescue => e
      p "error: #{e}"
      respond_to do |format|
        format.json {
          render status: 400, json: { status: 400, message: e}
        }
      end
    end
  end
end