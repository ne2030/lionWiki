class ContentsController < ApplicationController
  def edit
  end

  def update
  end

  def new
    @content = Content.new
    postId = params[:postId]

    @content["post_id"] = postId
    @post = Post.where(id: postId).last
  end

  def create
    postId = content_params[:post_id]
    order = Content.order(:order).last["order"]

    @content = Content.new(content_params.merge(order: order + 1))
    @content.save
    uploaded_io = params[:content][:img]
    file_path = Rails.root.join('public/contents', @content[:id].to_s)

    FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
    File.open(file_path + uploaded_io.original_filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    @content[:img] = "/contents/#{@content[:id].to_s}/#{uploaded_io.original_filename}"
    @content.save

    redirect_to "/posts/#{postId}"
  end

  private
    def content_params
      params.require(:content).permit(:title, :post_id, :text)
    end
end
