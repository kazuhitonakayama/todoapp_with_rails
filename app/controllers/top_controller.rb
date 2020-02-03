class TopController < ApplicationController
  def index
    # 新規作成したListの一覧を表示　なおかつ、ログインユーザーが投稿した投稿のみ表示するようにする
    @lists = List.where(user: current_user).order("created_at ASC")
  end
end
