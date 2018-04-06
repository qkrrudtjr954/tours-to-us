SELECT TITLE, SEQ, CONTENT, PIC1,CATEGORY, NAME, likecount
	FROM 
	( SELECT ROW_NUMBER() OVER (ORDER BY   E.REG_DATE DESC) as rnum,  
		TITLE, E.SEQ, CONTENT, PIC1, 
		(SELECT TITLE FROM EDITORCATEGORY WHERE SEQ = E.TARGET_CATEGORY_SEQ) AS CATEGORY, T.NAME, 
		(select count(*) from liketable C where E.seq = C.target_bbs_seq and C.bbs_category=3) as likecount
		FROM EDITOR E, TRAVELER T
		WHERE T.SEQ = E.TARGET_USER_SEQ  
		) A
		WHERE rnum between 1 AND 10
		
		SELECT*FROM LIKETABLE;
		
		SELECT (select count(*) from liketable C where E.seq = C.target_bbs_seq and C.bbs_category=3) as LIKECOUNT 
		FROM EDITOR E
		
		SELECT TITLE, (SELECT COUNT(*) FROM LIKETABLE  WHERE SEQ = ) AS LIKECOUNT 
		
		
		SELECT A.SEQ, A.TITLE, A.PIC1, A.CONTENT, A.TARGET_USER_SEQ, A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT,B.EMAIL AS USER_EMAIL,
		(select count(*) from liketable b where a.seq = b.target_bbs_seq and b.bbs_category=2) as likecount 
		FROM AFTERBBS A, DENGUSER B  
		WHERE A.TARGET_USER_SEQ = B.SEQ 
		ORDER BY REG_DATE DESC 
		
		SELECT*FROM ANIMALBBS;
		
		
		SELECT A.SEQ, A.TITLE, A.NAME, A.AGE,  A.KINDS, A.TYPE, A.LOCATION, A.MEDICINE, A.NEUTRALIZATION,  
		A.GENDER, A.DESCRIPTTION, A.PIC1, A.CONTENT,  A.TARGET_USER_SEQ, A.TARGET_CONTACT, A.TARGET_DESCRIPTION, 
		A.REG_DATE, A.LAST_UPDATE, A.DEL, A.READCOUNT, A.TARGET_COMPLETE_EMAIL, B.EMAIL AS USER_EMAIL,	
		(select count(*) from liketable C where a.seq = C.target_bbs_seq and C.bbs_category=1) as LIKECOUNT 
		FROM ANIMALBBS A,  DENGUSER B 
		WHERE A.TARGET_USER_SEQ = B.SEQ  AND A.DEL NOT IN 1 
		ORDER BY REG_DATE DESC
		
		
		SELECT TITLE, SEQ, CONTENT, PIC1,CATEGORY, NAME, LIKE_COUNT
		FROM 
		( SELECT ROW_NUMBER() OVER (ORDER BY LIKE_COUNT DESC) as rnum,  
		TITLE, E.SEQ, CONTENT, PIC1, 
		(SELECT TITLE FROM EDITORCATEGORY WHERE SEQ = E.TARGET_CATEGORY_SEQ) AS CATEGORY, T.NAME, 
		(select count(*) from liketable C where E.seq = C.target_bbs_seq and C.bbs_category=3) as LIKE_COUNT
		FROM EDITOR E, TRAVELER T
		WHERE T.SEQ = E.TARGET_USER_SEQ  
		) A
		WHERE rnum between 1 AND 10
		
		
		SELECT * FROM EDITOR
		SELECT E.SEQ, T.NAME, C.TITLE, E.TITLE, E.PIC1, (select count(*) from liketable b where a.seq = b.target_bbs_seq and b.bbs_category=2) AS LIKE_COUNT
		FROM EDITOR E, TRAVELER T, CATEGORY C 
		
		
		SELECT TITLE, PIC1, TARGET_USER_SEQ, (select count(*) from liketable B, EDITOR E where E.seq = b.target_bbs_seq and b.bbs_category=3) AS LIKE_COUNT
		FROM EDITOR