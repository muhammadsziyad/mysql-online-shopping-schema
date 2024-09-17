

##  **Database Schema for "Big Shopping Online"**

Here’s a proposed schema for your "Big Shopping Online" project with a description for each table. This 
schema is designed to cover a comprehensive range of functionalities for an online shopping platform.

![enter image description 
here](https://www.plantuml.com/plantuml/png/dLPBRoCt3BxFhn1ywGDTe5qWbsAnM3TnKADv1Axxk0qK3MCBcP4caYQEKVI_Ln8LGkved7Xl93-9_4IHbBvOnuqRkhQglc4Ny20LCCVlMx0LA2VTdit-i61cZ5isU87zKp7sVP1gsR2VsV9cpJvzklljysTl3sR5E_3sF-Uhyr_dgsy_dfrzvn7ek6p7vfvRkzEc6IF207VGrDnvx6A-NgoNrulgtufOhNGBaPNn0h8AKe5LD1TevTxcJMF0skYGeum-ap9nsDnyYMRh380h7CZ76LkjumuAUT4UQ6kXcnpywSVeI0_AcVsHmvnxdnjjzl4q8Ybud5UjS1w2taZLxqFVjpALX4qAUaUjM1e4bUj3QEMuS6-WM4NJrEwCRWRX8hCUPIIMb08lH2O35z9rUNYW0jGRAI2KxU9yUJs_ylVs0_k8jwt5O_qqSEGRj-NyRqsJygg3XDoZ-Fxwm-MD9vut3bRQOBCZdlbg-d_ifOCEusDGhnA9f1UO85Z80-QsW1ocO3fb-TtoVUTbl5kKaLfIJk65Emf9ubrehgCybkfPIu6ZHwACF99o0e-qey33wT3-nzdG59nRApUAaXF77ISRaYFTlR-IWgEHEOyDpn9s63EA60hbGfXoEHmZm9rK6weHeRjm0A-l5ty70qOQfI-Z-9UqsrPQJCmkAKWpQIVaOuB_uUGrBarTa-9uwOGOnvuzYa1TYhwfIKajn4FiwriqVm2sigTgiqb11gYTr8oqfT05Xej7Nm6r6hfxCANnR8mS0tcwzD1hXScA8l94kS2INboQaTxOI1iVtSc6P0nUUcdsqwL8RzEouniS7fJwO45QKJofSt37O0f_Azwwsi6BEvAT6-taWnJSoPGZbHcGKcvvVnbtOAqdHgrQhkl0tzOU2Vj_kRszMinl3WUC6unQmTC0gOLDjDG6JSWGRGLkfJUB6AABKjLvFbOheZxvSD9tsK0RqnCgsLOX8-p3X_IB3FjcMsvdP8-iWhLlkO0Cm6aMa9sHBaDeS8ry2MwYKUzKPislBA061CZdu31CTBzYz4JuHQX1mvn6J-Lr69_-b7uDrcR4f1Bjq8H0z2qyN83ci20PFPvTKrWIlteo495gLaLiSf7D5k2RJXG9e3VQ0njGO7XCRURFhydB2jESH4_ZGPkCRdvDbDSSFkZgB676lLvOuHHadame7OVchOSRQNlknDQpt4ctdLLKA5Dkyj88YmQBjMY3nt3prHTGpT2rrNy0)

1.  **User**
**Purpose:** Stores information about the users of the system, including their login credentials and 
account details.
**Columns:**
	- user_id: Unique identifier for each user.
	-  username: The username of the user.
	-  email: The email address of the user.
	-  password: The hashed password of the user.
	-  created_at: Timestamp when the user account was created.

2. **Role**
**Purpose:** Defines different roles within the system, such as Admin or Customer, which help in managing 
permissions and access control.
**Columns:**
	-   role_id: Unique identifier for each role.
	-   role_name: Name of the role (e.g., Admin, Customer).

3. **Address**
**Purpose:** Stores addresses for users which can be used for shipping or billing purposes.
**Columns:**
	-   address_id: Unique identifier for each address.
	-   user_id: Reference to the User table.
	-   street: Street address.
	-   city: City.
	-   state: State.
	-   postal_code: Postal code.
	-   country: Country.

4. **Category**
**Purpose:** Organizes products into different categories to help users browse and search for items more 
easily.
**Columns:**
	-   category_id: Unique identifier for each category.
	-   category_name: Name of the product category.
5. **Supplier**
**Purpose:** Contains information about suppliers who provide products to the store.
**Columns:**
	-   supplier_id: Unique identifier for each supplier.
	-   supplier_name: Name of the supplier.
	-   contact_name: Name of the contact person at the supplier.
	-   contact_email: Email of the contact person.

6. **Product**
**Purpose:** Stores details about the products available for sale in the store.
**Columns:**
	-   product_id: Unique identifier for each product.
	-   product_name: Name of the product.
	-   category_id: Reference to the Category table.
	-   supplier_id: Reference to the Supplier table.
	-   price: Price of the product.
	-   stock_quantity: Quantity of the product in stock.

7. **Order**
**Purpose:** Records customer orders, including information about the customer and the order date.
**Columns:**
	-   order_id: Unique identifier for each order.
	-   user_id: Reference to the User table.
	-   order_date: Date and time when the order was placed.
	-   status: Status of the order (e.g., Pending, Shipped, Delivered).

8. **OrderItem**
**Purpose:** Details the individual items within an order, including quantity and price.
**Columns:**
	-   order_item_id: Unique identifier for each order item.
	-   order_id: Reference to the Order table.
	-   product_id: Reference to the Product table.
	-   quantity: Quantity of the product ordered.
	-   price: Price of the product at the time of order.

9. **Payment**
**Purpose:** Records payments made for orders, including payment amount and date.
**Columns:**

	-   payment_id: Unique identifier for each payment.
	-   order_id: Reference to the Order table.
	-   payment_date: Date and time when the payment was made.
	-   amount: Amount paid.

10. **Invoice**
**Purpose:** Generates invoices for orders, summarizing the total amount due and invoice date.
**Columns:**

	-   invoice_id: Unique identifier for each invoice.
	-   order_id: Reference to the Order table.
	-   invoice_date: Date and time when the invoice was generated.
	-   total_amount: Total amount of the invoice.

11. **RoleAssignment**
**Purpose:** Assigns roles to users, allowing for different levels of access and permissions within the 
system.
**Columns:**

	-   assignment_id: Unique identifier for each role assignment.
	-   user_id: Reference to the User table.
	-   role_id: Reference to the Role table.

12. **Review**
**Purpose:** Allows users to post reviews and ratings for products they have purchased, which helps other 
customers make informed decisions.
**Columns:**

	-   review_id: Unique identifier for each review.
	-   product_id: Reference to the Product table.
	-   user_id: Reference to the User table.
	-   rating: Rating given by the user (e.g., 1-5).
	-   comment: Review comment by the user.
	-   review_date: Date when the review was posted.

13. **Wishlist**
**Purpose:** Lets users save products they are interested in for future reference or potential purchase.
**Columns:**
	- wishlist_id: Unique identifier for each wishlist entry.
	- user_id: Reference to the User table.
	-  product_id: Reference to the Product table.

14. **Cart**
**Purpose:** Stores the items a user has added to their cart while shopping.
**Columns:**

	-   cart_id: Unique identifier for each cart.
	-   user_id: Reference to the User table.
	-   created_at: Date and time when the cart was created.

15. **CartItem**
**Purpose:** Details the items within a user's cart, including quantity and associated product.
**Columns:**

	-   cart_item_id: Unique identifier for each cart item.
	-   cart_id: Reference to the Cart table.
	-   product_id: Reference to the Product table.
	-   quantity: Quantity of the product in the cart.

16. **Shipment**
**Purpose:** Tracks shipment details for orders, including tracking number and carrier information.
**Columns:**

	-   shipment_id: Unique identifier for each shipment.
	-   order_id: Reference to the Order table.
	-   shipment_date: Date and time when the shipment was dispatched.
	-   tracking_number: Tracking number for the shipment.
	-   carrier: Carrier or shipping service used.

17. **Coupon**
**Purpose:** Manages discount coupons that users can apply to their orders for discounts.
**Columns:**

	-   coupon_id: Unique identifier for each coupon.
	-   code: Coupon code.
	-   discount_amount: Discount amount or percentage.
	-   expiry_date: Expiry date of the coupon.

18. **ProductImage**
**Purpose:** Stores URLs of product images for display on the website.
**Columns:**

	-   image_id: Unique identifier for each product image.
	-   product_id: Reference to the Product table.
	-   image_url: URL of the product image.
	-   alt_text: Alternative text for the image.

19. **Notification**
**Purpose:** Sends notifications to users about order status, promotions, or other important information.
**Columns:**

	-   notification_id: Unique identifier for each notification.
	-   user_id: Reference to the User table.
	-   message: Notification message.
	-   created_at: Date and time when the notification was created.
	-   is_read: Indicates if the notification has been read.

20. **ReturnRequest**
**Purpose:** Manages requests from users to return products, including reasons and status.
**Columns:**

	-   return_id: Unique identifier for each return request.
	-   order_item_id: Reference to the OrderItem table.
	-   request_date: Date and time when the return request was made.
	-   reason: Reason for the return request.
	-   status: Status of the return request (e.g., Pending, Approved, Rejected).
