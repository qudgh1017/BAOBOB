-- 계정
CREATE USER baobob IDENTIFIED BY baobob DEFAULT TABLESPACE USERS;
GRANT CONNECT, RESOURCE TO baobob;
ALTER USER baobob ACCOUNT UNLOCK;

-- sql
--TABLE 전체삭제 (리얼 다 삭제 되니 주의!!!)
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
FROM    user_objects WHERE   object_type = 'TABLE';
DROP TABLE PARK_HISTORY_tbl CASCADE CONSTRAINTS;
DROP TABLE BOARD_tbl CASCADE CONSTRAINTS;
DROP TABLE PARK_FEE_tbl CASCADE CONSTRAINTS;
DROP TABLE PARK_SPACE_tbl CASCADE CONSTRAINTS;
DROP TABLE REPLY_tbl CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_tbl CASCADE CONSTRAINTS;
DROP TABLE THEATER_SEAT_tbl CASCADE CONSTRAINTS;
DROP TABLE MOVIE_HISTORY_tbl CASCADE CONSTRAINTS;
DROP TABLE MOVIE_REVIEW_tbl CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT_HISTORY_tbl CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT_MENU_tbl CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT_REVIEW_tbl CASCADE CONSTRAINTS;
DROP TABLE PARK_tbl CASCADE CONSTRAINTS;
DROP TABLE THEATER_SCHEDULE_tbl CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT_SCHEDULE_tbl CASCADE CONSTRAINTS;
DROP TABLE MOVIE_tbl CASCADE CONSTRAINTS;
DROP TABLE REVIEW_tbl CASCADE CONSTRAINTS;
DROP TABLE THEATER_tbl CASCADE CONSTRAINTS;
DROP TABLE HISTORY_tbl CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT_tbl CASCADE CONSTRAINTS;
DROP TABLE MEMBER_tbl CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT_FOOD_HISTORY_tbl CASCADE CONSTRAINTS;
DROP TABLE MEMBER_KEy_tbl CASCADE CONSTRAINTS;
DROP TABLE restaurant_table_tbl CASCADE CONSTRAINTS;
DROP TABLE faq_tbl CASCADE CONSTRAINTS;
DROP TABLE member_wishList_tbl CASCADE CONSTRAINTS;
DROP TABLE wordcloud_tbl CASCADE CONSTRAINTS;
--시퀀스 삭제
DROP SEQUENCE BOARD_TBL_SEQ;
DROP SEQUENCE EMPLOYEE_TBL_SEQ;
DROP SEQUENCE HISTORY_TBL_SEQ;
DROP SEQUENCE MOVIE_TBL_SEQ;
DROP SEQUENCE PARK_HISTORY_TBL_SEQ;
DROP SEQUENCE PARK_TBL_SEQ;
DROP SEQUENCE REPLY_TBL_SEQ;
DROP SEQUENCE RESTAURANT_MENU_TBL_SEQ;
DROP SEQUENCE RESTAURANT_SCHEDULE_TBL_SEQ;
DROP SEQUENCE RESTAURANT_TBL_SEQ;
DROP SEQUENCE REVIEW_TBL_SEQ;
DROP SEQUENCE THEATER_SCHEDULE_TBL_SEQ;
DROP SEQUENCE THEATER_SEAT_TBL_SEQ;
DROP SEQUENCE THEATER_TBL_SEQ;
DROP SEQUENCE faq_tbl_SEQ;
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- member_tbl Table Create SQL
CREATE TABLE member_tbl
(
    member_id          VARCHAR2(30)     NOT NULL, 
    member_pwd         VARCHAR2(30)     NOT NULL, 
    member_name        VARCHAR2(20)     NOT NULL, 
    member_tel         VARCHAR2(13)     NULL, 
    member_email       VARCHAR2(50)     NOT NULL,
    member_birth       VARCHAR2(30)     NOT NULL, 
    member_sex         VARCHAR2(10)     NOT NULL, 
    member_address     VARCHAR2(100)    NULL, 
    member_point       NUMBER           NULL, 
    member_step        NUMBER           NOT NULL, 
    member_cumPoint    NUMBER           NULL, 
    member_reg_date    TIMESTAMP        NOT NULL, 
    member_img         VARCHAR(100)     NULL, 
    CONSTRAINT MEMBER_TBL_PK PRIMARY KEY (member_id)
)
/


-- restaurant_tbl Table Create SQL
CREATE TABLE restaurant_tbl
(
    restaurant_index    NUMBER(2)        NOT NULL, 
    restaurant_tel      VARCHAR2(20)     NULL, 
    restaurant_name     VARCHAR2(100)    NULL, 
    CONSTRAINT RESTAURANT_TBL_PK PRIMARY KEY (restaurant_index)
)
/

CREATE SEQUENCE restaurant_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/




-- movie_tbl Table Create SQL
CREATE TABLE movie_tbl
(
    movie_index       NUMBER            NOT NULL, 
    movie_title       VARCHAR2(200)     NOT NULL, 
    movie_content     VARCHAR2(4000)    NULL, 
    movie_janre       NUMBER(5)         NULL, 
    movie_age         NUMBER(2)         NULL, 
    movie_rel_date    VARCHAR2(20)      NULL, 
    movie_director    VARCHAR2(50)      NULL, 
    movie_star        VARCHAR2(100)     NULL, 
    movie_country     VARCHAR2(50)      NULL, 
    movie_runTime     NUMBER(5)         NULL, 
    movie_poster      VARCHAR2(100)     NULL, 
    movie_trailer     VARCHAR2(200)     NULL, 
    movie_state       VARCHAR2(20)      NULL, 
    movie_count       NUMBER            NULL, 
    CONSTRAINT MOVIE_TBL_PK PRIMARY KEY (movie_index)
)
/

CREATE SEQUENCE movie_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/




-- restaurant_schedule_tbl Table Create SQL
CREATE TABLE restaurant_schedule_tbl
(
    restaurant_schedule_index    NUMBER(3)       NOT NULL, 
    schedule_startTime           TIMESTAMP       NULL, 
    schedule_endTime             TIMESTAMP       NULL, 
    restaurant_index             NUMBER(3)       NULL, 
    member_id                    VARCHAR2(30)    NULL, 
    CONSTRAINT RESTAURANT_SCHEDULE_TBL_PK PRIMARY KEY (restaurant_schedule_index)
)
/

CREATE SEQUENCE restaurant_schedule_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE restaurant_schedule_tbl
    ADD CONSTRAINT FK_restaurant_schedule_tbl_res FOREIGN KEY (restaurant_index)
        REFERENCES restaurant_tbl (restaurant_index)
/

ALTER TABLE restaurant_schedule_tbl
    ADD CONSTRAINT FK_restaurant_schedule_tbl_mem FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/


-- history_tbl Table Create SQL
CREATE TABLE history_tbl
(
    history_index    NUMBER(3)       NOT NULL, 
    history_date     TIMESTAMP       NULL, 
    member_id        VARCHAR2(30)    NOT NULL, 
    CONSTRAINT HISTORY_TBL_PK PRIMARY KEY (history_index)
)
/

CREATE SEQUENCE history_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE history_tbl
    ADD CONSTRAINT FK_history_tbl_member_id_membe FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/


-- theater_tbl Table Create SQL
CREATE TABLE theater_tbl
(
    theater_index    NUMBER       NOT NULL, 
    theater_row      NUMBER(3)    NOT NULL, 
    theater_col      NUMBER(3)    NOT NULL, 
    CONSTRAINT THEATER_TBL_PK PRIMARY KEY (theater_index)
)
/

CREATE SEQUENCE theater_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/




-- review_tbl Table Create SQL
CREATE TABLE review_tbl
(
    review_index       NUMBER(3)        NOT NULL, 
    review_grade       VARCHAR2(20)     NULL, 
    review_content     VARCHAR2(500)    NULL, 
    member_id          VARCHAR2(20)     NULL, 
    review_state       NUMBER(2)        NULL, 
    review_reg_date    TIMESTAMP        NULL, 
    CONSTRAINT REVIEW_TBL_PK PRIMARY KEY (review_index)
)
/

CREATE SEQUENCE review_tbl_SEQ
START WITH 16
INCREMENT BY 1;
/



