module StaticPagesHelper

  # キーワード検索
  def keyword_search(keyword)
    if keyword.present?
      @movies = Movie.where('name LIKE(?) OR content LIKE(?) OR movie_maxim LIKE(?)',
                  "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end
  end

  # カテゴリー検索
  def category_search(category)
    if category.present?
      @movies = @movies.where(category_id: category)
    end
  end

  # 投稿順序変更
  def movies_order(order)
    if order.present?
      if "screening_date_asc" == order
        @movies = @movies.order(screening_date: :ASC)
      elsif "screening_date_desc" == order
        @movies = @movies.order(screening_date: :DESC)
      elsif "created_at_asc" == order
        @movies = @movies.order(created_at: :ASC)
      else
        @movies = @movies.order(created_at: :DESC)
      end
    end
  end
end
