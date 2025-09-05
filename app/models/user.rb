class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :profile_image
         has_many :books, dependent: :destroy

         validates :name, presence: true

  #以下の表記は画像がない時にどうするかの処理をする記述、高さ幅の変数を冒頭で（）内に定義
         def get_profile_image(width, height)
           unless profile_image.attached?
             file_path = Rails.root.join('app/assets/images/no_image.jpg')
             profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
           end
           profile_image.variant(resize_to_limit: [width, height]).processed
         end
end
