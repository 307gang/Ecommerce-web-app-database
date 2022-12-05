create table users(
	`uuid` varchar(6),
    `username` varchar(100) unique not null,
    `password` varchar(100) not null,
    `admin` boolean not null,
    
    primary key (`uuid`)
);

create table customers(
    `uuid` varchar(6),
    `full_name` nvarchar(100),
    `email` varchar(200),
    `phone_number` varchar(11),
    `address` varchar(6),
    `create_date` date,
    `user_avt` varchar(200),
    `banned` boolean,

    primary key (`uuid`),
    foreign key (`uuid`) references users(`uuid`)
);

create table admins(
    `uuid` varchar(6),
    `full_name` nvarchar(100),
    `email` varchar(200),
    `phone_number` varchar(11),

    primary key (`uuid`),
    foreign key (`uuid`) references users(`uuid`)
); 

create table brands(
    `brand_id` varchar(4),
    `brand_name` varchar(100),
    `create_date` date,

    primary key (`brand_id`)
);

create table products(
    `product_id` varchar(6),
    `product_name` varchar(100),
    `brand_id` varchar(4),
    `description` text,
    `created_date` date,
    `price` float,
    `product_image` varchar(200),
    `product_stock` int, 
    `hidden` boolean,

    primary key (`product_id`),
    foreign key(`brand_id`) references brands(`brand_id`)
);

create table product_image( -- bảng ảnh phụ sản phẩm
    `product_id` varchar(6),
    `image_link` varchar(200),

    primary key (`product_id`, `image_link`),
    foreign key (`product_id`) references products(`product_id`)
);

create table orders(
	`order_id` varchar(4),
    `order_name` varchar(100),
    `description` text,
    `customer_id` varchar(6),
    `create_date` date,

    primary key (`order_id`),
    foreign key(`customer_id`) references customers(`uuid`)
); 

create table categories(
    `category_id` varchar(4),
    `category_name` varchar(100),

    primary key (`category_id`)
);

create table category_product (
    `category_id` varchar(4),
    `product_id` varchar(6),

    primary key (`category_id`, `product_id`),
    foreign key (`category_id`) references categories(`category_id`),
    foreign key (`product_id`) references products(`product_id`)

);

create table order_product(
	`order_id` varchar(4),
    `product_id` varchar(4),
    `product_quantity` int,
    `product_size` varchar(2),

    primary key (`order_id`, `product_id`),
    foreign key (`order_id`) references orders(`order_id`),
    foreign key (`product_id`) references products(`product_id`)
);

insert into brands ( `brand_id`,`brand_name` ,`create_date`) values
('1','Adidas','22/02/2022'),
('2','Nike','22/02/2022'),
('3','Zara','22/02/2022'),
('4','Viettien','22/02/2022')

insert into products (`product_id`,`product_name` , `brand_id`, `description`, `created_date`, `price`, `product_image`, `product_stock`, `hidden`) 
values
('001','Áo thun xanh mint','1','Hàng Việt Nam dành cho người Việt nam chất lượng cao','22/10/2022','300.000 VNĐ','/asset/img/ao-thun1.jpg','20','1'),
('002','Quần jeans đen','1','danh cho nguoi gay','22/10/2022','350.000 VNĐ','/asset/img/quan-jean1.jpg','20','1'),
('003','Váy JK xanh biển','2','Được may từ vải cotton chất lượng cao','22/10/2022','200.000 VNĐ','/asset/img/vay-jk1.jpg','20','1'),
('004','Váy Sunflower','2','Váy sịn sò mặc vào là xinh nhé','22/10/2022','950.000 VNĐ','/asset/img/dam-hoa.jpg','20','1'),
('005','Quần short xám','3','Nam nữ đều có thể mặc','22/10/2022','230.000 VNĐ','/asset/img/quan-short1.jpg','20','1'),
('006','Áo blazer nâu','3','Mặc cùng quần âu và áo sơ mi là hết sảy','22/10/2022','500.000 VNĐ','/asset/img/ao-blazer1.jpg','20','1'),
('007','Áo Vest xanh biển','3','Trông bạn sẽ hòa mình vào biển cả nếu mặc chiếc vest này','22/10/2022','1.500.000 VNĐ','/asset/img/ao-vest1.jpg','20','1')