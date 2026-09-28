class SelectionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    # ここで必要なデータを取得してビューに渡す
  end
end
