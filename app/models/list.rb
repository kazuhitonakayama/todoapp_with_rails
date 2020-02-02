class List < ApplicationRecord
    # Listは一人のユーザに依存するよという命令
    belongs_to :user

    # Listは複数のカードを持つようにという命令
    has_many :cards, dependent: :destroy

    #titleは1文字以上255文字以内にしてねという命令
    validates :title, length: { in: 1..255 }
end
