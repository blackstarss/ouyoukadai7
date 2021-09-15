class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
    # URLが/todolists/1の場合、params[:id] と記述すると、id=1を取り出せます。   id=1のデータをfindメソッドを利用してデータベースから取得し、@bookへ格納します
    
  end

  def index
  end
end
