require_relative "./spec_helper"
require "app/product_crud"
require "app/seed_product"

describe ProductCrud do
  describe "basic finders" do
    describe ".find" do
      it "finds by id" do
        expect(described_class.find(10)).to eq(Product.find 10)
      end
    end

    describe ".find_by_model" do
      it "finds the matching product by model name" do
        expect(described_class.find_by_model("Heavy Duty Steel Clock"))
          .to eq(Product.find(3))
      end
    end

    describe ".find_by_model_with_exception" do
      it "raises an exception if a match isn't found" do
        expect { described_class.find_by_model_with_exception("No Such Product") }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe ".last_record" do
      it "finds the last record inserted" do
        product = SeedProduct.seed

        expect(described_class.last_record).to eq(product)
      end
    end

    describe ".last_record_ordered_by_price_cents_asc" do
      it "returns the most expensive product" do
        expect(described_class.last_record_ordered_by_price_cents_asc)
          .to eq Product.find 9
      end
    end
  end

  describe "conditional queries" do
    describe ".by_rating" do
      it "finds products by their average rating" do
        expect(described_class.with_rating(3.5))
          .to match_array Product.where(id: [7,8,9,20,24])
      end
    end

    describe ".by_rating_range" do
      it "finds products within an average rating range" do
        expect(described_class.within_rating_range(1.1, 1.5))
          .to match_array Product.where(id: [14, 15, 16, 18, 21])
      end
    end

    describe ".by_rating_and_color" do
      it "finds products a rating & color value" do
        expect(described_class.by_rating_and_color(3.5, "maroon"))
          .to match_array Product.where(id: [7])
      end
    end

    describe ".by_rating_or_color" do
      it "finds products a rating or color value" do
        expect(described_class.by_rating_or_color(4.3, "blue"))
          .to match_array Product.where(id: [5, 15])
      end
    end

    describe ".no_color_count" do
      it "returns the count of products that don't have a color value" do
        expect(described_class.no_color_count).to eq(22)
      end
    end

    describe ".below_price_or_above_rating" do
      it "returns products below a price or above a rating value" do
        expect(described_class.below_price_or_above_rating(1000, 4.0))
          .to match_array Product.where(id: [2, 3, 4, 5, 11, 22, 25])
      end
    end

    describe ".ordered_by_category_alpha_price_descending" do
      it "returns products ordered by category alphabetically and descending in price" do
        ids = described_class.ordered_by_category_alpha_price_descending.map(&:id)

        expect(ids).to eq [1, 18, 10, 27, 29, 21, 9, 7, 15, 5, 19, 8, 4, 30, 14, 22, 16, 13, 26, 3, 28, 23, 24, 25, 17, 12, 2, 20, 11, 6]
      end
    end

    describe ".products_by_maufacturer" do
      it "returns products made by manufacturers" do
        expect(described_class.by_manufacturer_name_query("Group"))
          .to match_array Product.where(id: [2, 3, 6, 29])
      end
    end

    describe ".manufacturer_names_for_query" do
      it "returns manufacturer names that match query" do
        expect(described_class.manufacturer_names_for_query("Group"))
          .to match_array ["Lakin Group", "Nikolaus Group", "Rolfson Group", "Watsica Group"]
      end
    end

    describe ".not_in_a_category" do
      it "returns products that are not in a category" do
        expect(described_class.not_in_category("Garden"))
          .to match_array (Product.all - Product.where(id: 30))
      end
    end

    describe ".limited_not_in_a_category" do
      it "returns products that are not in a category up to a limit" do
        expect(described_class.limited_not_in_category("Garden", 3))
          .to match_array Product.all.first(3)
      end
    end

    describe ".category_manufacturers" do
      it "returns an array of manufacturers for a category" do
        expect(described_class.category_manufacturers("Baby"))
          .to match_array ["Cormier, Rice and Ledner", "Crooks, Pacocha and Rohan", "Howell, Hills and Dickens", "Muller-Koss", "Rolfson Group"]
      end
    end
  end

  describe "calculations" do
    describe ".average_category_rating" do
      it "returns the average" do
        expect(described_class.average_category_rating("Baby"))
          .to eq 2.32
      end
    end

    describe ".greatest_price" do
      it "returns the highest price" do
        expect(described_class.greatest_price).to eq 9758
      end
    end

    describe ".longest_model_name" do
      it "returns the length of the longest model name" do
        expect(described_class.longest_model_name).to eq 29
      end
    end

    describe ".ordered_by_model_length" do
      it "returns products ordered by the length of their model name" do
        expect(described_class.ordered_by_model_length.pluck(:id))
          .to eq [8, 28, 15, 11, 27, 5, 17, 10, 7, 1, 9, 12, 26, 30, 2, 13, 3, 4, 21, 24, 29, 16, 14, 20, 23, 18, 6, 22, 19, 25]
      end
    end

    describe ".with_cents_per_rating" do
      it "returns products with a new column 'cents_per_rating'" do
        expect(described_class.with_cents_per_rating(4).cents_per_rating.round(2))
          .to eq(43.68)
      end
    end
  end
end
