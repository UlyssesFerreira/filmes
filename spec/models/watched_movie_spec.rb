require 'rails_helper'

RSpec.describe WatchedMovie, type: :model do
  it "é válido registrar um filme como assistido" do
    user = create(:user)
    movie = create(:movie)
    review = movie.mark_as_watched(user: user, watched_at: Date.yesterday, rating: 10, comment: "Bom")
    expect(review.save).to be_truthy
  end

  it "é inválido registrar um filme com nota menor que 1" do
    user = create(:user)
    movie = create(:movie)
    review = movie.mark_as_watched(user: user, watched_at: Date.yesterday, rating: -1)
    expect(review.save).to be_falsey
  end

  it "é inválido registrar um filme com nota maior que 10" do
    user = create(:user)
    movie = create(:movie)
    review = movie.mark_as_watched(user: user, watched_at: Date.yesterday, rating: 15)
    expect(review.save).to be_falsey
  end

  it "é inválido registrar um filme em uma data futura" do
    user = create(:user)
    movie = create(:movie)
    review = movie.mark_as_watched(user: user, watched_at: Date.tomorrow, rating: 10)
    expect(review.save).to be_falsey
  end
end
