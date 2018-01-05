
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
    owner = Owner.create(name: "Sam's Snacks", id: 1)
    sams = owner.machines.create(location: "Don's Mixed Drinks")
    sams.snacks.create(name: "White Castle Burger", price: "$3.50")
    sams.snacks.create(name: "Pop Rocks", price: "$1.50")

    visit machine_path(sams)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("White Castle Burger")
    expect(page).to have_content("$3.50")
  end

  it "sees average price for snacks that are in that machine" do
    owner = Owner.create(name: "Sam's Snacks", id: 1)
    sams = owner.machines.create(location: "Don's Mixed Drinks")
    sams.snacks.create(name: "White Castle Burger", price: "$3.50")
    sams.snacks.create(name: "Pop Rocks", price: "$1.50")

    visit machine_path(sams)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("White Castle Burger")
    expect(page).to have_content("$3.50")
  end
end
