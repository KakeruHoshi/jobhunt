class BlogsController < ApplicationController

  def index
    @blogs = Blog.where(user_id: current_user.id)
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_parameter)
    logger.debug('####################')
logger.debug(blog_parameter)
logger.debug('####################')
    blog.user_id = current_user.id
    blog.save
    redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end

end