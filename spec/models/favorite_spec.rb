require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it "é válido adicionar um filme aos favoritos" do
    movie = create(:movie)
    user = create(:user)
    fav = movie.favorite(user)
    expect(fav.save).to be_truthy
  end

  it "é válido remover um filme dos favoritos" do
    favorite = create(:favorite)
    movie = favorite.movie
    user = favorite.user
    expect { movie.remove_favorite(user) }.to change(Favorite, :count).by(-1)
  end

  it "é inválido favoritar um filme já favoritado" do
    favorite = create(:favorite)
    movie = favorite.movie
    user = favorite.user
    expect(movie.favorite(user).save).to be_falsey
  end
end
