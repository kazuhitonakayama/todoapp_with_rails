class User < ApplicationRecord
  # アソシエーションの追加、Userは多数のListを持つよと定義している
  has_many :lists, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # ユーザーの新規登録をする際に、ユーザー名が何もない状態だと困るので、nameカラムにバリデーションを設定する
  validates :name, presence: true, length: { maximum: 20 }
end
