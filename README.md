Moe Jabbie~

# Junk Removal Business Database Project

This project presents the EER diagram for a junk removal business database. The design includes five main entities: Customer, Employee, Job, Junk_Item, and Payment. Primery Keys uniquely identify records, while foreign keys establish relationships to maitain data integrity. The 1 to many relationships ensure that each customer can have multiple jobs, each employee can be assigned multiple jobs, each job can include junk items, and each job can have multiple payments.


The main design challenge was structuring the job entity to connect customers, employees, junk items, and payments efficiently while avoiding redundant data. By clearly separating Junk_Item and Payment into their own entities, the disign supports flexible operations like partial payments and detailed ttracking of items per job. this structure provides a scalable, maintainable database suitable for managing operations, tacking revenue, and generating reports efficiently.  




