class TopController < ApplicationController
  def index
    # 新規作成したListの一覧を表示
    @lists = List.where(user: current_user).order("created_at ASC")
  end
end
