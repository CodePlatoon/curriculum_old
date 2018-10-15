require "spec_helper"

describe "Uber Eats Associations" do
  let!(:driver) { Driver.create! }

  let!(:customer) { User.create! }

  let!(:salad) { MenuItem.create! }
  let!(:burrito) { MenuItem.create! }
  let(:burrito_order_item) { OrderItem.new(menu_item: burrito) }
  let(:salad_order_item) { OrderItem.new(menu_item: salad) }

  let!(:order) do
    Order.create!(driver: driver,
                  customer: customer,
                  order_items: [burrito_order_item,
                                salad_order_item])
  end

  describe Driver do
    describe "#orders" do
      it "returns the driver's orders" do
        expect(driver.orders).to match_array [order]
      end
    end

    describe "#customers" do
      it "returns the driver's customers" do
        expect(driver.customers).to match_array [customer]
      end
    end
  end

  describe OrderItem do
    describe "#menu_item" do
      it "returns the menu item" do
        expect(burrito_order_item.menu_item).to eq burrito
      end
    end

    describe "#order" do
      it "returns the order" do
        expect(burrito_order_item.order).to eq order
      end
    end
  end

  describe MenuItem do
    describe "#order_items" do
      it "returns the order items for the menu item" do
        expect(burrito.order_items).to match_array [burrito_order_item]
      end
    end

    describe "#orders" do
      it "returns all orders for the menu item" do
        expect(burrito.orders).to match_array [order]
      end
    end
  end

  describe User do
    describe "#orders" do
      it "returns the user's orders" do
        expect(customer.orders).to match_array [order]
      end
    end

    describe "#order_items" do
      it "returns order items for all the user's orders" do
        expect(customer.order_items).to match_array [burrito_order_item, salad_order_item]
      end
    end

    describe "#menu_items" do
      it "returns all the menu items the user has ordered" do
        expect(customer.menu_items).to match_array [burrito, salad]
      end
    end
  end
end
