class Api::SqlController < ApplicationController
  def submit
    ng_words = ['DELETE', 'DROP', 'INSERT', 'UPDATE']
    sql_upper = params["sql"].upcase

    ng_words.each do |ng_word|
      if sql_upper.include? ng_word
        err_message = "delete、drop, insert, updateは使わないでください（>_<）"
        render status: 400, json: { status: 400, message: err_message}
        return
      end  
    end


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