Feature: Create Employees
    As a manager I want to create employees with a set of skills and available time units
    Such that I schedule employees to solve jobs

Scenario Outline: Create employee
    Given An employee with a unique <id> and available <time_units> exist.
    When I add the employee in the system.
    Then The employee exists in the system.

   Examples:
    | id         | time_units |
    | 1          | 12         |
    | 2          | 6          |
    | 3          | 99         |
    | 4          | 1          |
    | 5          | 0          |


Scenario Outline: Add skill to employee
    Given An Employee with a unique <id> exists in the system.
    When I add a "<skill>" with a <skill_level> to the employee.
    Then The employee has the "<skill>" and <skill_level> in their set of skills.

    Examples:
    | id         | skill      | skill_level |
    | 1          | Mechanical | 3           |
    | 2          | Software   | 2           |
    | 3          | Chemical   | 1           |
    | 4          | Software   | 0           |
    | 5          | Chemical   | 5           |
    | 6          | Electrical | 4           |
    | 7          | Software   | 2           |

Scenario Outline: Add skill to employee with skills
    Given An Employee with a unique <id> and "<first_skill>" with <first_skill_level> exists in the system.
    When I add a "<skill>" with a <skill_level> to the employee.
    Then The employee has the "<skill>" and <skill_level> in their set of skills.
    Then The employee has <amount> number of skills in their set of skills.

    Examples:
    | id         | first_skill | first_skill_level | skill      | skill_level | amount |
    | 1          | Chemical    | 2                 | Mechanical | 3           | 2      |
    | 2          | Mechanical  | 5                 | Software   | 2           | 2      |
    | 3          | Software    | 1                 | Chemical   | 1           | 2      |
    | 4          | Electrical  | 0                 | Software   | 0           | 2      |
    | 5          | Mechanical  | 3                 | Chemical   | 5           | 2      |
    | 6          | Chemical    | 4                 | Electrical | 4           | 2      |
    | 7          | Electrical  | 3                 | Software   | 2           | 2      |


