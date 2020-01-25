class ExecSql
  attr_accessor :sql, :result, :keys, :message, :status
  def initialize(sql)
    @sql = sql.upcase
  end
  
  def submit
    return unless err_check
    exec_sql
  end

  def err_check
    ng_words = ['DELETE', 'DROP', 'INSERT', 'UPDATE']
    ng_words.each do |ng_word|
      if @sql.include? ng_word
        @message = "delete、drop, insert, updateは使わないでください（>_<）"
        @status = 400
        return false
      end  
    end

    true
  end

  def exec_sql
    con = ActiveRecord::Base.connection
    begin
      result_from_db = con.select_all(@sql)

      @keys = result_from_db.columns
      @result = result_from_db.rows
    rescue => e
      @status = 400
      @message = e
      return false
    end

    true
  end
end