class List < ApplicationRecord
    # LIstは一人のユーザに依存するよという命令
    belongs_to :user

    #titleは1文字以上255文字以内にしてねという命令
    validates :title, length: { in: 1..255 }
end
