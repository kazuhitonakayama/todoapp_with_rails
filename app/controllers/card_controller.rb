class CardController < ApplicationController
    # show・edit・updateアクションを呼ぶ前にset_cardメソッドを読む
    before_action :set_card, only: %i(show edit update)


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

    # カードの詳細画面への遷移
    def show
        #　@card = Card.find_by(id: params[:id])の記述が、show,edit,updateメソッドで重複しているので、set_cardに処理をまとめる
        #@card = Card.find_by(id: params[:id])
    end

    #　カードの編集画面への遷移
    #　遷移の過程で、カード情報を取得
    def edit
        #　@card = Card.find_by(id: params[:id])の記述が、show,edit,updateメソッドで重複しているので、set_cardに処理をまとめる
        #@card = Card.find_by(id: params[:id])
    end

    #　カードの内容を編集し、従前の内容を上書きして更新する
    def update
        #　@card = Card.find_by(id: params[:id])の記述が、show,edit,updateメソッドで重複しているので、set_cardに処理をまとめる
        #@card = Card.find_by(id: params[:id])
        if @card.update_attributes(card_params)
          redirect_to :root
        else
          render action: :edit
        end
    end

    private
        def card_params
            # require:受取るキーの設定
            # permit:変更を加えられるキーの指定
            # merge:２つのハッシュを統合。誰がリストを作成したかを理解させるため
            params.require(:card).permit(:title,:memo,:list_id)
        end

        def set_card
            #　@card = Card.find_by(id: params[:id])の記述が、show,edit,updateメソッドで重複しているので、set_cardに処理をまとめる
            @card = Card.find_by(id: params[:id])
        end
end
