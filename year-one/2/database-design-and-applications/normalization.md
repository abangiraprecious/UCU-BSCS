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


