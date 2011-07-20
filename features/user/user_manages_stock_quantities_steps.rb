When /^I sum one to an item quantity$/ do
  @current_stock = @current_user.items.first.actual_stock
  @first_item = @current_user.items.first
  click_link I18n.t('user.items.item.actions.plus')
end

Then /^I should see the last quantity plus one on this item$/ do
  within "table#items tr#item_#{@first_item.id} .actual_stock" do
    page.has_content?((@current_stock+1).to_s).must_equal true
  end
end

When /^I subtract one from an item quantity$/ do
  @first_item = @current_user.items.first
  @first_item.actual_stock = 2
  @first_item.save
  click_link I18n.t('user.items.item.actions.minus')
end

Then /^I should see the last quantity minus one on this item$/ do
  within "table#items tr#item_#{@first_item.id} .actual_stock" do
    page.has_content?('1').must_equal true
  end
end

