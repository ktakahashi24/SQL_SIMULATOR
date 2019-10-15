class Api::SqlController < ApplicationController
  def submit
    respond_to do |format|
      format.json { render json: { "aaa": "bbbbbb" } }
    end
  end
end