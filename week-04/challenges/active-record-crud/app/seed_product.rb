class SeedProduct
  def self.seed
    description = ""
    if rand > 0.3
      description = Faker::Hipster.paragraph
    end

    volume_discount_percent = nil
    volume_discount_threshold = nil
    if rand > 0.7
      volume_discount_percent = rand(10) + 1
      volume_discount_threshold = [10, 20, 50, 100].sample
    end

    color = nil
    if rand > 0.8
      color = Faker::Color.color_name
    end


    Product.create(manufacturer: Faker::Company.name,
                   model: Faker::Commerce.unique.product_name,
                   category: Faker::Commerce.department(1),
                   description: description,
                   price_cents: Faker::Commerce.price*100,
                   rating: 1.0 + rand(40)/10.0,
                   volume_discount_percent: volume_discount_percent,
                   volume_discount_threshold: volume_discount_threshold,
                   color: color)
  end
end
