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
