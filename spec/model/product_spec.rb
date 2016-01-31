require 'rails_helper'

	describe Product do
		before do
			@product = Product.create!(name: "chips")
			@user = User.create!(email: "test5@gmail.com", password: "testtest")
			@product.comments.create!(rating: 1, user: @user, body: "tastes awful!")
			@product.comments.create!(rating: 3, user: @user, body: "not bad")
			@product.comments.create!(rating: 5, user: @user, body: "delicious!")
		end

	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3.0
	end

	it "validates the product" do
		expect(Product.new(description: "Delicious Chips")).not_to be_valid
	end
end