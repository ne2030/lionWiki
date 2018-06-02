class PostController < ApplicationController
  def new
    # 문서 생성 view : 사용자가 쓰고자 하는 문서를 작성하고, 제출하며, 제출하고 난 뒤에는 완성된 문서를 볼 수 있게 연결해주는 액션
    @post = Post.new
  end

  def create
    # 문서 생성 api : 사용자한테 보이지는 않지만 사용자가 문서를 작성하여 제출하면 그 문서를 받아 배열하고 저장하는 액션
    def create
      @post = Post.new(content_params.merge(order: order + 1))
      @post.save
      uploaded_io = params[:post][:img]
      file_path = Rails.root.join('public/posts', @post[:id].to_s)

      FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
      File.open(file_path + uploaded_io.original_filename, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      @post[:img] = "/posts/#{@post[:id].to_s}/#{uploaded_io.original_filename}"
      @post.save

      redirect_to "/posts/#detail"
    end

    private
    def post_params
      params.require(:post).permit(:title, :post_id, :img)
    end
    end
  end

  def search
  end

  def detail
    postId = params[:id]
    @post = Post.where(id: postId)[0]
    @contents = Content.where(post_id: postId)
    @comments = Comment.where(post_id: postId)
  end
