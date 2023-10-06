class PostsController < ApplicationController

    # メソッドの実行前にset_postメソッドを実行する
    before_action :set_post, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        # フォームに表示するための空のインスタンスを作成する
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            # インデックスページにリダイレクトする
            redirect_to posts_path
        else
            # new.html.erbを表示する
            render :new
        end
    end

    def edit
        # 1. レコードを検索する
    end

    def update
        # 2. 受け取ったデータを元にレコードを検索する
        if @post.update(post_params)
            # 3. レコードを更新してインデックスページにリダイレクトする
            redirect_to posts_path
        else
            # 4. レコードを更新できなかった場合は編集ページを再表示する
            render :edit
        end
    end
    
    def destroy
        @post.destroy
        # インデックスページにリダイレクトする
        redirect_to posts_path
    end

    # クラス内でのみ使用するメソッドはprivate以下に記述する
    private

    def post_params
        # strong parameters
        params.require(:post).permit(:title, :content)
    end

    # 1. レコードを検索する
    def set_post
        @post = Post.find(params[:id])
    end
end
