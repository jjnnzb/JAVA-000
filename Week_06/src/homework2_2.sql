drop database if exists market;
create database market;
-- 用户表
drop table if exists tab_user;
create table tab_user
(
    id          bigint unsigned  not null primary key auto_increment comment 'id',
    user_id     char(50)         not null unique comment '用户id',
    nick_name   char(20)         null default '' comment '用户名',
    head_url    varchar(200)     null default '' comment '头像',
    user_level  tinyint unsigned not null comment '用户等级',
    login_time  datetime         null comment '登录时间',
    create_time datetime         null default now() comment '创建时间',
    update_time datetime         null default now() on update now() comment '更新时间'
);

-- 收货地址表
drop table if exists tab_user_address;
create table tab_user_address
(
    id              bigint unsigned  not null primary key auto_increment comment 'id',
    user_id         bigint unsigned  not null comment '用户id,与用户表主键关联',
    phone_number    char(11)         not null comment '手机号',
    nick_name       char(20)         not null comment '收货人',
    region_country  char(10)         not null comment '地区所属国家',
    region_province char(10)         not null comment '地区所属省份',
    region_city     char(10)         not null comment '地区所属城市',
    region_street   varchar(10)      not null comment '地区所属街道',
    region_detail   varchar(100)     not null comment '详细地址',
    address_tag     char(10)         null comment '地址标签',
    is_default      tinyint unsigned not null comment '是否是默认地址',
    create_time     datetime         null default now() comment '创建时间',
    update_time     datetime         null default now() on update now() comment '更新时间',
    unique index default_address_unique_index (user_id, is_default) comment '用户-默认地址唯一索引'
);

-- 收货地址标签表
drop table if exists tab_user_address_tag;
create table tab_user_address_tag
(
    id          bigint unsigned not null primary key auto_increment comment 'id',
    user_id     bigint unsigned not null comment '用户id',
    tag_name    char(10)        not null comment '标签名称',
    create_time datetime        null default now() comment '创建时间',
    update_time datetime        null default now() on update now() comment '更新时间'
);

-- 店铺表
drop table if exists tab_shop;
create table tab_shop
(
    id                bigint unsigned  not null primary key auto_increment comment 'id',
    shop_name         varchar(30)      not null comment '店铺名称',
    fans_num          int unsigned     not null default 0 comment '店铺粉丝数',
    shop_rate         tinyint unsigned not null comment '店铺体验分,100为最大值',
    head_url          varchar(200)     null     default '' comment '头像',
    shop_type         tinyint unsigned not null comment '店铺类型',
    total_comment_num int unsigned     not null comment '总评论数',
    good_favor_num    int unsigned     not null comment '总好评数',
    create_year       int unsigned     not null comment '入驻年份',
    create_time       datetime         null     default now() comment '创建时间',
    update_time       datetime         null     default now() on update now() comment '更新时间'
);

-- 商品表
drop table if exists tab_goods;
create table tab_goods
(
    id                bigint unsigned not null primary key auto_increment comment 'id',
    shop_id           bigint unsigned not null comment '所属店铺的id',
    goods_title       varchar(100)    not null comment '商品标题',
    goods_price       bigint unsigned not null comment '商品价格,以分为单位',
    goods_position    varchar(10)     not null comment '发货地',
    goods_sale        int unsigned    not null comment '月销量',
    ship_fee          int unsigned    not null comment '快递费,以分为单位',
    total_comment_num int unsigned    not null default 0 comment '总评论数',
    total_buy_num     int unsigned    not null default 0 comment '总购买数',
    create_time       datetime        null     default now() comment '创建时间',
    update_time       datetime        null     default now() on update now() comment '更新时间'
);

-- 商品主要图片表
drop table if exists tab_goods_preview_picture;
create table tab_goods_preview_picture
(
    id           bigint unsigned not null primary key auto_increment comment 'id',
    goods_id     bigint unsigned not null comment '商品id',
    picture_path varchar(200)    not null comment '图片地址',
    picture_name varchar(100)    not null comment '图片名称',
    create_time  datetime        null default now() comment '创建时间',
    update_time  datetime        null default now() on update now() comment '更新时间'
);

-- 商品款式-颜色-尺码表
drop table if exists tab_goods_style;
create table tab_goods_style
(
    id           bigint unsigned not null primary key auto_increment comment 'id',
    goods_id     bigint unsigned not null comment '商品id',
    goods_color  varchar(100)    not null comment '商品颜色',
    goods_size   varchar(100)    not null comment '商品尺寸',
    picture_path varchar(200)    not null comment '商品图片链接',
    create_time  datetime        null default now() comment '创建时间',
    update_time  datetime        null default now() on update now() comment '更新时间'
);

-- 商品评价表
drop table if exists tab_goods_comment;
create table tab_goods_comment
(
    id            bigint unsigned not null primary key auto_increment comment 'id',
    goods_id      bigint unsigned not null comment '商品id',
    style_id      bigint unsigned not null comment '款式id',
    user_id       bigint unsigned not null comment '用户id',
    goods_comment varchar(200)    not null comment '商品评语表',
    view_count    int unsigned    not null default 0 comment '浏览数',
    comment_count int unsigned    not null default 0 comment '评论数',
    like_count    int unsigned    not null default 0 comment '点赞数',
    create_time   datetime        null     default now() comment '创建时间',
    update_time   datetime        null     default now() on update now() comment '更新时间'
);

-- 订单表
drop table if exists tab_order;
create table tab_order
(
    id                  bigint unsigned  not null primary key auto_increment comment 'id',
    order_number        varchar(50)      not null comment '订单编号',
    pay_number          varchar(50)      not null comment '订单交易号',
    goods_id            bigint unsigned  not null comment '商品id',
    style_id            bigint unsigned  not null comment '款式id',
    user_id             bigint unsigned  not null comment '用户id',
    order_status        tinyint unsigned not null comment '订单状态,0-未付款,1-已付款未发货,2-已发货,3-退货中,4-已退款,5-确认收货,6-已评价',
    goods_price         bigint unsigned  not null comment '商品价格,以分为单位',
    coupon_number       int unsigned     not null comment '优惠价格,以分为单位',
    ship_fee            int unsigned     not null comment '快递费,以分为单位',
    actual_pay          bigint unsigned  not null comment '实际付费',
    pay_time            datetime         not null comment '付款时间',
    express_number      char(20)         null comment '物流订单号',
    return_apply_time   datetime         not null comment '申请退货时间',
    return_confirm_time datetime         not null comment '退货成功时间',
    confirm_time        datetime         not null comment '确认收货时间',
    comment_time        datetime         not null comment '评论时间',
    create_time         datetime         null default now() comment '创建时间',
    update_time         datetime         null default now() on update now() comment '更新时间'
);

-- 物流记录表
drop table if exists tab_order_express_record;
create table tab_order_express_record
(
    id             bigint unsigned not null primary key auto_increment comment 'id',
    order_id       bigint unsigned not null comment '订单id',
    express_number char(20)        null comment '物流订单号',
    record_content varchar(100)    not null comment '物流记录详情表',
    create_time    datetime        null default now() comment '创建时间',
    update_time    datetime        null default now() on update now() comment '更新时间'
);