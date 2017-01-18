class Article < ActiveRecord::Base
  validates :title, presence:true, length:{ minimun:3 , maximun: 50}
  validates :description, presence:true, length:{ minimun:10, maximun: 300}
end