ALTER TABLE review_tbl
    ADD CONSTRAINT FK_review_tbl_member_id_member FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/


-- restaurant_menu_tbl Table Create SQL
CREATE TABLE restaurant_menu_tbl
(
    restaurant_menu_index      NUMBER(3)        NOT NULL, 
    restaurant_index           NUMBER(3)        NULL, 
    restaurant_menu_name       VARCHAR2(50)     NULL, 
    restaurant_menu_img        VARCHAR2(200)    NULL, 
    restaurant_menu_content    VARCHAR2(500)    NULL, 
    restaurant_menu_price      NUMBER(6)        NULL   
)
/

ALTER TABLE restaurant_menu_tbl
    ADD CONSTRAINT FK_restaurant_menu_tbl_restaur FOREIGN KEY (restaurant_index)
        REFERENCES restaurant_tbl (restaurant_index)
/


-- theater_schedule_tbl Table Create SQL
CREATE TABLE theater_schedule_tbl
(
    theater_schedule_index    NUMBER       NOT NULL, 
    movie_index               NUMBER       NULL, 
    theater_index             NUMBER       NULL, 
    schedule_startDate        TIMESTAMP    NOT NULL, 
    schedule_startTime        TIMESTAMP    NOT NULL, 
    schedule_endTime          TIMESTAMP    NOT NULL, 
    schedule_MDNstate         NUMBER       NOT NULL, 
    schedule_empty_seat       NUMBER       NULL, 
    schedule_seat             NUMBER       NULL, 
    CONSTRAINT THEATER_SCHEDULE_TBL_PK PRIMARY KEY (theater_schedule_index)
)
/

CREATE SEQUENCE theater_schedule_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE theater_schedule_tbl
    ADD CONSTRAINT FK_theater_schedule_tbl_movie_ FOREIGN KEY (movie_index)
        REFERENCES movie_tbl (movie_index)
/

ALTER TABLE theater_schedule_tbl
    ADD CONSTRAINT FK_theater_schedule_tbl_theate FOREIGN KEY (theater_index)
        REFERENCES theater_tbl (theater_index)
/


-- board_tbl Table Create SQL
CREATE TABLE board_tbl
(
    board_index        NUMBER            NOT NULL, 
    member_id          VARCHAR2(30)      NOT NULL, 
    board_pwd          VARCHAR2(20)      NOT NULL, 
    board_type         NUMBER            NOT NULL, 
    board_subject      VARCHAR2(500)     NOT NULL, 
    board_content      VARCHAR2(4000)    NULL, 
    board_img          VARCHAR2(100)     NULL, 
    board_readCnt      NUMBER            NULL, 
    board_ref          NUMBER            NULL, 
    board_ref_step     NUMBER            NULL, 
    board_ref_level    NUMBER            NULL, 
    board_reg_date     TIMESTAMP         NULL, 
    board_ip           VARCHAR2(15)      NULL, 
    CONSTRAINT BOARD_TBL_PK PRIMARY KEY (board_index)
)
/

CREATE SEQUENCE board_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE board_tbl
    ADD CONSTRAINT FK_board_tbl_member_id_member_ FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/


-- park_tbl Table Create SQL
CREATE TABLE park_tbl
(
    park_index        NUMBER       NOT NULL, 
    park_state        NUMBER       NULL, 
    park_theme        NUMBER       NULL, 
    park_last_date    TIMESTAMP    NULL, 
    park_last_out     TIMESTAMP    NULL, 
    CONSTRAINT PARK_TBL_PK PRIMARY KEY (park_index)
)
/

CREATE SEQUENCE park_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/




-- restaurant_review_tbl Table Create SQL
CREATE TABLE restaurant_review_tbl
(
    review_index        NUMBER(3)    NOT NULL, 
    restaurant_index    NUMBER(3)    NOT NULL
)
/

ALTER TABLE restaurant_review_tbl
    ADD CONSTRAINT FK_restaurant_review_tbl_revie FOREIGN KEY (review_index)
        REFERENCES review_tbl (review_index)
/

ALTER TABLE restaurant_review_tbl
    ADD CONSTRAINT FK_restaurant_review_tbl_resta FOREIGN KEY (restaurant_index)
        REFERENCES restaurant_tbl (restaurant_index)
/


-- restaurant_history_tbl Table Create SQL
CREATE TABLE restaurant_history_tbl
(
    history_index                NUMBER(3)    NOT NULL, 
    restaurant_schedule_index    NUMBER(3)    NULL, 
    restaurant_table_index       NUMBER(3)    NOT NULL, 
    discount                     NUMBER       NULL, 
    member_use_point             NUMBER       NULL, 
    payvalue                     NUMBER       NULL, 
    restaurant_history_state     NUMBER       NULL   
)
/

ALTER TABLE restaurant_history_tbl
    ADD CONSTRAINT FK_restaurant_history_tbl_rest FOREIGN KEY (restaurant_schedule_index)
        REFERENCES restaurant_schedule_tbl (restaurant_schedule_index)
/

ALTER TABLE restaurant_history_tbl
    ADD CONSTRAINT FK_restaurant_history_tbl_hist FOREIGN KEY (history_index)
        REFERENCES history_tbl (history_index)
/


-- movie_review_tbl Table Create SQL
CREATE TABLE movie_review_tbl
(
    review_index    NUMBER    NOT NULL, 
    movie_index     NUMBER    NOT NULL
)
/

ALTER TABLE movie_review_tbl
    ADD CONSTRAINT FK_movie_review_tbl_review_ind FOREIGN KEY (review_index)
        REFERENCES review_tbl (review_index)
/

ALTER TABLE movie_review_tbl
    ADD CONSTRAINT FK_movie_review_tbl_movie_inde FOREIGN KEY (movie_index)
        REFERENCES movie_tbl (movie_index)
/


-- movie_history_tbl Table Create SQL
CREATE TABLE movie_history_tbl
(
    history_index             NUMBER    NOT NULL, 
    theater_schedule_index    NUMBER    NULL, 
    movie_history_price       NUMBER    NULL, 
    use_point                 NUMBER    NULL   
)
/

ALTER TABLE movie_history_tbl
    ADD CONSTRAINT FK_movie_history_tbl_history_i FOREIGN KEY (history_index)
        REFERENCES history_tbl (history_index)
/

ALTER TABLE movie_history_tbl
    ADD CONSTRAINT FK_movie_history_tbl_theater_s FOREIGN KEY (theater_schedule_index)
        REFERENCES theater_schedule_tbl (theater_schedule_index)
/


-- theater_seat_tbl Table Create SQL
CREATE TABLE theater_seat_tbl
(
    seat_index                NUMBER(5)       NOT NULL, 
    theater_index             NUMBER          NULL, 
    seat_row                  NUMBER(3)       NOT NULL, 
    seat_col                  NUMBER(3)       NOT NULL, 
    seat_state                NUMBER(2)       NOT NULL, 
    seat_price                NUMBER(5)       NULL, 
    theater_schedule_index    NUMBER          NULL, 
    member_id                 VARCHAR2(30)    NULL,
    history_index             NUMBER          NULL, 
    CONSTRAINT THEATER_SEAT_TBL_PK PRIMARY KEY (seat_index)
)
/

CREATE SEQUENCE theater_seat_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/

ALTER TABLE theater_seat_tbl
    ADD CONSTRAINT FK_theater_seat_tbl_theater_in FOREIGN KEY (theater_index)
        REFERENCES theater_tbl (theater_index)
/
ALTER TABLE theater_seat_tbl
    ADD CONSTRAINT FK_theater_seat_tbl_history_in FOREIGN KEY (history_index)
         REFERENCES history_tbl (history_index)
/


-- employee_tbl Table Create SQL
CREATE TABLE employee_tbl
(
    employee_index     NUMBER          NOT NULL, 
    member_id          VARCHAR2(30)    NOT NULL, 
    employee_jumin2    VARCHAR2(20)    NOT NULL, 
    employee_date      TIMESTAMP       NOT NULL, 
    CONSTRAINT EMPLOYEE_TBL_PK PRIMARY KEY (employee_index)
)
/

CREATE SEQUENCE employee_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE employee_tbl
    ADD CONSTRAINT FK_employee_tbl_member_id_memb FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/


