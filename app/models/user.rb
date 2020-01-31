class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # ユーザーの新規登録をする際に、ユーザー名が何もない状態だと困るので、nameカラムにバリデーションを設定します
  validates :name, presence: true, length: { maximum: 20 }
end
