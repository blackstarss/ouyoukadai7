class BooksController < ApplicationController
  def top
  end
  
  
  def index
    @books = Book.all
    @book = Book.new
    # .newと記述すると、空のモデルが生成  インスタンス変数を書いた空のモデルを渡すと、フォームとBlogモデルが関連づけられます。
  end

  def show
    @book = Book.find(params[:id])
    # URLが/todolists/1の場合、params[:id] と記述すると、id=1を取り出せます。   id=1のデータをfindメソッドを利用してデータベースから取得し、@bookへ格納します
  end

  
  def create
      
    @book = Book.new(book_params)
    if @book.save
      
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
     @books = Book.all
     render :index
  #renderはredirect_toと異なりアクションを経由せず、そのままビューを出力するので、ビューで使う変数は、renderの前にそのアクション`で定義しないといけない。 ここでは@books=Book.allアクションを定義しておく必要
    end
  end
  # 
  


# findメソッドは、idによってモデルを検索してくれるメソッド
# paramsメソッドは、送信された値の受け渡しをするメソッドparams[:カラム]のように書いて、モデルのカラムを指定してあげることで、送信された値のパラメータからその値を取り出してくれます

  def edit
    @book = Book.find(params[:id])
  end
  # インスタンス変数は、同じクラス内であれば、メソッドを抜け出しても使うことができます！
  # 今回は投稿済みのデータを編集するので、保存されているデータが必要。findメソッドを用いて、データを取得
  #Book.find(params[:id])は、送信されたパラメータの中からidカラムを取り出し、そのidをもとにBookモデルを探している

  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      
      render :edit
    end
  end
  # インスタンス変数で定義し直す
  
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    
    redirect_to books_path, data: { confirm: 'Are you sure?' } , notice: "Book was successfully destroyed."
  end
  
  # redirect_toメソッドが実は非常に便利に出来ていて、引数に文字列を渡すことで簡単にflash配列へとメッセージを格納することが可能
  
  private
  # ストロングパラメータ  privateは一種の境界線で、「ここから下はcontrollerの中でしか呼び出せません」という意味   他のアクション（index,show,createなど）を巻き込まないようにprivateはControllerファイルの一番下のendのすぐ上
  def book_params
    params.require(:book).permit(:title, :body)
    
    # require(:book).を削除した
  end
  
  
end
