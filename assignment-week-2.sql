CREATE SCHEMA IF NOT EXISTS VIDEOS;
USE VIDEOS;


CREATE TABLE VIDEOS (ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, TITLE VARCHAR(255), LENGHT INT, URL TEXT );
CREATE TABLE REVIEWERS (USERNAME VARCHAR(255), RATING VARCHAR(1) NULL, REVIEW TEXT, FK_VIDEOS_ID INT NOT NULL, 
FOREIGN KEY (FK_VIDEOS_ID) REFERENCES VIDEOS(ID));

/* DROP TRIGGER IF EXISTS `TEST_RATING`*/
DELIMITER $$

CREATE TRIGGER TEST_RATING BEFORE INSERT ON REVIEWERS
FOR EACH ROW
BEGIN
	IF NEW.RATING NOT IN ('0','1','2','3','4','5') THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CHECK CONSTRAINT ON REVIEWERS.RATING FAILED';
	END IF;
    END $$
    
    
USE VIDEOS;
INSERT INTO VIDEOS  (title, lenght,url) values("Regenerating ALL 4 Champions' Powers SAME TIME! What's gonna happens? in Zelda Breath of the Wild", 
236, "https://www.youtube.com/watch?v=n2k6_BogMug"), ("The BEST Budget 4K Camera! $500 STEAL - Panasonic Lumix DMC-G7 Review (G7 Review)",
602, "https://www.youtube.com/watch?v=wbLpH5TewnM"), ("$350 20MP 4K Mirrorless Camera", 456, "https://www.youtube.com/watch?v=swXRU4S62BU");

USE VIDEOS;
INSERT INTO REVIEWERS (username, RATING,review,fk_videos_id) VALUES ("Robert",'4',"I like it but it can improve",1), 
("James",'2',"I don't like it",2),("Victor",5,"Keep up the good work",3),("Frank",'3',"I agree on half of what you say",1),
("Phillip",null,"I don't know what I'm doing",2);


select * from VIDEOS a join REVIEWERS b on a.id = b.fk_videos_id order by 1;

    
   


