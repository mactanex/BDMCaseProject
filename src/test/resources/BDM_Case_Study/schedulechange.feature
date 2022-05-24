Feature: Create daily Schedule
    As a manager I want to create a daily scehdule for employees with the right 
    skills and time units available to work on jobs
    Such that they can be solved.

    Scenario Outline: Create Scehdule with one job and one employee
    Given A job with a unique <id> and a required "<skill>", <skill_level>, <time_units>, and <deadline> exists in the system.
    Given A employee is added to the system, with a unique <employee_id> and a "<employee_skill>", <employee_skill_level>, and <employee_time_units> exists in the system.
    When The system creates a schedule.
    Then The job is scheduled "<result>".

   Examples:
    | id         | skill      | skill_level | time_units | deadline | employee_id  | employee_skill      | employee_skill_level | employee_time_units | result        | 
    | 1          | Mechanical | 3           | 6          | 1        |  1           | Mechanical          | 5                    | 8                   | Satisfied     |
    | 2          | Software   | 2           | 4          | 1        |  2           | Software            | 1                    | 4                   | Not satisfied |
    | 3          | Mechanical | 2           | 4          | 1        |  3           | Software            | 2                    | 4                   | Not satisfied |
    | 4          | Software   | 2           | 4          | 2        |  4           | Software            | 2                    | 4                   | Satisfied     |
    | 5          | Mechanical | 3           | 6          | 0        |  5           | Mechanical          | 4                    | 4                   | Not satisfied |
    | 6          | Mechanical | 3           | 6          | 2        |  5           | Mechanical          | 4                    | 4                   | Satisfied     |
    | 7          | Mechanical | 3           | 9          | 1        |  5           | Mechanical          | 4                    | 4                   | Not satisfied |


    Scenario Outline: Create Scehdule with several jobs and employees
    Given A set of "<jobs>"  exist in the system.
    Given A set of "<employees>" exist in the system.
    When The system creates a schedule.
    Then The job is scheduled "<result>".

   Examples:
    | jobs                                                                                |  employees                                                                    | result        |
    | {1,Mechanical,2,4,1},{2,Software,4,6,1}                                             |  {1,Mechanical,3,4},{2,Software,4,6}                                          | Satisfied     |
    | {1,Mechanical,2,4,1},{2,Software,4,2,1}                                             |  {1,Mechanical,3,6},{1,Software,4}                                            | Satisfied     |
    | {1,Mechanical,2,22,1}                                                               |  {1,Mechanical,3,16},{2,Mechanical,4,14}                                      | Satisfied     |
    | {1,Mechanical,2,7,1}                                                                |  {1,Mechanical,3,6},{2,Mechanical,4,3}                                        | Satisfied     |
    | {1,Mechanical,2,4,1},{2,Software,4,6,1}                                             |  {1,Mechanical,3,5},{2,Software,2,6}                                          | Not satisfied |
    | {1,Mechanical,2,4,1},{2,Software,4,6,1},{3,Mechanical,2,4,1},{4,Software,4,6,1}     |  {1,Mechanical,3,5},{2,Software,4,6},{3,Mechanical,3,5},{4,Software,4,6}      | Satisfied     |
    | {1,Mechanical,2,4,0},{2,Software,4,6,0},{3,Mechanical,2,4,0},{4,Software,4,6,0}     |  {1,Mechanical,3,4},{2,Software,4,6}                                          | Not satisfied |
    | {1,Mechanical,2,4,1},{2,Software,4,6,1},{3,Mechanical,2,4,1},{4,Software,4,6,1}     |  {1,Mechanical,3,8},{2,Software,4,6},{3,Software,4,6}                         | Satisfied     |
    | {1,Mechanical,2,4,1},{2,Software,4,6,0},{3,Mechanical,2,4,0}                        |  {1,Mechanical,3,4},{2,Software,4,6}                                          | Satisfied     |
    | {1,Mechanical,2,4,2},{2,Software,4,6,1},{3,Mechanical,2,3,1}                        |  {1,Mechanical,3,3},{2,Software,4,6}                                          | Not satisfied |
