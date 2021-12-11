--
-- creation de la table media/videos  by AGUEKENG
--
CREATE TABLE videos(
    video_name VARCHAR(30) PRIMARY KEY NOT NULL,
    video_size VARCHAR(30),
    format_video VARCHAR(4), 
    media_id  INT  NOT NULL
);