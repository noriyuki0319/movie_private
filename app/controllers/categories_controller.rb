class CategoriesController < ApplicationController

  def index
  end

  def action
    @action = Movie.joins(:reviews).where(category_id: "アクション／アドベンチャー").group("title")
  end

  def drama
    @drama = Movie.joins(:reviews).where(category_id: "ドラマ").group("title")
    binding.pry
  end

  def fantasy
    @fantasy = Movie.joins(:reviews).where(category_id: "SF／ファンタジー").group("title")
  end

  def comedy
    @comedy = Movie.joins(:reviews).where(category_id: "コメディ").group("title")
  end

  def romance
    @romance = Movie.joins(:reviews).where(category_id: "ロマンス").group("title")
  end

  def kids
    @kids = Movie.joins(:reviews).where(category_id: "キッズ／ファミリー").group("title")
  end

  def sports
    @sports = Movie.joins(:reviews).where(category_id: "スポーツ").group("title")
  end

  def musical
    @musical = Movie.joins(:reviews).where(category_id: "ミュージカル").group("title")
  end

  def anime
    @anime = Movie.joins(:reviews).where(category_id: "アニメ").group("title")
  end

  def thriller
    @thriller = Movie.joins(:reviews).where(category_id: "スリラー").group("title")
  end

  def documentary
    @documentary = Movie.joins(:reviews).where(category_id: "ドキュメンタリー").group("title")
  end

  def masterpiece
    @masterpiece = Movie.joins(:reviews).where(category_id: "名作").group("title")
  end

  def music_dc
    @music_dc = Movie.joins(:reviews).where(category_id: "音楽ドキュメンタリー").group("title")
  end

  def music_mv
    @music_mv = Movie.joins(:reviews).where(category_id: "音楽映画").group("title")
  end

  def horror
    @horror = Movie.joins(:reviews).where(category_id: "ホラー").group("title")
  end

  def hobby
    @hobby = Movie.joins(:reviews).where(category_id: "趣味／教養").group("title")
  end

  def japanese
    @japanese = Movie.joins(:reviews).where(category_id: "日本映画").group("title")
  end

  def live
    @live = Movie.joins(:reviews).where(category_id: "ライブビデオ").group("title")
  end

end