-- reply_tbl Table Create SQL
CREATE TABLE reply_tbl
(
    comment_index      NUMBER           NOT NULL, 
    reg_date           TIMESTAMP(6)     NOT NULL, 
    comment_content    VARCHAR2(500)    NULL, 
    member_id          VARCHAR2(30)     NOT NULL, 
    board_index        NUMBER           NOT NULL, 
    CONSTRAINT REPLY_TBL_PK PRIMARY KEY (comment_index)
)
/

CREATE SEQUENCE reply_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE reply_tbl
    ADD CONSTRAINT FK_reply_tbl_member_id_member_ FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/

ALTER TABLE reply_tbl
    ADD CONSTRAINT FK_reply_tbl_board_index_board FOREIGN KEY (board_index)
        REFERENCES board_tbl (board_index)
/


-- park_space_tbl Table Create SQL
CREATE TABLE park_space_tbl
(
    p_space_col     NUMBER            NULL, 
    p_space_row     NUMBER            NULL, 
    p_space_info    VARCHAR2(4000)    NULL   
)
/


-- park_fee_tbl Table Create SQL
CREATE TABLE park_fee_tbl
(
    p_fee_exc_price     NUMBER    NULL, 
    p_fee_exc_time      NUMBER    NULL, 
    p_fee_base_price    NUMBER    NULL, 
    p_fee_base_time     NUMBER    NULL, 
    p_fee_movie_time    NUMBER    NULL, 
    p_fee_rest_time     NUMBER    NULL   
)
/


-- park_history_tbl Table Create SQL
CREATE TABLE park_history_tbl
(
    p_history_index    NUMBER          NOT NULL, 
    history_index      NUMBER          NULL, 
    p_history_in       TIMESTAMP       NULL, 
    p_history_out      TIMESTAMP       NULL, 
    p_history_price    NUMBER          NULL, 
    p_history_space    VARCHAR2(20)    NULL, 
    p_history_date     TIMESTAMP       NOT NULL, 
    CONSTRAINT PARK_HISTORY_TBL_PK PRIMARY KEY (p_history_index)
)
/

CREATE SEQUENCE park_history_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



ALTER TABLE park_history_tbl
    ADD CONSTRAINT FK_park_history_tbl_history_in FOREIGN KEY (history_index)
        REFERENCES history_tbl (history_index)
/


-- restaurant_food_history_tbl Table Create SQL
CREATE TABLE restaurant_food_history_tbl
(
    restaurant_schedule_index    NUMBER(3)    NOT NULL, 
    restaurant_menu_index        NUMBER(3)    NULL, 
    restaurant_index             NUMBER(3)    NULL, 
    restaurant_menu_count        NUMBER(3)    NULL, 
    restaurant_table_index       NUMBER(3)    NULL   
)
/

ALTER TABLE restaurant_food_history_tbl
    ADD CONSTRAINT FK_restaurant_food_history_ FOREIGN KEY (restaurant_schedule_index)
        REFERENCES restaurant_schedule_tbl (restaurant_schedule_index)
/



ALTER TABLE restaurant_food_history_tbl
    ADD CONSTRAINT FK_restaurant_food_history_tb FOREIGN KEY (restaurant_index)
        REFERENCES restaurant_tbl (restaurant_index)
/


-- member_wishList_tbl Table Create SQL
CREATE TABLE member_wishList_tbl
(
    member_id      VARCHAR2(30)    NOT NULL, 
    movie_index    NUMBER          NOT NULL
)
/

ALTER TABLE member_wishList_tbl
    ADD CONSTRAINT FK_member_wishList_tbl_member_ FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/

ALTER TABLE member_wishList_tbl
    ADD CONSTRAINT FK_member_wishList_tbl_movie_i FOREIGN KEY (movie_index)
        REFERENCES movie_tbl (movie_index)
/


-- member_key_tbl Table Create SQL
CREATE TABLE member_key_tbl
(
    member_id     VARCHAR2(30)    NOT NULL, 
    member_key    VARCHAR2(20)    NULL   
)
/

ALTER TABLE member_key_tbl
    ADD CONSTRAINT FK_member_key_tbl_member_id_me FOREIGN KEY (member_id)
        REFERENCES member_tbl (member_id)
/


-- restaurant_table_tbl Table Create SQL
CREATE TABLE restaurant_table_tbl
(
    restaurant_index             NUMBER(3)    NOT NULL, 
    restaurant_table_index       NUMBER(3)    NOT NULL, 
    table_row                    NUMBER(3)    NULL, 
    table_col                    NUMBER(3)    NULL, 
    table_state                  NUMBER(2)    NULL, 
    restaurant_schedule_index    NUMBER(3)    NULL   
)
/

ALTER TABLE restaurant_table_tbl
    ADD CONSTRAINT FK_restaurant_table_tbl_resta FOREIGN KEY (restaurant_index)
        REFERENCES restaurant_tbl (restaurant_index)
/

ALTER TABLE restaurant_table_tbl
    ADD CONSTRAINT FK_restaurant_table_tbl_rest FOREIGN KEY (restaurant_schedule_index)
        REFERENCES restaurant_schedule_tbl (restaurant_schedule_index)
/


-- faq_tbl Table Create SQL
CREATE TABLE faq_tbl
(
    faq_index        INT               NOT NULL, 
    faq_title        VARCHAR2(255)     NULL, 
    faq_sub_title    VARCHAR2(255)     NULL, 
    faq_content      VARCHAR2(2000)    NULL, 
    CONSTRAINT FAQ_TBL_PK PRIMARY KEY (faq_index)
)
/

CREATE SEQUENCE faq_tbl_SEQ
START WITH 1
INCREMENT BY 1;
/



-- wordcloud_tbl Table Create SQL
CREATE TABLE wordcloud_tbl
(
    word              VARCHAR2(60)    NOT NULL, 
    count             NUMBER          NOT NULL, 
    type_of_speech    VARCHAR2(40)    NOT NULL, 
    reg_date          TIMESTAMP       NOT NULL, 
    update_date       TIMESTAMP       NOT NULL, 
    movie_index       NUMBER          NOT NULL
)
/

ALTER TABLE wordcloud_tbl
    ADD CONSTRAINT FK_wordcloud_tbl_movie_index_m FOREIGN KEY (movie_index)
        REFERENCES movie_tbl (movie_index)
/

































