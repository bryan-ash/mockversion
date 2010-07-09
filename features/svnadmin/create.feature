@announce
Feature: svnadmin create

  Background:
    Given mockversion is loaded

  Scenario: A directory is created for data storage
    When I run "svnadmin create repo"
    Then the following directories should exist:
      | .mockversion |
