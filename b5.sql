CREATE DATABASE CustomerSystem;
USE CustomerSystem;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    total_orders INT
);

INSERT INTO Users (user_name, total_orders) VALUES
('An', 600),
('Binh', 250),
('Cuong', 50),
('Dung', NULL);

-- Query phân loại
SELECT 
    user_name,
    CASE
        WHEN total_orders IS NULL THEN 'Bạc'
        WHEN total_orders > 500 THEN 'Kim Cương'
        WHEN total_orders >= 100 THEN 'Vàng'
        ELSE 'Bạc'
    END AS 'rank'
FROM Users;