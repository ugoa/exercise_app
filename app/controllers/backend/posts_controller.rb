class Backend::PostsController < Backend::BackendController
  def index
    @posts = Post.all
    if params[:search].present?
      @posts = Post.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"])
    else
      @posts = Post.order("created_at ASC")
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to backend_posts_path
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      redirect_to backend_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to backend_posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
