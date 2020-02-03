class CardController < ApplicationController
    # 新規作成ページに遷移するためのアクション
    def new
        @card = Card.new
        @list = List.find_by(id: params[:list_id])
    end

    # 新規作成ページに遷移後に実際、新規投稿を保存するためのアクション
    def create
        @card = Card.new(card_params)
        if @card.save
            redirect_to :root
        else
            render action: :new
        end
    end

    private
        def card_params
            # require:受取るキーの設定
            # permit:変更を加えられるキーの指定
            # merge:２つのハッシュを統合。誰がリストを作成したかを理解させるため
            params.require(:card).permit(:title,:memo,:list_id)
        end
end
