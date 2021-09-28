class BookComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :book
  
  validates :content, presence: true
  # 空欄での投稿不可
  
end
