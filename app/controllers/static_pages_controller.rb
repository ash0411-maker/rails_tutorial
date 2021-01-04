class StaticPagesController < ApplicationController
  def home
    # 純粋なrubyであればここに何も記述していないと何も実行しない。
    # しかし、ApplicationControllerを継承しているからrails特有の振る舞いをする。
  end

  def help
  end

  def about
  end
end
