# README

This is a car rent system.

Need to login to use all the functions

There are three type of users.

superadmin dafu@gg.com password:dd  
admin      xiaohuang@gg.com password:xx  
user       wangcai@gg.com  password:ww

superadmin: when logging in as a superadmin, can use signup button on the left to create users and admins and will be directly logged in into the created account.  

Can view superadmins and admins by using profile button. Can edit and delete admins and users.
Have the total function the same as admins

admin: Can create users and admins the same way as superamins.  
Can see all the reservations and orders.  
Can see and manage all users and admins.   
Can see all the reservations and orders by profile button.


users: Can login and logout.Can reserve a car and checkout a car  
Can see and edit his own file  ,reservations and orders by "profile" button.
        


cars

new car (admin)  
1.License-plate number (a 7-digit string unique for each Car)  
2.Status: reserved, checked out, available  
3.Style (Coupe, Sedan or SUV)  
4.Other common attribute: location, model, manufacture, price, description, image, title"	"1.License-plate number (a 7-digit string unique for each Car)
	
edit car (admin)  
1.Edit the attribute of a car  

manage car (admin)  
1.Show the cars list for admin  
2.Show the user who has the car if its status is “Checked out” or “Reserved”"  

Checkout history of a car	1.In the car detail page, user can check the history of a car

reservation  

confirm reservation (admin&user)  
1.The user can select the checkout time for any time after current time  
2.The minimum rental period is 1 hour and the maximum is 10 hours, every rental unit is one hour  
3.If the user has unfinished reservation or order, the system will not allow new reservation"  

manage reservation (admin&user)  
1.The admin/user can index, edit, delete the reservations  
2.If the reservation is not checked out after 30 minutes, it will be calceled automatically  

edit reservation (admin&user)  
1.The admin/user can edit the reservation  

store  
index cars (customer)  
1.User can search cars using location or model or manufacturer or style or status  
2.If the status of one car is ""available"", the user can see the reserve button and check out button  

order  

checkout (admin&user) with reservation  
The admin/user can checkout the order with a previous reservation  

edit order(admin&user)  
The admin/user can edit the order  

show order (admin)  
The admin/ can show the order  

confirm order (user)  
The admin/user can confirm the order			

