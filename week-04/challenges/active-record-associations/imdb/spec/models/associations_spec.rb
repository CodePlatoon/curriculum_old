require_relative "../spec_helper"

describe "IMDB Associations" do
  let!(:movie) { Movie.create! }
  let!(:actor) { Actor.create! }
  let!(:role) { Role.create!(movie: movie, actor: actor) }

  describe Role do
    describe "#movie" do
      it "returns the role's movie" do
        expect(role.movie).to eq movie
      end
    end

    describe "#actor" do
      it "returns the role's actor" do
        expect(role.actor).to eq actor
      end
    end
  end

  describe Movie do
    describe "#roles" do
      it "returns the movie's roles" do
        expect(movie.roles).to match_array([role])
      end
    end

    describe "#actors" do
      it "returns the movie's actors" do
        expect(movie.actors).to match_array([actor])
      end
    end
  end

  describe Actor do
    describe "#roles" do
      it "returns the actor's roles" do
        expect(actor.roles).to match_array [role]
      end
    end

    describe "#movies" do
      it "returns the movies the actor has a role in" do
        expect(actor.movies).to match_array [movie]
      end
    end
  end
end
