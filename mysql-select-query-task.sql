/**

-- Users Table

-- Create the User table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the Role table
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

-- Create the Address table
CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    country VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Category table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Create the Supplier table
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_email VARCHAR(255)
);

-- Create the Product table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Create the Order table
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the OrderItem table
CREATE TABLE OrderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create the Payment table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

-- Create the Invoice table
CREATE TABLE Invoice (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    invoice_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

-- Create the RoleAssignment table
CREATE TABLE RoleAssignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create the Review table
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Wishlist table
CREATE TABLE Wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create the Cart table
CREATE TABLE Cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the CartItem table
CREATE TABLE CartItem (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create the Shipment table
CREATE TABLE Shipment (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    tracking_number VARCHAR(255),
    carrier VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

-- Create the Coupon table
CREATE TABLE Coupon (
    coupon_id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL,
    expiry_date DATETIME
);

-- Create the ProductImage table
CREATE TABLE ProductImage (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create the Notification table
CREATE TABLE Notification (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the ReturnRequest table
CREATE TABLE ReturnRequest (
    return_id INT AUTO_INCREMENT PRIMARY KEY,
    order_item_id INT,
    request_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    reason TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (order_item_id) REFERENCES OrderItem(order_item_id)
);


-- Insert data into User
INSERT INTO User (username, email, password, created_at) VALUES
('john_doe', 'john.doe@example.com', 'password123', NOW()),
('jane_smith', 'jane.smith@example.com', 'password456', NOW()),
('alice_jones', 'alice.jones@example.com', 'password789', NOW()),
('bob_brown', 'bob.brown@example.com', 'password000', NOW()),
('charlie_davis', 'charlie.davis@example.com', 'password111', NOW());

-- Insert data into Role
INSERT INTO Role (role_name) VALUES
('Admin'),
('Customer'),
('Seller'),
('Support'),
('Manager');

-- Insert data into Address
INSERT INTO Address (user_id, street, city, state, postal_code, country) VALUES
(1, '123 Main St', 'Anytown', 'CA', '90210', 'USA'),
(2, '456 Elm St', 'Othertown', 'TX', '73301', 'USA'),
(3, '789 Oak St', 'Sometown', 'FL', '33101', 'USA'),
(4, '101 Pine St', 'Newtown', 'NY', '10001', 'USA'),
(5, '202 Maple St', 'Oldtown', 'IL', '60601', 'USA');

-- Insert data into Category
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Books'),
('Clothing'),
('Home & Kitchen'),
('Toys');

-- Insert data into Supplier
INSERT INTO Supplier (supplier_name, contact_name, contact_email) VALUES
('TechCorp', 'Alice Williams', 'alice@techcorp.com'),
('BookWorld', 'Bob Johnson', 'bob@bookworld.com'),
('FashionInc', 'Charlie Green', 'charlie@fashioninc.com'),
('HomeGoods', 'David Smith', 'david@homegoods.com'),
('ToyLand', 'Emily Brown', 'emily@toyland.com');

-- Insert data into Product
INSERT INTO Product (product_name, category_id, supplier_id, price, stock_quantity) VALUES
('Laptop', 1, 1, 999.99, 50),
('Novel', 2, 2, 19.99, 100),
('T-Shirt', 3, 3, 9.99, 200),
('Coffee Maker', 4, 4, 49.99, 75),
('Toy Car', 5, 5, 14.99, 150);

-- Insert data into Order
INSERT INTO `Order` (user_id, order_date, status) VALUES
(1, NOW(), 'Pending'),
(2, NOW(), 'Shipped'),
(3, NOW(), 'Delivered'),
(4, NOW(), 'Cancelled'),
(5, NOW(), 'Pending');

-- Insert data into OrderItem
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(2, 2, 3, 59.97),
(3, 3, 2, 19.98),
(4, 4, 1, 49.99),
(5, 5, 5, 74.95);

-- Insert data into Payment
INSERT INTO Payment (order_id, payment_date, amount) VALUES
(1, NOW(), 999.99),
(2, NOW(), 59.97),
(3, NOW(), 19.98),
(4, NOW(), 49.99),
(5, NOW(), 74.95);

-- Insert data into Invoice
INSERT INTO Invoice (order_id, invoice_date, total_amount) VALUES
(1, NOW(), 999.99),
(2, NOW(), 59.97),
(3, NOW(), 19.98),
(4, NOW(), 49.99),
(5, NOW(), 74.95);

-- Insert data into RoleAssignment
INSERT INTO RoleAssignment (user_id, role_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert data into Review
INSERT INTO Review (product_id, user_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Excellent laptop!', NOW()),
(2, 2, 4, 'Great read, but a bit long.', NOW()),
(3, 3, 3, 'Average quality.', NOW()),
(4, 4, 2, 'Not as good as expected.', NOW()),
(5, 5, 5, 'My child loves this toy.', NOW());

-- Insert data into Wishlist
INSERT INTO Wishlist (user_id, product_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

-- Insert data into Cart
INSERT INTO Cart (user_id, created_at) VALUES
(1, NOW()),
(2, NOW()),
(3, NOW()),
(4, NOW()),
(5, NOW());

-- Insert data into CartItem
INSERT INTO CartItem (cart_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(5, 5, 4);

-- Insert data into Shipment
INSERT INTO Shipment (order_id, shipment_date, tracking_number, carrier) VALUES
(1, NOW(), 'TRACK12345', 'FedEx'),
(2, NOW(), 'TRACK67890', 'UPS'),
(3, NOW(), 'TRACK11223', 'USPS'),
(4, NOW(), 'TRACK44556', 'DHL'),
(5, NOW(), 'TRACK77889', 'FedEx');

-- Insert data into Coupon
INSERT INTO Coupon (code, discount_amount, expiry_date) VALUES
('SAVE10', 10.00, DATE_ADD(NOW(), INTERVAL 30 DAY)),
('SUMMER20', 20.00, DATE_ADD(NOW(), INTERVAL 60 DAY)),
('FALL15', 15.00, DATE_ADD(NOW(), INTERVAL 90 DAY)),
('WINTER25', 25.00, DATE_ADD(NOW(), INTERVAL 120 DAY)),
('SPRING5', 5.00, DATE_ADD(NOW(), INTERVAL 15 DAY));

-- Insert data into ProductImage
INSERT INTO ProductImage (product_id, image_url, alt_text) VALUES
(1, 'http://example.com/images/laptop.jpg', 'Laptop'),
(2, 'http://example.com/images/novel.jpg', 'Novel'),
(3, 'http://example.com/images/tshirt.jpg', 'T-Shirt'),
(4, 'http://example.com/images/coffeemaker.jpg', 'Coffee Maker'),
(5, 'http://example.com/images/toycar.jpg', 'Toy Car');

-- Insert data into Notification
INSERT INTO Notification (user_id, message, created_at, is_read) VALUES
(1, 'Your order has been shipped.', NOW(), FALSE),
(2, 'New discount available on electronics.', NOW(), TRUE),
(3, 'Product review approval required.', NOW(), FALSE),
(4, 'Reminder: Your coupon is about to expire.', NOW(), TRUE),
(5, 'Your cart has been updated.', NOW(), FALSE);

-- Insert data into ReturnRequest
INSERT INTO ReturnRequest (order_item_id, request_date, reason, status) VALUES
(1, NOW(), 'Defective item', 'Pending'),
(2, NOW(), 'Incorrect size', 'Approved'),
(3, NOW(), 'Changed my mind', 'Rejected'),
(4, NOW(), 'Not as described', 'Pending'),
(5, NOW(), 'Found a better price', 'Approved');


## Task 1: List all users who have made at least one order.
SELECT DISTINCT u.user_id, u.username, u.email
FROM User u
JOIN `Order` o ON u.user_id = o.user_id;

## Task 2: Find the top 5 most expensive products in the store.
SELECT product_name, price
FROM Product
ORDER BY price DESC
LIMIT 5;

## Task 3: Retrieve all orders placed by a specific user (e.g., user_id = 1).
SELECT o.order_id, o.order_date, o.status
FROM `Order` o
WHERE o.user_id = 1;

## Task 4: Calculate the total revenue from all completed orders.
SELECT SUM(p.amount) AS total_revenue
FROM Payment p
JOIN `Order` o ON p.order_id = o.order_id
WHERE o.status = 'Completed';

## Task 5: List all products that are low in stock (e.g., stock_quantity < 10).
SELECT product_name, stock_quantity
FROM Product
WHERE stock_quantity < 10;

## Task 6: Get all reviews for a specific product (e.g., product_id = 2).
SELECT r.review_id, u.username, r.rating, r.comment, r.review_date
FROM Review r
JOIN User u ON r.user_id = u.user_id
WHERE r.product_id = 2;

## Task 7: Find users who have items in their cart but have not placed an order yet.
SELECT DISTINCT u.user_id, u.username
FROM User u
JOIN Cart c ON u.user_id = c.user_id
LEFT JOIN `Order` o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

## Task 8: Get the total number of items in each user's cart.
SELECT c.user_id, COUNT(ci.cart_item_id) AS total_items
FROM Cart c
JOIN CartItem ci ON c.cart_id = ci.cart_id
GROUP BY c.user_id;

## Task 9: Retrieve all active coupons with their discount amount and expiry date.
SELECT code, discount_amount, expiry_date
FROM Coupon
WHERE expiry_date > NOW();

## Task 10: Find all users who have received a notification that is unread.
SELECT DISTINCT u.user_id, u.username, n.message
FROM User u
JOIN Notification n ON u.user_id = n.user_id
WHERE n.is_read = FALSE;


## Task 11: Get the average rating of each product.
SELECT p.product_name, AVG(r.rating) AS average_rating
FROM Product p
LEFT JOIN Review r ON p.product_id = r.product_id
GROUP BY p.product_name;

## Task 12: Find the most popular product based on the number of times it has been reviewed.
SELECT p.product_name, COUNT(r.review_id) AS review_count
FROM Product p
JOIN Review r ON p.product_id = r.product_id
GROUP BY p.product_name
ORDER BY review_count DESC
LIMIT 1;

## Task 13: List all orders with their associated products and quantities for a given date range.
SELECT o.order_id, p.product_name, oi.quantity
FROM `Order` o
JOIN OrderItem oi ON o.order_id = oi.order_id
JOIN Product p ON oi.product_id = p.product_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31';


## Task 14: Identify users who have never written a review.
SELECT u.user_id, u.username
FROM User u
LEFT JOIN Review r ON u.user_id = r.user_id
WHERE r.review_id IS NULL;

## Task 15: Retrieve the top 3 most popular categories based on the number of products.
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM Category c
JOIN Product p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC
LIMIT 3;

## Task 16: Find all products that are eligible for a discount coupon.
SELECT DISTINCT p.product_name
FROM Product p
JOIN Wishlist w ON p.product_id = w.product_id
JOIN Coupon c ON c.code = 'SAVE10'; -- Example coupon code

## Task 17: Get a list of all addresses for users who have placed orders in the last 30 days.
SELECT DISTINCT a.street, a.city, a.state, a.postal_code, a.country
FROM Address a
JOIN `Order` o ON a.user_id = o.user_id
WHERE o.order_date >= NOW() - INTERVAL 30 DAY;


## Task 18: Calculate the total amount spent by each user.
SELECT u.user_id, u.username, SUM(p.amount) AS total_spent
FROM User u
JOIN `Order` o ON u.user_id = o.user_id
JOIN Payment p ON o.order_id = p.order_id
GROUP BY u.user_id, u.username;


## Task 19: Find users who have a cart but have not added items to it.
SELECT u.user_id, u.username
FROM User u
JOIN Cart c ON u.user_id = c.user_id
LEFT JOIN CartItem ci ON c.cart_id = ci.cart_id
WHERE ci.cart_item_id IS NULL;


## Task 20: Generate a summary report of order statuses and their counts.
SELECT status, COUNT(*) AS status_count
FROM `Order`
GROUP BY status;





