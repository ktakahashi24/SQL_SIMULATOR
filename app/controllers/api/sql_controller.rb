class Api::SqlController < ApplicationController
  def submit
    exec_sql = ExecSql.new(params["sql"])
    if exec_sql.submit
      respond_to do |format|
        format.json {
          render json: {
            result: exec_sql.result,
            keys: exec_sql.keys
          },
          status: exec_sql.status
        }
      end
    else
      respond_to do |format|
        format.json {
          render status: exec_sql.status, json: { status: exec_sql.status, message: exec_sql.message}
        }
      end
    end
  end
end