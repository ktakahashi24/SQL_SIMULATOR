class HomeController < ApplicationController
  def index
    tables = ActiveRecord::Base.connection.tables
    @table_info = Array.new []

    ignore_table = ["schema_migrations", "ar_internal_metadata"]

    tables.each do |table|
      next if ignore_table.include?(table)
      info = Hash.new {}
      info.store("table", table)
      info.store("columns", ActiveRecord::Base.connection.columns(table))
      @table_info.push(info)
    end
    @table_info
  end

  def submit_sql
    con = ActiveRecord::Base.connection
    @result = con.select_all(params[:sql]).to_a
    render json: @result
  end
end