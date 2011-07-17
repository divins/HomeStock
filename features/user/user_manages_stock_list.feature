Feature: User manages stock list
  As a user
  I want to manage stock list
  So I can list and edit stock items

  Background:
    Given I am logged in as a user

  Scenario: User lists own stock items
    Given I have some stock items
    And another user with some stock items exists
    When I am at stock list
    Then I should see those items in my stock list
    And I should not see the other user items

  Scenario: User adds stock item
    Given I am at adding stock item page
    When I fullfill new form
    Then I should see new item in stock list

  Scenario: User edits stock item
    Given I have some stock items
    And I am at edit item page
    When I fullfill edit form
    Then I should see modifications done in this item

  Scenario: User deletes stock item
    Given I have some stock items
    And I am at stock list
    When I delete a stock item
    Then I should not see this item in stock list

  Scenario: User navigates to item edit page
    Given I have some stock items
    And I click to edit an item
    Then I should be at this item edit page
