class User < ApplicationRecord
  has_many :watched_movies
  has_many :movies, through: :watched_movies

  has_many :favorites
  has_many :users, through: :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
