--
-- create table file/images by AGUEKENG
--

CREATE TABLE images
(
    image_name VARCHAR(30) PRIMARY KEY NOT NULL,
    image_size VARCHAR(30),
    format_image VARCHAR(4),
    media_id  INT  NOT NULL
);