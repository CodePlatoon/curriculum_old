require_relative "../spec_helper"

describe "Medium Associations" do
  let!(:author) { User.create! }
  let!(:post) { Post.create!(user: author) }

  let!(:commenter_1) { User.create! }
  let!(:commenter_2) { User.create! }
  let!(:comment_1) { Comment.create!(post: post, user: commenter_1) }
  let!(:comment_2) { Comment.create!(post: post, user: commenter_2) }

  describe Post do
    describe "#user" do
      it "returns the author of the post" do
        expect(post.user).to eq author
      end
    end

    describe "#comments" do
      it "returns the post's comments" do
        expect(post.comments).to match_array [comment_1, comment_2]
      end
    end
  end

  describe Comment do
    describe "#user" do
      it "returns the comment's author (user)" do
        expect(comment_1.user).to eq commenter_1
      end
    end

    describe "#post" do
      it "returns the comment's post" do
        expect(comment_1.post).to eq post
      end
    end
  end

  describe User do
    describe "#posts" do
      it "returns the posts written by this user" do
        expect(author.posts).to match_array [post]
      end
    end

    describe "#comments" do
      it "returns the comments created by the user" do
        expect(commenter_1.comments).to match_array [comment_1]
      end
    end

  end
end
