
require 'rails_helper'

describe "User can see all snacks" do
  it "sees snack name" do
    owner = Owner.create(name: "Sam's Snacks", id: 1)
    snack = Snack.create(name: "White Castle Burger", price: "$3.50")
    machine = Machine.create(location: "Don's Mixed Drinks")

    visit snack_path(snack)

    expect(page).to have_content(machine_snacks.name)
    expect(page).to have_content(machine_snacks.price)
  end
end
