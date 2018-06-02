class PostController < ApplicationController
  def new
    # 문서 생성 view : 사용자가 쓰고자 하는 문서를 작성하고, 제출하며, 제출하고 난 뒤에는 완성된 문서를 볼 수 있게 연결해주는 액션
    @post = Post.new
  end

  # 문서 생성 api : 사용자한테 보이지는 않지만 사용자가 문서를 작성하여 제출하면 그 문서를 받아 배열하고 저장하는 액션
  def create
    @prev = Post.where(title: post_params[:title]).last
    if @prev
      redirect_to "/posts/#{@prev[:id].to_s}"
    else
      @post = Post.new(post_params)
      @post.save

      uploaded_io = params[:post][:img]
      if uploaded_io
        file_path = Rails.root.join('public/posts', @post[:id].to_s)

        FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
        File.open(file_path + uploaded_io.original_filename, 'wb') do |file|
          file.write(uploaded_io.read)
        end

        @post[:img] = "/posts/#{@post[:id].to_s}/#{uploaded_io.original_filename}"
        @post.save
      end

      redirect_to "/posts/#{@post[:id].to_s}"
    end
  end

  def search
    @post = Post.where(title: params[:search])[0]
    if @post
      redirect_to "/posts/#{@post[:id].to_s}"
    else
      redirect_to "/"
    end

  end

  def detail
    postId = params[:id]
    @post = Post.where(id: postId)[0]
    @contents = Content.where(post_id: postId)
    @comments = Comment.where(post_id: postId)
  end

  private
  def post_params
    params.require(:post).permit(:title, :img)
  end
end