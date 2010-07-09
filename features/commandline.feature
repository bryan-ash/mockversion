@announce
Feature: Command line

  In order to demonstrate tools features during development
  As a SVN based tool developer
  I want a mock svn executable

  Scenario: Original svn is used before mockversion is loaded
    When I run "svn --version"
    Then the output should not contain "MockVersion"

    When I run "svnadmin --version"
    Then the output should not contain "MockVersion"

  Scenario Outline: mockversion talks once it is loaded
    Given mockversion is loaded
    When I run "<command> --version"
    Then the output should match /MockVersion \d+\.\d+\.\d+/
  Examples:
    | command  |
    | svn      |
    | svnadmin |

  Scenario Outline: help is provided in the absence of a command
    Given mockversion is loaded
    When I run "<command>"
    Then the output should contain a help message
  Examples:
    | command  |
    | svn      |
    | svnadmin |

  Scenario Outline: help is provided for a help command
    Given mockversion is loaded
    When I run "<command> help"
    Then the output should contain a help message
  Examples:
    | command  |
    | svn      |
    | svnadmin |
