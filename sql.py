import random

import mysql.connector             
from mysql.connector import Error  
from faker import Faker

Faker.seed(33422)
fake = Faker()

conn = mysql.connector.connect(host="@localhost", database="lib",
                               user="s5d2_snp", password="password")
cursor = conn.cursor()
  
row = [random.uniform.randint(1,100),fake.first_name(), random.randint(0,99),random.randint(0,99),random.randint(0,99), fake.date_of_birth(),random.randint(0,99),fake.first_name()]
cursor.execute(' \                                                                          
     INSERT INTO `BOOK` (Book_Id,TITLE,Language_Id,MRP,Publisher_Id,Published_Date,Volume,Status) \ 
     VALUES (%d,"%s", %d,%d,%d "%s",%d,"%s",);' % (row[0], row[1], row[2],row[3],row[4],row[5],row[6],row[7])

conn.commit()
