class ListController < ApplicationController
    # newアクション ここでは、listの新規作成を行う
    def new
        @list = List.new
    end

    # createアクション ここでは、listの新規作成を行う
    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to :root
        else
            render action: :new
        end
    end

    private
        def list_params
            # require:受取るキーの設定
            # permit:変更を加えられるキーの指定
            # merge:２つのハッシュを統合。誰がリストを作成したかを理解させるため
            params.require(:list).permit(:title).merge(user: current_user)
        end
end
