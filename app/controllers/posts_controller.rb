class PostsController < ApplicationController

  def  index #indexアクションを定義した
    @posts = Post.all.order(id: "DESC") #すべてのレコードを＠postに代入
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def chacked
    post = Post.find(params[:id])
    if post.checked
      post.update(chacked: false)
    else
      post.update(checked: ture)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
