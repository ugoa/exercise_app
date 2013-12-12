class Backend::PostsController < Backend::BackendController
  def index
    @posts = Post.all
    if params[:search].present?
      @posts = Post.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"])
    else
      @posts = Post.all
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params.require(:post).permit(:title, :content))
      redirect_to backend_posts_path
    else
      render :edit
    end
  end
  
  def post_paramssss
    params.require(:post).permit(:title, :content)
  end
end
