class ContentsController < ApplicationController
  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(title: params[:input_title], text: params[:input_content])
    # redirect_to "/posts/#{params[:post_id]}"
  end

  def new
    @content = Content.new
    postId = params[:id]

    @content["post_id"] = postId
    @post = Post.where(id: postId).last
  end

  def create
    postId = content_params[:post_id]
    @prevContent = Content.order(:order).where(post_id: postId).last["order"]
    if @prevContent
      order = @prevContent + 1
    else
      order = 0
    end

    @content = Content.new(content_params.merge(order: order))
    @content.save
    uploaded_io = params[:content][:img]
    if uploaded_io
      file_path = Rails.root.join('public/contents', @content[:id].to_s)

      FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
      File.open(file_path + uploaded_io.original_filename, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      @content[:img] = "/contents/#{@content[:id].to_s}/#{uploaded_io.original_filename}"
      @content.save
    end
    redirect_to "/posts/#{postId}"
  end

  private
  def content_params
    params.require(:content).permit(:title, :post_id, :text)
  end
end
