# README

This is a demo program for ruby on rails.

## Resources:

**Rooms**:

1. id:integer (auto-generated)
2. address:string
3. price:integer
4. beds:integer
5. square:integer
6. assigned:boolean
   (not added due to lack data source: image:string; overview:text).

**Guests**:

1. id:integer (auto-generated)
2. first_name:string
3. last_name:string
4. email:string
5. phone:string
6. status:integer (related to room's id and assigned)

### Use Devise for Identity Management.
