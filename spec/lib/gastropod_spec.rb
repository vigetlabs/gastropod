require "spec_helper"
require "fixtures/product"

Product.connection.execute "DROP TABLE IF EXISTS products;"
Product.connection.execute "CREATE TABLE products (id INTEGER PRIMARY KEY , name VARCHAR(255), slug VARCHAR(255));"

describe Gastropod do
  it "can create a slug" do
    product = Product.create!(:name => "HELLO WORLD")
    product.slug.should == "hello-world"
  end

  it "can handle creating a unique slug" do
    product1 = Product.create!(:name => "jimmy boy")
    product2 = Product.create!(:name => "jimmy boy")

    product2.slug.should == "jimmy-boy-2"
  end
end
