![Ref. Picture](<Screenshot 2024-11-26 at 20.52.19.png>)

Question 1: Wellmeadows Hospital Patient Medication Form
a. Identifying Functional Dependencies
Functional dependencies are relationships between columns in a database, where one column’s value determines another column’s value. Here's what I observe from the provided form:

Patient Number (PID) determines: Full Name, Ward Number, Bed Number, Ward Name.

Drug Number determines: Name, Description, Dosage.

Combination of Patient Number and Drug Number determines: Method of Admin, Units per Day, Start Date, Finish Date.

b. Normalizing Data
First Normal Form (1NF):

Goal: Ensure each cell contains only atomic values; each record is unique.

Form (1NF):
| PID    | Full Name       | Ward Number | Bed Number | Ward Name | Drug Number | Drug Name     | Description | Dosage   | Method of Admin | Units per Day | Start Date | Finish Date |
|--------|------------------|-------------|------------|-----------|-------------|---------------|-------------|----------|-----------------|---------------|------------|-------------|
| PID034 | Robert MacDonald | 11          | 84         | Orthopaedic| 10223       | Morphine      | Pain Killer | 10mg/ml  | Oral            | 50            | 24/03/13   | 24/04/14    |
| PID034 | Robert MacDonald | 11          | 84         | Orthopaedic| 10234       | Tetracycline  | Antibiotic  | 0.5mg/ml | IV              | 10            | 24/03/13   | 17/04/13    |
| PID034 | Robert MacDonald | 11          | 84         | Orthopaedic| 10223       | Morphine      | Pain Killer | 10mg/ml  | Oral            | 10            | 25/04/14   | 02/05/15    |


Second Normal Form (2NF):

Goal: Remove partial dependencies; non-key attributes must fully depend on the primary key.

Tables (2NF):
- **Patients:** 
  | PID    | Full Name       | Ward Number | Bed Number | Ward Name |
  |--------|------------------|-------------|------------|-----------|
  | PID034 | Robert MacDonald | 11          | 84         | Orthopaedic|

- **Drugs:**
  | Drug Number | Drug Name     | Description | Dosage   |
  |-------------|---------------|-------------|----------|
  | 10223       | Morphine      | Pain Killer | 10mg/ml  |
  | 10234       | Tetracycline  | Antibiotic  | 0.5mg/ml |

- **Medication:**
  | PID    | Drug Number | Method of Admin | Units per Day | Start Date | Finish Date |
  |--------|-------------|-----------------|---------------|------------|-------------|
  | PID034 | 10223       | Oral            | 50            | 24/03/13   | 24/04/14    |
  | PID034 | 10234       | IV              | 10            | 24/03/13   | 17/04/13    |
  | PID034 | 10223       | Oral            | 10            | 25/04/14   | 02/05/15    |

Third Normal Form (3NF):

Goal: Remove transitive dependencies; non-key attributes should only depend on the primary key.

Tables (3NF):
- **Patients:**
  | PID    | Full Name       | Ward Number | Bed Number | Ward Name |
  |--------|------------------|-------------|------------|-----------|
  | PID034 | Robert MacDonald | 11          | 84         | Orthopaedic|

- **Drugs:**
  | Drug Number | Drug Name     | Description | Dosage   |
  |-------------|---------------|-------------|----------|
  | 10223       | Morphine      | Pain Killer | 10mg/ml  |
  | 10234       | Tetracycline  | Antibiotic  | 0.5mg/ml |

- **Medication:**
  | PID    | Drug Number | Method of Admin | Units per Day | Start Date | Finish Date |
  |--------|-------------|-----------------|---------------|------------|-------------|
  | PID034 | 10223       | Oral            | 50            | 24/03/13   | 24/04/14    |
  | PID034 | 10234       | IV              | 10            | 24/03/13   | 17/04/13    |
  | PID034 | 10223       | Oral            | 10            | 25/04/14   | 02/05/15    |

- **Wards:**
  | Ward Number | Ward Name |
  |-------------|-----------|
  | 11          | Orthopaedic|

Question 2: Normalizing Manager-Employee Table
Initial Table
| managerID | managerName | area | employeeID | employeeName | sectorID | sectorName     |
|-----------|-------------|------|------------|--------------|----------|----------------|
| 1         | Adam A.     | East | 1          | David D.     | 4        | Finance        |
| 1         | Adam A.     | East | 2          | Eugene E.    | 3        | IT             |
| 2         | Betty B.    | West | 5          | George G.    | 2        | Security       |
| 2         | Betty B.    | West | 3          | Henry H.     | 1        | Administration |
| 2         | Betty B.    | West | 4          | Ingrid I.    | 4        | Finance        |
| 3         | Carl C.     | North| 7          | James J.     | 1        | Administration |
| 3         | Carl C.     | North| 6          | Katy K.      | 4        | Finance        |

First Normal Form (1NF)
Ensure each cell contains atomic values and remove duplications.

| managerID | managerName | area | employeeID | employeeName | sectorID | sectorName     |
|-----------|-------------|------|------------|--------------|----------|----------------|
| 1         | Adam A.     | East | 1          | David D.     | 4        | Finance        |
| 1         | Adam A.     | East | 2          | Eugene E.    | 3        | IT             |
| 2         | Betty B.    | West | 5          | George G.    | 2        | Security       |
| 2         | Betty B.    | West | 3          | Henry H.     | 1        | Administration |
| 2         | Betty B.    | West | 4          | Ingrid I.    | 4        | Finance        |
| 3         | Carl C.     | North| 7          | James J.     | 1        | Administration |
| 3         | Carl C.     | North| 6          | Katy K.      | 4        | Finance        |


Second Normal Form (2NF)
Remove partial dependencies by splitting the table into smaller tables.
- **Managers:**
  | managerID | managerName | area |
  |-----------|-------------|------|
  | 1         | Adam A.     | East |
  | 2         | Betty B.    | West |
  | 3         | Carl C.     | North|

- **Employees:**
  | employeeID | employeeName | managerID |
  |------------|--------------|-----------|
  | 1          | David D.     | 1         |
  | 2          | Eugene E.    | 1         |
  | 5          | George G.    | 2         |
  | 3          | Henry H.     | 2         |
  | 4          | Ingrid I.    | 2         |
  | 7          | James J.     | 3         |
  | 6          | Katy K.      | 3         |

- **Sectors:**
  | sectorID | sectorName     |
  |----------|----------------|
  | 4        | Finance        |
  | 3        | IT             |
  | 2        | Security       |
  | 1        | Administration |

Third Normal Form (3NF)
Remove transitive dependencies.

- **Managers:**
  | managerID | managerName | area |
  |-----------|-------------|------|
  | 1         | Adam A.     | East |
  | 2         | Betty B.    | West |
  | 3         | Carl C.     | North|

- **Employees:**
  | employeeID | employeeName | managerID | sectorID |
  |------------|--------------|-----------|----------|
  | 1          | David D.     | 1         | 4        |
  | 2          | Eugene E.    | 1         | 3        |
  | 5          | George G.    | 2