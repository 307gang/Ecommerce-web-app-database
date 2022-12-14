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
('1','Adidas','2020/12/10'),
('2','Nike','2020/12/10'),
('3','Zara','2020/12/10'),
('4','Viettien','2020/12/10');

insert into products (`product_id`,`product_name` , `brand_id`, `description`, `created_date`, `price`, `product_image`, `product_stock`, `hidden`) values
('001','Áo thun xanh mint','1','Hàng Việt Nam dành cho người Việt nam chất lượng cao','2022/10/22','300','/asset/img/ao-thun1.jpg','20','1'),
('002','Quần jeans đen','1','danh cho nguoi gay','2022/10/22','350','/asset/img/quan-jean1.jpg','20','1'),
('003','Váy JK xanh biển','2','Được may từ vải cotton chất lượng cao','2022/10/22','200','/asset/img/vay-jk1.jpg','20','1'),
('004','Váy Sunflower','2','Váy sịn sò mặc vào là xinh nhé','2022/10/22','950','/asset/img/dam-hoa.jpg','20','1'),
('005','Quần short xám','3','Nam nữ đều có thể mặc','2022/10/22','230','/asset/img/quan-short1.jpg','20','1'),
('006','Áo blazer nâu','3','Mặc cùng quần âu và áo sơ mi là hết sảy','2022/10/22','500','/asset/img/ao-blazer1.jpg','20','1'),
('007','Áo Vest xanh biển','4','Trông bạn sẽ hòa mình vào biển cả nếu mặc chiếc vest này','2022/10/22','1500','/asset/img/ao-vest1.jpg','20','1'),
('008','Quần kaki xanh đen','4','Sự kết hợp tuyệt vời của màu xanh và màu đen khiến bạn ngon giai hơn','2019/10/22','600','/asset/img/quan-kaki1.jpg','20','1');
('009','Áo hoodie unisex','1','Áo khoác ấm áp dành cho cả nam và nữ','2019/10/22','350','chua co ','20','1'),
('010','Áo tank top nam','1','Tôn lên vẻ đàn ông và cơ bắp của bạn','2019/11/21','500','chua co','20','1'),
('011','Đầm dạ hội cao cấp','3','Những người phụ nữ trong bộ trang phục này sẽ trở nên quyễn rũ hơn','2020/1/1','1000','chua co','20','1'),
('012','Quần jogger nữ cực chất','2','Chất chơi người dơi với giá cả phải chăng','2020/1/1','300','chua co','21','1'),
('013','Chân váy xếp ly','4',' Váy thiết kế kiểu dáng thời trang, có kèm đai xinh','2020/1/1','350','chua co','20','1'),
('014','Quần short nam đen','2','Quần short nam màu đen chất vải wdven cao cấp mới nhất ','2020/1/1','400','chua co','20','1');

insert into users (`uuid`,`username`, `password` , `admin`)values
('001','fat02','phat2002','1'),
('002','thinhteddy','thinh2002','1'),
('003','khoildm','khoi2002','1'),
('004','vanA','11111','0'),
('005','vanB','22222','0'),
('006','thiC','33333','0'),
('007','ThiD','44444','0'),
('008','vanE','55555','0');

insert into admins (`uuid` ,`full_name`, `email` ,`phone_number` ) values
('001','Trần Thịnh Phát','7611quanggbinhhh@gmail.com','0353583372'),
('002','Phạm Huy Cường Thịnh','thinhpham20@gmail.com','0988202789'),
('003','Lê Đặng Minh Khôi','khoile22@gmail.com','0875666812');

insert into customers( `uuid`, `full_name`,`email`,`phone_number`, `address`,`create_date`,`user_avt`, `banned` )values
('004','Nguyễn Văn A','','0123456789','Quận 1,tp.Hồ Chí minh','2020/1/12',Null,'0'),
('005','Trần Văn B','','0987654321','Quận 10,tp.Hồ Chí minh','2020/2/13',Null,'0'),
('006','Lê Thị C','','0564738291','Quận 5,tp.Hồ Chí minh','2020/6/24',Null,'0'),
('007','Phan Thị D','','0876125321','Quận 7,tp.Hồ Chí minh','2021/1/1',Null,'0'),
('008','Cao văn E','','0999222121','Quận 3,tp.Hồ Chí minh','2021/12/1',Null,'0');

insert into categories(`category_id`,`category_name`) values
('1','Áo'),
('2','Quần'),
('3','Váy'),
('4','Đầm');


insert into category_product (`category_id`,`product_id` ) values
('1','001'),
('2','002'),
('3','003'),
('4','004'),
('2','005'),
('1','006'),
('1','007'),
('2','008'),
('1','009'),
('1','010'),
('4','011'),
('2','012'),
('3','013'),
('2','014');



