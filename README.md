# README

This is a tool to get Vrbo listing information. The README file will help you configure and use this tool.
If you have any question, please contact to Xuchang Zhan ASAP.
----------------------------------------------------
### Index
* [MySQL](#MySQL)
* [Ruby on Rails](#Ruby-on-Rails)
* [Usage](#Usage)
----------------------------------------------------

### MySQL
#### MySQL Download:
All Vrbo listing information is stored in a **MySQL** database. If you want to use the tool, 
you have to download MySQL database at first. 
Please visit [MySQL Server Download Page](https://dev.mysql.com/downloads/mysql/).
I recommend to download DMG archive for MAC OS and MySQL Installer for Windows if you have not
used MySQL before.

Having downloaded proper files, please refer to [MySQL Installation Guide](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/).
However, installing successfully does not mean that your MySQL server starts. Please read 
the installation guide of your operating system; it will tell you whether the server starts
and how to start. 

#### Vrbo Data Import
Vrbo listing database has been exported as a mysqldump file. If you are interested in what is
mysqldump, you can visit [MySQL backup and restore](https://www.sqlshack.com/how-to-backup-and-restore-mysql-databases-using-the-mysqldump-command/)
for more details. You should download vrbo_database.sql file from [Holidale Vrbo-statistics](https://bitbucket.org/holidale/vrbo-statistics/downloads/).

Having downloaded sql file, you have to create a database with name "vrbo_database"
using your Mysql server at first.
Run following code on your terminal:
```xml
$ mysql
mysql> create database vrbo_database;
```
Then, import Vrbo database:
```xml
mysql -u root -p vrbo_database < {path_to_sql_file}/vrbo_database.sql
```
If there is no error in this process, you have got all data of Vrbo listings. You even 
do not need to get listing information using my website if you are familiar with sql
query.

### Ruby on Rails 
My website application is developed using Ruby on Rails framework. 
You do not need to understand how to use it. The thing is that you have to configure 
development environment to run my app. 

#### Git
To get my app code conveniently, install git on your PC. Then run:
```xml
git clone https://Xuchang_Zhan@bitbucket.org/holidale/vrbo-statistics.git
```
