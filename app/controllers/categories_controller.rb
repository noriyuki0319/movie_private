class CategoriesController < ApplicationController

  def index
  end

  def action
    @action = Movie.joins(:reviews).where(category_id: "アクション／アドベンチャー").group("track_id")
  end

  def drama
    @drama = Movie.joins(:reviews).where(category_id: "ドラマ").group("track_id")
  end

  def fantasy
    @fantasy = Movie.joins(:reviews).where(category_id: "SF／ファンタジー").group("track_id")
  end

  def comedy
    @comedy = Movie.joins(:reviews).where(category_id: "コメディ").group("track_id")
  end

  def romance
    @romance = Movie.joins(:reviews).where(category_id: "ロマンス").group("track_id")
  end

  def kids
    @kids = Movie.joins(:reviews).where(category_id: "キッズ／ファミリー").group("track_id")
  end

  def sports
    @sports = Movie.joins(:reviews).where(category_id: "スポーツ").group("track_id")
  end

  def musical
    @musical = Movie.joins(:reviews).where(category_id: "ミュージカル").group("track_id")
  end

  def anime
    @anime = Movie.joins(:reviews).where(category_id: "アニメ").group("track_id")
  end

  def thriller
    @thriller = Movie.joins(:reviews).where(category_id: "スリラー").group("track_id")
  end

  def documentary
    @documentary = Movie.joins(:reviews).where(category_id: "ドキュメンタリー").group("track_id")
  end

  def masterpiece
    @masterpiece = Movie.joins(:reviews).where(category_id: "名作").group("track_id")
  end

  def music_dc
    @music_dc = Movie.joins(:reviews).where(category_id: "音楽ドキュメンタリー").group("track_id")
  end

  def music_mv
    @music_mv = Movie.joins(:reviews).where(category_id: "音楽映画").group("track_id")
  end

  def horror
    @horror = Movie.joins(:reviews).where(category_id: "ホラー").group("track_id")
  end

  def hobby
    @hobby = Movie.joins(:reviews).where(category_id: "趣味／教養").group("track_id")
  end

  def japanese
    @japanese = Movie.joins(:reviews).where(category_id: "日本映画").group("track_id")
  end

  def live
    @live = Movie.joins(:reviews).where(category_id: "ライブビデオ").group("track_id")
  end

end
