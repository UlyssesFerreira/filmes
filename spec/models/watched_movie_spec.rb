require 'rails_helper'

RSpec.describe WatchedMovie, type: :model do
  it "é válido registrar um filme como assistido" do
    user = create(:user)
    movie = create(:movie)
    review = movie.mark_as_watched(user: user, watched_at: Date.yesterday, rating: 10, comment: "Bom")
    expect(review.save).to be true
  end
end
