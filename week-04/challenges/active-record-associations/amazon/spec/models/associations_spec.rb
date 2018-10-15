require "spec_helper"

describe "Amazon Associations" do
  let!(:shop_owner) { User.create! }
  let!(:shop) { Shop.create!(owner: shop_owner) }

  let!(:user) { User.create! }
  let!(:product) { Product.create!(shop: shop) }
  let!(:review) { Review.create!(product: product, user: user) }

  describe Shop do
    describe "#owner" do
      it "returns the owner of the shop" do
        expect(shop.owner).to eq shop_owner
      end
    end

    describe "#products" do
      it "returns the products for sale in the shop" do
        expect(shop.products).to match_array([product])
      end
    end

    describe "#reviews" do
      it "returns the reviews for the products sold by this shop" do
        expect(shop.reviews).to match_array([review])
      end
    end
  end

  describe Product do
    describe "#reviews" do
      it "returns the product's reviews" do
        expect(product.reviews).to match_array([review])
      end
    end

    describe "#shop" do
      it "returns the product's shop" do
        expect(product.shop).to eq shop
      end
    end
  end

  describe Review do
    describe "#product" do
      it "returns the reviewed product" do
        expect(review.product).to eq product
      end
    end

    describe "#user" do
      it "returns the review's author" do
        expect(review.user).to eq user
      end
    end
  end

  describe User do
    describe "#shops" do
      it "returns the shops the user owns" do
        expect(shop_owner.shops).to match_array([shop])
      end
    end

    describe "#reviews" do
      it "returns the reviews created by the user" do
        expect(user.reviews).to match_array([review])
      end
    end

    describe "#reviewd_products" do
      it "returns the products the user has reviewed" do
        expect(user.reviewed_products).to match_array([product])
      end
    end
  end
end
