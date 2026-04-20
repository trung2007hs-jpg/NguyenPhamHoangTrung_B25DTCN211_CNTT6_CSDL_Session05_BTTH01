CREATE TABLE Orders (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NULL COMMENT 'Khóa ngoại liên kết bảng Users. Cho phép NULL đối với đơn ảo do hệ thống tự sinh.',
    total_amount DECIMAL(15, 2) NOT NULL COMMENT 'Tổng giá trị thanh toán của đơn hàng.',
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING' COMMENT 'Trạng thái: PENDING, SUCCESS, CANCELLED, ...',
    note TEXT NULL COMMENT 'Ghi chú của khách hàng hoặc admin (VD: "giao gấp", "hàng dễ vỡ").',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian tạo đơn',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Thời gian cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 
    order_id,
    user_id,
    total_amount,
    status,
    note,
    created_at,
    CASE
        WHEN total_amount > 4000000 THEN 'Nguy hiểm'
        ELSE 'Bình thường'
    END AS Alert_Level
FROM Orders
WHERE 
    total_amount BETWEEN 2000000 AND 5000000
    AND status <> 'CANCELLED'
    AND (note LIKE '%gấp%' OR user_id IS NULL)
ORDER BY total_amount DESC
LIMIT 20 OFFSET 40;