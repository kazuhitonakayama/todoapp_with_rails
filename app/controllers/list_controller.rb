class ListController < ApplicationController
    # edit,updateにのみset_listメソッドを程起用するように命令
    before_action :set_list, only: %i(edit update destroy)

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

    # editアクション ここでは、listの編集のために一旦従来の投稿内容を@listに保管する作業を行う
    def edit
        # @list = List.find_by(id: params[:id]) 下記set_listにて省略
    end

    # 実際に、editアクションで取得した情報に上書きして、投稿内容を編集し、保存する
    def update
        # @list = List.find_by(id: params[:id]) 下記set_listにて省略
        # update_attributesで成功時には更新と保存を続けて同時に行う
        if @list.update_attributes(list_params)
          redirect_to :root
        else
          render action: :edit
        end
    end

    # destroyアクション。このアクションでListの削除を行う
    def destroy
        @list.destroy
        redirect_to :root
    end

    private
        def list_params
            # require:受取るキーの設定
            # permit:変更を加えられるキーの指定
            # merge:２つのハッシュを統合。誰がリストを作成したかを理解させるため
            params.require(:list).permit(:title).merge(user: current_user)
        end

        # ここで、Edit、Updateアクションで使われている、id情報を引っ張ってくる命令を一元化。このページの２行目で関連する設定を行う
        def set_list
            @list = List.find_by(id: params[:id])
        end

end