--insert movie_tbl
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (8,'비밥바룰라','인생은 단 한 번 ‘빼박캔트’?

아니, 진짜 ‘욜로 라이프’는 지금부터다!

 

평균 나이 일흔, 지병 하나 정도는 기본 스펙인 네 명의 시니어벤져스

더 멋진 황혼을 맞이하기로 결심한 네 사람은

가족을 위해 지금껏 미뤄왔던 각자의 버킷리스트를 꺼내기 시작한다.

예상을 뛰어넘는 그들의 프로젝트에 온 동네가 발칵 뒤집히게 되는데…

 

2018년 새해, 꽃보다 아름다운 진짜 인생을 마주하다!',6,12,'18-01-24','이성재','박인환 ,  신구 ,  임현식 ,  윤덕용','한국',97,'qlqkqqkfnffk.jpg','f6Dr2fX2lnc','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (9,'염력','평범한 은행 경비원 ‘석헌’(류승룡).
어느 날 갑자기 그의 몸에 이상한 변화가 찾아온다.
생각만으로 물건을 움직이는 놀라운 능력, 바로 염력이 생긴 것.
 
한편, ‘민사장’(김민재)과 ‘홍상무’(정유미)에 의해
‘석헌’의 딸, 청년 사장 ‘루미’(심은경)와 이웃들이 위기에 처하게 되고...
‘석헌’과 ‘루미’, 그리고 변호사 ‘정현’(박정민)이 그들에 맞서며 놀라운 일이 펼쳐지는데...!
 
어제까진 초평범, 하루아침에 초능력
이제 그의 염력이 폭발한다!',3,15,'18-01-31','연상호','류승룡 ,  심은경','한국',101,'duafur.jpg','ZdGdh5MxGmY','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (10,'블랙 팬서','‘시빌 워’ 이후 와칸다의 왕위를 계승한 티찰라(채드윅 보스만)는
와칸다에만 존재하는 최강 희귀 금속 ‘비브라늄’과
왕좌를 노리는 숙적들의 음모가 전세계적인 위협으로 번지자
세상을 구할 히어로 ‘블랙 팬서’로서 피할 수 없는 전쟁에 나서는데…',8,12,'18-02-14','라이언 쿠글러','채드윅 보스만 ,  마이클 B. 조던 ,  루피타 뇽 ,  다나이 구리라','미국',135,'qmffor_vostj.jpg','k0DF4LSG1z8','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (11,'인시디어스4: 라스트 키','자신의 집에서 기이한 일들이 일어난다는 한 남자의 전화를 받게 된 영매 엘리스(린 샤예).
찾아간 그 곳은 다름 아닌 자신이 어린 시절 살았던, 뉴멕시코의 고향집이다.
수십 년 만에 다시 찾은 집에서 벌어지는 정체불명의 사건을 파악하기 위해 나선 엘리스.
어린 시절 자신이 겪었던 기억하고 싶지 않은 공포와 마주하게 되는데…
 
‘인시디어스’ 시리즈가 시작된 그 집, 드디어 공포의 비밀이 밝혀진다!',10,15,'18-01-31','애덤 로비텔','린 샤예 ,  스펜서 로크 ,  조쉬 스튜어트 ,  하비에르 보텟','미국',103,'dlstleldjtm4.jpg','2nKntXg4KwM','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (12,'누에치던 방','그 시절, 우리들의 단짝 친구는 지금 어떻게 살아가고 있을까.
 
10년째 고시생으로 살고 있는 채미희(이상희)는 어느 날 지하철에서 마주친 여학생(김새벽)을 따라간다. 채미희는 여학생을 뒤따르던 중 만난 조성숙(홍승이)에게 다짜고짜 자신이 오래전 헤어진 조성숙의 단짝친구라고 주장한다. 조성숙은 채미희를 ‘모르는 사람’이라고 여기면서도 친구로서 새로운 관계를 쌓는다. 한편 조성숙과 같이 살고 있는 김익주(임형국)는 채미희의 무례한 침입이 불쾌하지만 낯선 채미희에게 자신의 나약한 모습을 조금씩 꺼내어 놓는다. 그리고 조성숙은 오래전 헤어진 단짝친구 김유영(김새벽)의 기억을 떠올린다.
 
덕분에, 아직 남아있어.

2018년 1월, 당신을 찾아올 오래된 현재를 만난다.',3,15,'18-01-31','이완민','이상희 ,  홍승이 ,  김새벽 ,  이선호 ,  임형국','한국',123,'sndpclejs_qkd.jpg','ddcfAvidaX8','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (13,'레더페이스','괴물이 탄생하는 순간을 직접 목격하라!
정신병원에 갇혀 지내던 10대의 ‘레더페이스’.

그는 3명의 동료 환자와 함께 젊은 간호사를 납치, 그곳에서 탈출한다.

이내 그들에게 딸을 잃은 보안관의 추격과 복수에 맞서

''레더페이스''의 정신세계는 점점 파괴되어 가고

이윽고 서서히 공포의 연쇄살인마 괴물로 변해간다.',9,19,'18-01-25','알렉상드르 뷔스티요','스티븐 도프 ,  릴리 테일러','미국',87,'fpejvpdltm.jpg','RxeFONX07gU','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (14,'골든슬럼버','아무도 믿지 마
그리고 반드시 살아남아
 
착하고 성실한 택배기사 ‘건우’(강동원).
최근 모범시민으로 선정되어 유명세를 탄 그에게 고등학교 시절 친구 ‘무열’(윤계상)로부터 연락이 온다.
오랜만에 재회한 반가움도 잠시,
그들 눈 앞에서 유력 대선후보가 폭탄 테러에 의해 암살당하는 사건이 벌어진다.
당황한 건우에게 무열은 이 모든 것은 계획된 것이며,
건우를 암살범으로 만들고 그 자리에서 자폭 시키는 게 조직의 계획이라는 이야기를 전한다.
 
겨우 현장에서 도망치지만 순식간에 암살자로 지목되어 공개 수배된 건우.
CCTV, 지문, 목격자까지 완벽히 조작된 상황,
무열이 남긴 명함 속 인물, 전직 요원인 ‘민씨’(김의성)를 찾은 건우는
그를 통해 사건의 실체를 조금씩 알게 된다.
살아 남기 위해, 그리고 누명을 벗기 위해 필사적으로 맞서는 건우.
하지만 자신이 도망칠수록 오랜 친구인 ‘동규’(김대명), ‘금철’(김성균), ‘선영’(한효주)마저
위험에 빠지게 되는데…
 
2018년 2월, 세상이 그를 쫓는다!',3,15,'18-02-14','노동석','강동원 ,  김의성 ,  한효주 ,  김성균,  김대명','한국',107,'rhfemstmffjaqj.jpg','FBotiXtiM60','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (15,'원더 휠','꿈처럼 환상적인
뉴욕, 코니 아일랜드
 
웨이트리스로 일하는 지니는 해변의 안전요원 믹키와 사랑에 빠진다.
예상치 못한 캐롤라이나가 등장하며 ‘코니 아일랜드’ 에서 우연처럼 만난 세 남녀의 엇갈리는 로맨스가 시작된다!',3,15,'18-01-25','우디 알렌','케이트 윈슬렛 ,  저스틴 팀버레이크 ,  주노 템플 ,  제임스 벨루시','미국',101,'dnjsej_gnlf.jpg','VI-6wUoKDbY','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (16,'궁합','“세상의 모든 인연에는 궁합이 있다!”

<관상> 제작진의 역학 시리즈! 
관상은 잘 보았소? 이제 궁합을 봐드리지!

극심한 흉년이 지속되던 조선시대, 송화옹주(심은경)의 혼사만이 가뭄을 해소할 것이라 믿는 왕(김상경)은 대대적인 부마 간택을 실시하고, 조선 최고의 역술가 서도윤(이승기)은 부마 후보들과 송화옹주의 궁합풀이를 맡게 된다.
사나운 팔자로 소문나 과거 혼담을 거절당한 이력의 송화옹주는 얼굴도 모르는 사람을 남편으로 맞이할 수 없다고 판단하고 부마 후보들의 사주단자를 훔쳐 궐 밖으로 나가 후보들을 차례로 염탐하기 시작한다.
송화옹주가 사주단자를 훔친 궁녀라고 오해한 서도윤은 사주단자를 되찾기 위해 그녀의 여정에 함께 하게 되는데..

야심찬 능력남 윤시경(연우진), 경국지색의 절세미남 강휘(강민혁), 효심 지극한 매너남 남치호(최우식)에 대세 연하남까지!

조선의 팔자를 바꿀 최고의 합(合)을 찾아라!',3,15,'18-02-01','홍창표','심은경, 이승기','한국',100,'rndgkq.jpg','Z6lhm1yIC5Y','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (17,'명탐정 코난: 감벽의 관','깊고 푸른 바닷속 궁전, 그곳에 잠들어 있는 것은 과연?!
 
휴가를 맞아 300년 전 존재했던 해적과 숨겨진 보물의 전설이 전해지는 신해도를 찾은 코난 일행.
전설 속 보물을 찾으려는 트레저 헌터(보물 사냥꾼) 중 한 명이 의문의 죽음을 당하면서 수상한 냄새를 느낀 코난 일행의 수사가 시작된다.
한편, 트레저 헌터들 중 국제적 수배를 받고 있는 위험한 인물들이 있다는 사실이 밝혀져 긴장감이 고조되는 가운데 미란과 보라가 사라지는 사건이 발생하는데…! "
 
과연, 코난은 해적들이 남긴 암호를 풀고 사라져버린 미란과 보라를 찾아낼 수 있을 것인가?!',7,12,'18-02-14','야마모토 야스이치로','김선혜 ,  이현진 ,  강수진 ,  이용신 ,  이정구','일본',0,'audxkawjd_zhsks.jpg','rUXaMbEFXUk','0',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (1,'메이즈 러너:데스 큐어','미로의 끝을 확인하라! 

미스터리한 조직 ‘위키드’에게 잡힌 ‘민호’(이기홍)를 구하기 위해 
‘토마스’(딜런 오브라이언)와 러너들은 ‘위키드’의 본부가 있는 최후의 도시로 향한다. 
인류의 운명이 걸린 ‘위키드’의 위험한 계획을 알게 된 
‘토마스’와 러너들은 마지막 사투를 준비하지만, 
‘토마스’는 친구와 인류의 운명 앞에서 딜레마에 빠지게 되는데…',8,12,'18-01-17','웨스 볼','딜런 오브라이언, 토마스 브로디 생스터, 카야 스코델라리오, 이기홍','미국',143,'maze_runner_ybh.jpg','_DkF1V30OCo','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (2,'그것만이 내 세상','한때는 WBC 웰터급 동양 챔피언이었지만
지금은 오갈 데 없어진 한물간 전직 복서 ''조하''(이병헌).
우연히 17년 만에 헤어진 엄마 ''인숙''(윤여정)과 재회하고,
숙식을 해결하기 위해 따라간 집에서
듣지도 보지도 못했던 뜻밖의 동생 ''진태''(박정민)와 마주한다.

난생처음 봤는데… 동생이라고?!

라면 끓이기, 게임도 최고로 잘하지만
무엇보다 피아노에 천재적 재능을 지닌 서번트증후군 진태.
조하는 입만 열면 "네~" 타령인 심상치 않은 동생을 보자 한숨부터 나온다.
하지만 캐나다로 가기 위한 경비를 마련하기 전까지만 꾹 참기로 결심한 조하는
결코 만만치 않은 불편한 동거생활을 하기 시작하는데…

살아온 곳도, 잘하는 일도, 좋아하는 것도 다른
두 형제가 만났다!',3,12,'18-01-17','최성현','이병헌, 윤여정, 박정민','한국',120,'Its_only_my_world_ybh.jpg','G-brqMCgOy4','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (3,'코코','영원히 기억하고 싶은 황홀한 모험이 시작된다!



뮤지션을 꿈꾸는 소년 미구엘은 전설적인 가수 에르네스토의 기타에 손을 댔다 ‘죽은 자들의 세상’에 들어가게 된다.

그리고 그곳에서 만난 의문의 사나이 헥터와 함께 상상조차 못했던 모험을 시작하게 되는데…

과연 ‘죽은 자들의 세상’에 숨겨진 비밀은? 그리고 미구엘은 무사히 현실로 돌아올 수 있을까?',7,0,'18-01-11','리 언크리치','가엘 가르시아 베르날, 앤서니 곤잘레스, 벤자민 브랫','미국',127,'coco_ybh.jpg','LmS5KMJTWlA','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (4,'커뮤터','제한 시간 30분, 가족이 인질로 잡힌 전직 경찰 마이클(리암 니슨)이 사상 최악의 열차 테러범들에게 맞서는 초대형 액션 블록버스터',8,15,'18-01-24','자움 콜렛 세라','리암 니슨, 베라 파미가','미국, 영국',105,'the_commuter_ybh.jpg','bjGNQ_cg-2s','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (5,'1987','“책상을 탁! 치니 억! 하고 죽었습니다”



1987년 1월, 경찰 조사를 받던 스물두 살 대학생이 사망한다.

증거인멸을 위해 박처장(김윤석)의 주도 하에 경찰은 시신 화장을 요청하지만, 사망 당일 당직이었던 최검사(하정우)는 이를 거부하고 부검을 밀어붙인다.

단순 쇼크사인 것처럼 거짓 발표를 이어가는 경찰. 그러나 현장에 남은 흔적들과 부검 소견은 고문에 의한 사망을 가리키고,

사건을 취재하던 윤기자(이희준)는 ‘물고문 도중 질식사’를 보도한다. 이에 박처장은 조반장(박희순)등 형사 둘만 구속시키며 사건을 축소하려 한다.

한편, 교도소에 수감된 조반장을 통해 사건의 진상을 알게 된 교도관 한병용(유해진)은 이 사실을 수배 중인 재야인사에게 전달하기 위해 조카인 연희(김태리)에게 위험한 부탁을 하게 되는데…



한 사람이 죽고, 모든 것이 변화하기 시작했다.

모두가 뜨거웠던 1987년의 이야기.',3,15,'17-12-27','장준환','김윤석, 하정우, 유해진, 김태리, 박희순, 이희준','한국',129,'1987_ybh.jpg','WKQSRFlfr50','1',0);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (6,'1급기밀','공군 전투기 추락, 올해만 3번째 “또 조종사 과실?”

그들이 감추려 했던, 모두가 알아야 하는 대한민국 현재 진행 중인 실화!

국방부 군수본부 항공부품구매과 과장으로 부임한 박대익 중령(김상경)에게 어느 날, 공군 전투기 파일럿 강영우 대위가 찾아와 전투기 부품 공급 업체 선정에 대한 의혹을 제기한다. 이에 대익이 부품구매 서류를 확인하던 중 유독 미국의 에어스타 부품만이 공급되고 있음을 발견한다. 한편 강영우 대위가 전투기 추락 사고를 당하고, 이를 조종사 과실로 만들어 사건을 은폐하는 과정을 지켜본 대익은 큰 충격을 받는다. 그리고 은밀한 뒷조사 끝에 차세대 전투기 도입에 관한 에어스타와 연계된 미 펜타곤과 국방부 간에 진행되고 있는 모종의 계약을 알게 된다. 딸에게만큼은 세상에서 가장 바보 같지만 세상에서 제일 용감한 군인으로 남고 싶은 대익은 [PD25시]의 기자 김정숙(김옥빈)과 손잡고 국익이라는 미명으로 군복 뒤에 숨은 도둑들의 만행을 폭로하기로 결심하는 데…

그들이 시작한 전쟁, 절대로 항복하지 않을 것이다!',3,12,'18-01-24','홍기선','김상경, 김옥빈, 최무성','한국',101,'class_1_security_ybh.jpg','2c0G53QvhiI','1',12);
Insert into BAOBOB.MOVIE_TBL (MOVIE_INDEX,MOVIE_TITLE,MOVIE_CONTENT,MOVIE_JANRE,MOVIE_AGE,MOVIE_REL_DATE,MOVIE_DIRECTOR,MOVIE_STAR,MOVIE_COUNTRY,MOVIE_RUNTIME,MOVIE_POSTER,MOVIE_TRAILER,MOVIE_STATE,MOVIE_COUNT) values (7,'12 솔져스','9.11 테러 직후 11일간의 비공식 작전!
5만 명의 적군 vs. 12명의 최정예 요원
 
전 세계가 목격한 사상 최악의 테러 발생 15일 후,
''미치(크리스 헴스워스)''는 사랑하는 가족을 뒤로 한 채
비공식 작전 수행을 위한 11명의 최정예 요원들과 함께
탈레반이 점거한 아프가니스탄에 도착한다.
 
그곳에서 그들을 기다리고 있는 것은 5만 명의 적군과
도저히 승리할 수 없는 불가능한 전쟁뿐이다!
 
살아남을 확률 0%, 그러나 반드시 성공해야만 하는 작전!
 
2018년 첫 번째 전쟁 블록버스터가 펼쳐진다!',8,15,'18-01-31','니콜라이 퓰시','크리스 헴스워스 ,  마이클 페나 ,  마이클 섀넌','미국',130,'12_thfwutm.jpg','ROrrSbwTmoA','0',0);


-- insert member_tbl
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('movie','123','영화관리자','010-1111-2345','movie@baobob.com','19940226','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',2600,2,3100,to_timestamp('18/01/24 15:27:03.071000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res','123','식당관리자','010-1234-5678','res@baobob.com','20180101','여','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,4,0,to_timestamp('18/01/24 15:29:45.910000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res1','123','식당1관리자','010-1111-1111','res1@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,51,0,to_timestamp('18/01/24 15:32:50.262000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res2','123','식당2관리자','010-2222-2222','res2@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,52,0,to_timestamp('18/01/24 15:33:27.284000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res3','123','식당3관리자','010-3333-3333','res3@baobob.com','20180101','여','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,53,0,to_timestamp('18/01/24 15:34:04.643000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('park','123','주차관리자','010-7733-3333','res3@baobob.com','19720121','여','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,7,0,to_timestamp('18/01/26 15:34:04.643000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res11','123','김알바','010-1122-1122','res11@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:35:53.724000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res12','123','박알바','010-1122-1122','res12@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:40:29.948000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res13','123','최알바','010-1122-1122','res13@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:49:00.640000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res21','123','이알바','010-1122-1122','res21@baobob.com','20180101','여','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:49:29.900000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res22','123','윤알바','010-1122-1122','res22@baobob.com','20180101','여','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:50:37.825000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res23','123','임알바','010-1122-1122','res23@baobob.com','20180101','여','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:51:00.994000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('lgt','123','임건태','010-8586-1906','lgt@naver.com','19890427','남','서울 금천구 가산동 147-63',0,9,0,to_timestamp('18/01/24 15:51:18.852000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res31','123','민알바','010-1122-1122','res31@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:51:20.881000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res32','123','유알바','010-1122-1122','res32@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:51:44.538000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('res33','123','조알바','010-1122-1122','res33@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 15:52:11.220000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('phc','123','박해창','010-1234-1234','phc@naver.com','19940226','남','제주특별자치도 제주시 우도면 삼양고수물길 1(연평리)',0,9,0,to_timestamp('18/01/24 15:53:11.786000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('ymk','123','윤민경','010-0303-0303','ymk@naver.com','19930303','여','서울 관악구 낙성대로 2(봉천동)',0,9,0,to_timestamp('18/01/24 15:55:21.983000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('ybh','123','유병호','010-1225-1225','ybh@naver.com','19751225','남','강원 철원군 갈말읍 갈말로 7(군탄리)',2800,9,3800,to_timestamp('18/01/24 15:56:18.054000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('chg','123','최형규','010-0201-0201','chg@naver.com','19990201','남','경기 평택시 가재길 14(가재동)',0,9,0,to_timestamp('18/01/24 15:57:25.290000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('mhj','123','민현준','010-0625-0625','mhj@naver.com','19930625','남','서울 강남구 도산대로 403(청담동,LG 청담빌딩)',0,9,0,to_timestamp('18/01/24 15:58:31.486000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('khs','123','곽호선','010-0304-0304','khs@naver.com','19920304','남','인천 강화군 강화읍 갑룡길 3(관청리)',0,9,0,to_timestamp('18/01/24 15:59:52.479000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('pcs','123','박창선','010-1818-1818','pcs1818@naver.com','19861818','남','광주 남구 수원지길 1(월산동)',0,13,0,to_timestamp('18/01/24 16:01:03.076000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('psn','123','박순남','010-1234-1234','sunrise555@empas.com','19890427','남','서울 동작구 관악로30길 27(사당동,관악푸르지오)',0,9,0,to_timestamp('18/01/24 16:03:44.285000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kjw','123','김정원','010-0103-0103','kjw@naver.com','19940103','남','대구 남구 경상길 3(대명동)',0,9,0,to_timestamp('18/01/24 16:06:01.882000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('psr','123','박소라','010-9738-9568','psr@naver.com','19931128','여','경기 부천시 계남로 19(상동,라일락마을 동양덱스빌)',0,9,0,to_timestamp('18/01/24 16:07:40.036000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('lsh','123','이수호','010-0612-0612','lsh@naver.com','19840612','남','전북 군산시 임피면 상주길 2(술산리)',0,9,0,to_timestamp('18/01/24 16:09:45.708000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('host','123','총관리자','010-1122-1122','host@baobob.com','20180101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,1,0,to_timestamp('18/01/24 16:11:07.930000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('sdk@naver.com','123','신동큼','010-0913-0913','sdk@naver.com','19910913','남','강원 고성군 현내면 통일전망대로 26(제진리)',0,9,0,to_timestamp('18/01/24 16:13:25.780000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('gockd','123','해크창','010-1010-1010','gjrjrem123@naver.com','19940101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 16:16:29.617000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kis','123','김일성','010-0625-0625','kis@korea.love','19450625','남','경기 파주시 탄현면 필승로 369(성동리,오두산통일전망대)',0,9,0,to_timestamp('18/01/24 16:19:50.644000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kji','123','김정일','010-0625-0625','kji@korea.love','19560625','남','강원 고성군 현내면 통일전망대로 26(제진리)',0,9,0,to_timestamp('18/01/24 16:21:03.710000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kje','123','김정은','010-0625-0625','kje@korea.love','19810625','남','강원 고성군 현내면 통일전망대로 223-1(송현리)',0,9,0,to_timestamp('18/01/24 16:21:51.873000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('obama','123','버락오바마','010-0512-0512','obama@yahoo.net','19640512','남','서울 강북구 삼각산로 43(수유동,서울 영어마을 수유캠프)',0,9,0,to_timestamp('18/01/24 16:23:04.521000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into BAOBOB.MEMBER_TBL (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('trump','123','트럼프','010-1212-1212','trump@yahoo.net','19601212','남','서울 강서구 초록마을로22길 24(화곡동,영어나라어린이집)',0,9,0,to_timestamp('18/01/24 16:24:14.827000000','RR/MM/DD HH24:MI:SSXFF'),null);

-- insert faq_tbl
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '영화관 이용', '관람등급 안내', '바오밥은 영화 및 비디오진흥에 관한 법률(이하 영비법)을 준수합니다.<br>영비법 29조에 따르면 [만 12세 이상관람가/ 만 15세 이상관람가]의 등급이라도<br>부모 등 보호자를 동반하는 경우 어린이(유아) 동반이 가능합니다.<br>반드시 보호자의 동반이 필요함을 양지하여 주시기 바랍니다.<br>단, 청소년관람불가 영화는 보호자 동반과 관계없이 <br>만 18세미만이거나 연령 조건을 만족하여도 초중고 재학중인 청소년 및 영유아 관람이 절대 불가합니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '영화관 이용', '분실물을 찾고 싶어요', '영화관을 이용하시다가 소지물품을 분실하신 경우에는 홈페이지 [고객센터] - [분실물 문의 바로가기] 또는 [마이페이지] - [분실물 문의]에서 분실물 접수를 하실 수 있습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '온라인', '온라인 예매 후 예매내역 확인하고 싶어요', '인터넷 예매후 예매내역을 다시 확인 하시려면<br>- 홈페이지 : [로그인] → [마이페이지] → [예매 내역]에서 확인 가능합니다.<br>- 모바일 : [로그인] → 우측 상단 [MY] 메뉴 → [마이페이지] → [예매 내역]에서 확인 가능합니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '온라인', '영화 리뷰는 어떻게 작성하나요?', '[홈페이지/모바일] → [영화] 메뉴에서 해당 영화를 선택하시면 리뷰를 작성하실 수 있습니다.<br>리뷰 작성은 유료 관람 고객에 한하여 작성 가능하며, 한 건당 50p의 L.POINT가 적립됩니다.<br>작성하신 리뷰는 [마이페이지] → [무비로그]에서 확인하실 수 있습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '비회원으로 예매가 가능한가요?', '비회원 약관 동의 후에 기초 개인정보 (이름+휴대폰번호+비밀번호 4자리) 설정 후 예매 가능합니다.<br>비회원 로그인 시 예매 및 예매확인/취소 메뉴만 이용가능하며 <br>관람권, 할인권을 포함한 기타 결제/할인 수단을 사용할 수 없습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '개인정보는 어디에서 수정할 수 있나요?', '홈페이지 [마이페이지] → [정보 수정(연필 모양)]에서 가능합니다. ');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '페이스북 회원은 개인정보를 어떻게 수정하나요?', '홈페이지 [로그인] → [비밀번호 찾기]를 하시면 페이스북에 등록된 이메일로 인증 후 비밀번호가 전송됩니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '탈퇴하면 내 개인정보는 모두 삭제 되나요?', '탈퇴 즉시 고객님의 개인정보는 모두 삭제됩니다. <br>단, 전자상거래 및 소비자 권리 보호를 위해 개인정보 외의 거래정보 등은 법률에서 정한 기간 동안 보관될 수 있습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '비밀번호를 잃어버렸어요', '홈페이지 [로그인] - [비밀번호 찾기]를 이용하시면 비밀번호를 확인하실 수 있습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '회원가입은 어떻게 하나요?', '홈페이지 우측 상단의 [회원가입] 버튼을 누르거나, [로그인] - [회원가입] 버튼을 클릭해 온라인(홈페이지, 모바일 APP) 회원에 가입할 수 있습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '회원', '회원탈퇴는 어떻게 하나요?', '홈페이지 [마이페이지] → [정보 수정(연필 모양)]에서 [회원 탈퇴] 버튼을 클릭하여 회원 탈퇴가 가능합니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '포인트', '포인트 확인은 어디서 하나요?', '홈페이지 [마이페이지]를 통해서 포인트를 확인하실 수 있습니다.');
INSERT INTO faq_tbl VALUES ( faq_tbl_SEQ.nextval, '포인트', '탈퇴 후 재가입시 포인트는 소멸되나요?', '탈퇴 후 자동 소멸 됩니다');

-- insert board_tbl
INSERT INTO board_tbl(BOARD_INDEX, MEMBER_ID, BOARD_PWD, BOARD_TYPE, BOARD_SUBJECT,BOARD_CONTENT,BOARD_IMG,BOARD_READCNT,BOARD_REF,BOARD_REF_STEP,BOARD_REF_LEVEL,BOARD_REG_DATE,BOARD_IP)
VALUES (1, 'movie', '123', 2, '영화 관련 문의합니다.','청소년 불가 영화는 보호자 동행시 볼 수 있나요?','null',0,0,0,0,SYSTIMESTAMP, 111);
INSERT INTO board_tbl(BOARD_INDEX, MEMBER_ID, BOARD_PWD, BOARD_TYPE, BOARD_SUBJECT,BOARD_CONTENT,BOARD_IMG,BOARD_READCNT,BOARD_REF,BOARD_REF_STEP,BOARD_REF_LEVEL,BOARD_REG_DATE,BOARD_IP)
VALUES (2, 'movie', '123', 2, '식당 관련 문의합니다.','외상되나요?','null',0,0,0,0,SYSTIMESTAMP, 111);
INSERT INTO board_tbl(BOARD_INDEX, MEMBER_ID, BOARD_PWD, BOARD_TYPE, BOARD_SUBJECT,BOARD_CONTENT,BOARD_IMG,BOARD_READCNT,BOARD_REF,BOARD_REF_STEP,BOARD_REF_LEVEL,BOARD_REG_DATE,BOARD_IP)
VALUES (3, 'movie', '123', 3, '물건을 잃어버렸어요','영화관 3관에서 핸드폰을 잃어버렸습니다. 검은색 갤럭시7이에요.','null',0,0,0,0,SYSTIMESTAMP, 111);

COMMIT;



-- 식당 추가 SQL

Insert into BAOBOB.RESTAURANT_TBL (RESTAURANT_INDEX,RESTAURANT_TEL,RESTAURANT_NAME) values (1,'02-1234-1234','도키도키 (ときどき)');
Insert into BAOBOB.RESTAURANT_TBL (RESTAURANT_INDEX,RESTAURANT_TEL,RESTAURANT_NAME) values (2,'02-1234-2345','바압');
Insert into BAOBOB.RESTAURANT_TBL (RESTAURANT_INDEX,RESTAURANT_TEL,RESTAURANT_NAME) values (3,'02-1234-3456','BoutBack');
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,0,0,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,1,0,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,2,0,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,3,0,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,4,0,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,5,0,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,6,0,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,7,0,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,8,0,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,9,1,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,10,1,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,11,1,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,12,1,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,13,1,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,14,1,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,15,1,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,16,1,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,17,1,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,18,2,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,19,2,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,20,2,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,21,2,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,22,2,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,23,2,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,24,2,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,25,2,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,26,2,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,27,3,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,28,3,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,29,3,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,30,3,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,31,3,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,32,3,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,33,3,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,34,3,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,35,3,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,36,4,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,37,4,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,38,4,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,39,4,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,40,4,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,41,4,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,42,4,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,43,4,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,44,4,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,45,5,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,46,5,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,47,5,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,48,5,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,49,5,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,50,5,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,51,5,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,52,5,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,53,5,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,54,6,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,55,6,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,56,6,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,57,6,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,58,6,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,59,6,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,60,6,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,61,6,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,62,6,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,63,7,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,64,7,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,65,7,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,66,7,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,67,7,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,68,7,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,69,7,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,70,7,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,71,7,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,72,8,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,73,8,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,74,8,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,75,8,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,76,8,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,77,8,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,78,8,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,79,8,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (1,80,8,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,2,0,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,3,0,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,4,0,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,5,0,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,6,0,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,7,0,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,8,0,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,9,1,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,10,1,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,11,1,2,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,12,1,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,13,1,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,14,1,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,15,1,6,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,16,1,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,17,1,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,18,2,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,19,2,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,20,2,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,21,2,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,22,2,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,23,2,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,24,2,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,25,2,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,26,2,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,27,3,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,28,3,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,29,3,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,30,3,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,31,3,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,32,3,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,33,3,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,34,3,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,35,3,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,36,4,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,37,4,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,38,4,2,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,39,4,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,40,4,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,41,4,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,42,4,6,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,43,4,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,44,4,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,45,5,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,46,5,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,47,5,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,48,5,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,49,5,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,50,5,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,51,5,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,52,5,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,53,5,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,54,6,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,55,6,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,56,6,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,57,6,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,58,6,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,59,6,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,60,6,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,61,6,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,62,6,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,63,7,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,64,7,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,65,7,2,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,66,7,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,67,7,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,68,7,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,69,7,6,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,70,7,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,71,7,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,72,8,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,73,8,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,74,8,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,75,8,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,76,8,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,77,8,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,78,8,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,79,8,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,80,8,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,2,0,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,3,0,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,4,0,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,5,0,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,6,0,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,7,0,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,8,0,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,9,1,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,10,1,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,11,1,2,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,12,1,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,13,1,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,14,1,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,15,1,6,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,16,1,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,17,1,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,18,2,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,19,2,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,20,2,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,21,2,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,22,2,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,23,2,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,24,2,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,25,2,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,26,2,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,27,3,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,28,3,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,29,3,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,30,3,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,31,3,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,32,3,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,33,3,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,34,3,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,35,3,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,36,4,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,37,4,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,38,4,2,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,39,4,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,40,4,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,41,4,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,42,4,6,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,43,4,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,44,4,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,45,5,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,46,5,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,47,5,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,48,5,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,49,5,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,50,5,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,51,5,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,52,5,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,53,5,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,54,6,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,55,6,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,56,6,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,57,6,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,58,6,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,59,6,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,60,6,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,61,6,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,62,6,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,63,7,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,64,7,1,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,65,7,2,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,66,7,3,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,67,7,4,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,68,7,5,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,69,7,6,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,70,7,7,1,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,71,7,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,72,8,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,73,8,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,74,8,2,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,75,8,3,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,76,8,4,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,77,8,5,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,78,8,6,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,79,8,7,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,80,8,8,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,0,0,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (2,1,0,1,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,0,0,0,0,null);
Insert into BAOBOB.RESTAURANT_TABLE_TBL (RESTAURANT_INDEX,RESTAURANT_TABLE_INDEX,TABLE_ROW,TABLE_COL,TABLE_STATE,RESTAURANT_SCHEDULE_INDEX) values (3,1,0,1,0,null);
COMMIT;

Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (1,1,'가츠동','가츠동.jpg','바삭한 돈가스를 밥 위에 올리고 달콤 짭짤한 간장소스를 위에 부어먹는 음식',12000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (2,1,'나가사키짬뽕','나가사키짬뽕.jpg','국물이 맵지 않고 닭과 돼지뼈를 우린 육수에 숙주와 면을 같이 삶아 내어 모든 제조과정이 하나의 팬에서 이루어지는 나가사키지방의 향토음식',11000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (3,1,'모둠 초밥','모둠초밥.jpg','신선한 회와 정성을 담아 만든 모둠 초밥
(연어, 새우, 갑오징어, 광어, 대게, 한치, 날치알롤, 유부, 계란)',49000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (4,1,'모둠 해물탕','모둠해물탕.jpg','다양한 해물과 야채를 넣어 풍부한 맛이 일품인 모둠 해물탕',16000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (5,1,'모둠 해산물','모둠해산물.jpg','신선한 해물을 종류별로 다양하게 맛볼 수 있는 모둠 해산물',29000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (6,1,'모둠 회','모둠회.jpg','자연의 맛이 그대로 살아있어 입안에서 살아숨쉬는듯한 모둠 회
(광어, 우럭, 참돔, 연어)',55000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (7,1,'세꼬시','세꼬시.jpg','뼈까지 통째로 썰어 더욱 신선하고, 깊은 맛을 느낄 수 있는 세꼬시',49000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (8,1,'오코노미야끼','오코노미야끼.jpg','물에 푼 밀가루를 기본으로 고기나 어패류 및 야채를 재료로 철판에서 부쳐 소스를 뿌려 먹는 요리',13000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (1,2,'김치찌개','김치찌개.jpg','푹 익어 맛이 깊은 신김치와 숭덩숭덩 썰어넣은 신선한 돼지고기가 조화롭게 어우러진 맛있는 김치찌개',9000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (2,2,'낙지덮밥','낙지덮밥.jpg','매콤한 낙지와 비벼먹는 낙지덮밥',10000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (3,2,'돌솥비빔밥','돌솥비빔밥.jpg','보기만해도 배부를듯한 양과 푸짐한 구성의 돌솥비빔밥',9000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (4,2,'부대찌개','부대찌개.jpg','라면사리와 당면, 햄, 소시지 잘게 다진 고기 등 다양한 재료를 섞어 끓여먹는 맛있는 부대찌개',10000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (5,2,'소고기 육개장','소고기육개장.jpg','얼큰한 국물과 쫄깃쫄깃 맛좋은 소고기가 들어간 육개장',12000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (6,2,'소불고기덮밥','소불고기덮밥.jpg','푸짐한 양과 달달한 맛이 일품인 소불고기덮밥',11000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (7,2,'순두부찌개','순두부찌개.jpg','바지락과 순두부의 환상적인 맛',9000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (8,2,'차돌된장찌개','차돌된장찌개.jpg','구수한 맛과 맛있는 차돌박이가 일품인 차돌된장찌개',10000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (9,2,'철판치즈김치볶음밥','철판치즈김치볶음밥.jpg','아기자기한 비주얼과 한끼로 딱 좋은 양의 철판치즈김치볶음밥',9000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (10,2,'콩나물비빔밥','콩나물비빔밥.jpg','몸에 좋은 콩나물에 비벼먹는 콩나물비빔밥',9000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (3,3,'당근케이크(1조각)','당근케잌.jpg','칼로리 걱정 No!!!
입안에서 살살 녹아 디저트로 먹기 좋은 스윗한 당근케이크',7000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (1,3,'꽃등심스테이크','꽃등심스테이크.jpg','저지방 숙성 한우만을 고집하는 BoutBack SteakHouse의 꽃등심 스테이크',18000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (2,3,'칠리 나초','칠리 나초.jpg','신선한 토마토와 아삭한 피클, 칠리를 곁들인 바삭한 나초가 더해진 웰빙 간식',9000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (4,3,'랍스터테일','랍스터테일.jpg','고급스러운 랍스터 꼬리만을 맛있게 구워낸 메뉴',20000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (5,3,'바오밥 스테이크','바오밥스테이크.jpg','BoutBack SteakHouse의 대표 메뉴!!!
바오밥이라는 이름에 걸맞는 커다란 스테이크',20000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (6,3,'스테이크 샐러드','스테이크샐러드.jpg','고기를 먹으면서 다이어트도 할 수 있다고?
스테이크 샐러드',12000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (7,3,'안심스테이크','안심스테이크.jpg','갈릭소스의 풍부한 향이 고기맛을 한층 풍성하게 만들어주는 인기 상품',19000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (8,3,'연어 스테이크','연어스테이크.jpg','노르웨이 연어 특유의 맛을 느낄 수 있는 연어 스테이크',13000);
Insert into BAOBOB.RESTAURANT_MENU_TBL (RESTAURANT_MENU_INDEX,RESTAURANT_INDEX,RESTAURANT_MENU_NAME,RESTAURANT_MENU_IMG,RESTAURANT_MENU_CONTENT,RESTAURANT_MENU_PRICE) values (9,3,'쿼사디아','쿼사디아.jpg','요즘 뜨고있는 상품으로 불고기와 야채들의 맛을 느낄 수 있는 상품',8000);




--review_tbl
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (14,'5','There were eight of us all together and we all agreed that the streak was the best dish on the menu.','trump',2,to_timestamp('18/01/30 11:50:13.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (15,'4','드라이에이징스테이크를 가성비 좋게 먹기 딱좋은 레스토랑이라고 생각합니닷','ybh',2,to_timestamp('18/01/30 11:51:23.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (1,'4','가끔 가는 곳인데 맛과 서비스 모두 일본에서 먹는 오마카세 보다 만족스러웠어요.','mhj',2,to_timestamp('18/01/30 11:28:03.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (2,'4','제가 너무 맛있다고 한 음식을 또 알아채시고 안내도 해주시고..
지금까지 가본 일식당중에 젤 만족 스러웠습니다. ','chg',2,to_timestamp('18/01/30 11:29:16.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (3,'5','음식 나오는 속도도 아주 적절하고 제대로 서비스 받았다는 느낌이 들었습니다. 또 과하지 않은 친근한 서비스를 해주셨던 홀 직원분들도 감사드립니다.','ymk',2,to_timestamp('18/01/30 11:30:50.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (4,'5','허름한 상가 내 있지만 조용한 분위기에서 맛있는 스시를 먹을 수 있습니다. ','phc',2,to_timestamp('18/01/30 11:33:14.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (5,'5','보통 미들급 스시집라고 불리우는 매장중 가장 좋아보입니다. 회의 질이 매우 좋고 밥맛도 좋아요. 가격도 합리적인 편이라 부담이 적어서 좋습니다','kjw',2,to_timestamp('18/01/30 11:34:25.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (6,'4','미슐랭 선정 레스토랑이라 기대를 하고 가족끼리 갔는데 너무 좋았어요!
','kjw',2,to_timestamp('18/01/30 11:36:15.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (7,'3','가격이 좀 비싸다고 생각들었는데 양껏 먹을수 있으니 터무니 없는 가격은 아니더라고요
김치는 마늘향이 좀 쎈 편이에요','phc',2,to_timestamp('18/01/30 11:36:49.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (8,'4','비빔밥위의 고명하나하나 정갈하고, 고유의 맛을 가지고 있어,
제대로 비빔밥을 즐기기에 좋은 곳이라고 생각합니다.','mhj',2,to_timestamp('18/01/30 11:38:20.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (9,'3','가격도 저렴한 편이고, 메뉴도 다양하고 좋아요~','chg',2,to_timestamp('18/01/30 11:39:03.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (10,'4','고기도 맛있는데 김치찌개 너무 맛있어요 근데 양이 적어보이는데도 막상 먹으면 여러명이서 먹을수있어서 더 좋아요','khs',2,to_timestamp('18/01/30 11:39:45.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (11,'5','훌륭한 수준의 음식과 서비스지만 가격은 그 이상인 것 같다는 생각이 듭니다','psn',2,to_timestamp('18/01/30 11:43:47.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (12,'4','스테이크 두께,향, 질감 모두 만족해요.
이것저것 다 먹어보고 싶었어요. 역시 가격 아깝지 않았어요.','kji',2,to_timestamp('18/01/30 11:44:46.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into BAOBOB.REVIEW_TBL (REVIEW_INDEX,REVIEW_GRADE,REVIEW_CONTENT,MEMBER_ID,REVIEW_STATE,REVIEW_REG_DATE) values (13,'5','오~~~맨~ 스테이크 너무 맛있어요! 육즙도 안빠지고 살살 녹아요~강추!!!','khs',2,to_timestamp('18/01/30 11:45:49.000000000','RR/MM/DD HH24:MI:SSXFF'));
--restaurant_review_tbl
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (14,3);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (15,3);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (1,1);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (2,1);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (3,1);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (4,1);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (5,1);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (6,2);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (7,2);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (8,2);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (9,2);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (10,2);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (11,3);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (12,3);
Insert into BAOBOB.RESTAURANT_REVIEW_TBL (REVIEW_INDEX,RESTAURANT_INDEX) values (13,3);
COMMIT;






