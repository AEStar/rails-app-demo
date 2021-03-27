# README

This is a demo program for ruby on rails. Please log in at first. Otherwise, you cannot do operations to the PMS even though you know routes.

The reservation system is designed as one guest to one room. You can reserve or change room by editing the status of the guest. Once the guest is removed, its reserved room will be cancelled automatically. By the way, you cannot change the assigned state of a room directly.

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
6. status:integer (reserved room id, if do not reserve any room, default value is -1.)

### Use Devise for Identity Management.
