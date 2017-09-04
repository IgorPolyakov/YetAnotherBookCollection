class NewsController < ApplicationController
  def last
    # Book.find_by()
    sql = 'SELECT * FROM "books"'
    sql = "SELECT * FROM \"#{params[:search]}\"" if params[:search].present?
    @records_array = ActiveRecord::Base.connection.execute(sql)
  end

  def search
  end
end
