Given /^I am logged in as a user$/ do
  @current_user = User.make!
  login_as @current_user
end

Given /^I have some stock items$/ do
  @current_user.items << Item.make!(3)
end

Given /^another user with some stock items exists$/ do
  @another_user = User.make!
  @another_user.items << Item.make!(2)
end

When /^I am at stock list$/ do
  visit user_items_path()
end

Then /^I should see those items in my stock list$/ do
  within 'table#items' do
    page.has_content?('Item 0001').must_equal true
    page.has_content?('Item 0002').must_equal true
    page.has_content?('Item 0003').must_equal true
  end
end

Then /^I should not see the other user items$/ do
  within 'table#items' do
    page.has_content?('Item 0004').must_equal false
    page.has_content?('Item 0005').must_equal false
  end
end

Given /^I am at adding stock item page$/ do
  visit new_user_item_path()
end

When /^I fullfill new form$/ do
  select I18n.t('categories.snack'), from: 'item_category'
  fill_in 'item_short_description', with: 'Llauna d\'olives'
  fill_in 'item_desired_stock', with: 4
  fill_in 'item_actual_stock', with: 2

  find('*[type=submit]').click
end

Then /^I should see new item in stock list$/ do
  within 'table#items' do
    page.has_content?('Llauna d\'olives').must_equal true
  end
end

Given /^I am at edit item page$/ do
  visit edit_user_item_path(@current_user.items.first)
end

When /^I fullfill edit form$/ do
  select I18n.t('categories.snack'), from: 'item_category'
  fill_in 'item_short_description', with: 'Llauna d\'olives'
  fill_in 'item_desired_stock', with: 10
  fill_in 'item_actual_stock', with: 7

  find('*[type=submit]').click
end

Then /^I should see modifications done in this item$/ do
  within 'table#items tr#item_1.snack' do
    page.has_content?('Llauna d\'olives').must_equal true
    page.has_content?('10').must_equal true
    page.has_content?('7').must_equal true
  end
end

When /^I delete a stock item$/ do
  @first_item = @current_user.items.first
  click_link I18n.t('user.items.item.actions.delete')
end

Then /^I should not see this item in stock list$/ do
  within 'table#items' do
    page.has_content?(@first_item.short_description).must_equal false
  end
end

Given /^I click to edit an item$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be at this item edit page$/ do
  pending # express the regexp above with the code you wish you had
end
