Feature: User manages stock quantities
  As a user
  I want to manage item quantities
  So I could keep stock updated

  Background:
    Given I am logged in as a user

  Scenario: User sums one to item quantity
    Given I have some stock items
    And I am at stock list
    When I sum one to an item quantity
    Then I should see the last quantity plus one on this item

  Scenario: User substracts one from item quantity
    Given I have some stock items
    And I am at stock list
    When I subtract one from an item quantity
    Then I should see the last quantity minus one on this item
