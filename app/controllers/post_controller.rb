class PostController < ApplicationController
  def new
    # 문서 생성 view : 사용자가 쓰고자 하는 문서를 작성하고, 제출하며, 제출하고 난 뒤에는 완성된 문서를 볼 수 있게 연결해주는 액션
  end

  def create
    # 문서 생성 api : 사용자한테 보이지는 않지만 사용자가 문서를 작성하여 제출하면 그 문서를 받아 배열하고 저장하는 액션
  end

  def search
  end

  def detail
  end
end
