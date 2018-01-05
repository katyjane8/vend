
require 'rails_helper'

describe "User can see all snacks" do
  it "sees snack name" do
    owner = Owner.create(name: "Sam's Snacks", id: 1)
    snack = Snack.create(name: "White Castle Burger", price: "$3.50")
    machine = Machine.create(location: "Don's Mixed Drinks")

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
  end

  it "sees all snacks that are in that machine" do
    snack = Snack.create(name: "White Castle Burger", price: "$3.50")
    snack1 = Snack.create(name: "Pop Rocks", price: "$1.50")
    owner = Owner.create(name: "Sam's Snacks", id: 1)
    machine = Machine.create(location: "Don's Mixed Drinks")

    visit snack_path(snack)

    expect(page).to have_content(machine.location)
  end
end
