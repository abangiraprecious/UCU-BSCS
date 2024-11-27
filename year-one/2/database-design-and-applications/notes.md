###### Primary Key
- a column or set of columns that uniquely identifies each row in the table. 
- a table can only have one PK, which can be made up of one more fields
- must contain unique values, should not be null and should bever change


###### Information Needs
Information Management Cycle

Definition:
A cycle through which we are able to get and handle our Information.
There are six major steps (IIAAOII):
1. Identification of information needs
2. Acquisition and creation of information
3. Analysis and interpretation of information 
4. Organizing and storage of information
5. Information access and dessemination
6. Information use


# Managing Security in a Database System

### Authentication
**Authentication** ensures that only authorized users can access the system. It's a vital first line of defense. Key practices include:
- **Username and Password**: Enforce strong password policies.
- **Multi-Factor Authentication (MFA)**: Adds an extra verification layer.
- **Biometric Authentication**: Uses fingerprint, facial recognition, etc.
- **OAuth and Single Sign-On (SSO)**: Allows login with trusted provider credentials.

### Encryption to Maintain Privacy
**Encryption** secures data in a way that only authorized parties can read it:
- **Data-at-Rest Encryption**: Encrypts stored data (e.g., AES for databases).
- **Data-in-Transit Encryption**: Secures data in movement (e.g., TLS).
- **End-to-End Encryption**: Encrypts data from sender to receiver without intermediate decryption.
- **Key Management**: Securely handles encryption keys, often using Hardware Security Modules (HSMs).

### Give Different Privileges to Respective Users
**Access Control** manages data access based on user roles:
- **Role-Based Access Control (RBAC)**: Assigns permissions by role.
- **Least Privilege Principle**: Grants minimal necessary access.
- **Segregation of Duties (SoD)**: Splits tasks to prevent fraud/errors.
- **Audit Trails and Logs**: Records who accessed what data and when for monitoring.

### Backup Data to Avoid Data Loss
**Data Backups** help in recovering data after incidents:
- **Regular Backups**: Schedule frequent backups.
- **Offsite and Cloud Storage**: Store backups in multiple locations.
- **Automated Backup Systems**: Reduce human error risk.
- **Disaster Recovery Plan (DRP)**: Develop and test a comprehensive recovery plan.

### Summary
Implement these measures to secure your database against unauthorized access, data breaches, and data loss through robust authentication, encryption, access control, and regular backups.
Y