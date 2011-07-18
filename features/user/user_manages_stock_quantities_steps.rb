When /^I sum one to an item quantity$/ do
  @current_stock = @current_user.items.first.actual_stock
  @current_user.items.first.plus_one!
end

Then /^I should see the last quantity plus one on this item$/ do
  new_stock = @current_user.items.first.actual_stock
  new_stock.must_equal (@current_stock+1)
end

When /^I subtract one from an item quantity$/ do
  first_item = @current_user.items.first
  first_item.actual_stock = 2
  first_item.save!
  @current_user.items.first.minus_one!
end

Then /^I should see the last quantity minus one on this item$/ do
  new_stock = @current_user.items.first.actual_stock
  new_stock.must_equal (1)
end

