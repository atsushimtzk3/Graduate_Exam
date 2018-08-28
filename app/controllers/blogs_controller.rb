class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except=>[:top, :recruit, :show, :show_favorites]
  
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    if current_user = current_applicant
      @favorite = current_applicant.favorites.find_by(blog_id: @blog.id)
      
      @user = current_user
      @favorite_blogs = @user.favorite_blogs 
      
    else
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する
    @blog.user_name = current_user.name
    @blog.user_base = current_user.base
    @blog.user_email = current_user.email
    
    if @blog.save
      
       @user = current_user
       # deliverメソッドを使って、メールを送信する
       ContactMailer.contact_mail(@user).deliver

       redirect_to blogs_path, notice: "新規募集を登録しました"
       
    else
       render 'new'
    end
  
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end  

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '編集に成功しました.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def top
    @user = current_user
  end
  
  def recruit
    @blogs = Blog.all.order(created_at: :desc)
  end
  


  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '削除に成功しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content, :starting_time, :finishing_time, :recruitment_number, :user_id, :user_name, :user_base, :user_email, :applicant_id, :applicant_number)
    end
end
