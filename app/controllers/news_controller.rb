class NewsController < ApplicationController
  def last
    # Book.find_by()
    fast_query = 'SELECT * FROM'
    if params[:search].present?
      fast_query += "\"#{params[:search]}\""
    else
      fast_query += '"books"'
    end
    @records_array = ActiveRecord::Base.connection.execute(fast_query)
  end

  def search
  end
end
