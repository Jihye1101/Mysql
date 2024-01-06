-- distinct
-- distinct는 해당 컬럼의 종류를 보여준다. 메뉴가 존재하는 카테고리의 종류를 보여줌.
SELECT
		 DISTINCT category_code
	  , menu_name
  FROM tbl_menu;

-- distinct 사용 시에는 일반 컬럼을 사용할 수 없다.(distinct가 무의미해지기 때문에)
SELECT
		 DISTINCT category_code
-- 	  , menu_name
  FROM tbl_menu;

-- category테이블(tbl_category) 모두 표시
SELECT
		 *
  FROM tbl_category;
  
-- null값을 포함한 컬럼의 distinct
SELECT
		 DISTINCT ref_category_code
  FROM tbl_category;

-- null값을 나중으로 보내는 정렬을 해보자.
SELECT
		 DISTINCT ref_category_code
  FROM tbl_category
 ORDER BY 1 DESC;
--  이거.. 몰까...
 
SELECT
		 DISTINCT ref_category_code AS 'rcc' -- null값을 포함한 컬럼의 distinct를 별칭이라는 변수로 지정
  FROM tbl_category
 ORDER BY -rcc DESC; 
 -- >>어제 배운 내용(DESC 통해 null을 맨뒤로 보내면서 row 순서 뒤집힘.
 --   이때, -[null이 아닌 놈들만 순서 뒤집음]사용하여 순서 원래대로)
 
-- 기본 정렬의 개념(순번이나 별칭을 사용하지 않고는 정렬할 수 없다.)은
-- syntax에러(문법 에러)가 발생한다.
 SELECT
		 DISTINCT ref_category_code
  FROM tbl_category
 ORDER BY DISTINCT ref_category_code DESC; -- 에러발생 
 
-- --------------------------------------
-- 컬럼 두개 이상도 distinct로 묶을 수는 있지만 좋은 형태는 아니다.
-- 컬럼 두개 이상부터는 이후 배울 group by절을 통해 중복 제거를 하자.
SELECT
		 DISTINCT category_code, orderable_status
  FROM tbl_menu;practicepractice