SELECT * FROM tbl_menu;

SELECT
		 *
  FROM tbl_menu
 LIMIT 0, 5;  -- LIMIT 시작 인덱스, 시작 인덱스부터 조회할 행의 개수 
 
-- 6행부터 5개의 메뉴 행 조회
SELECT
		 *
  FROM tbl_menu
 LIMIT 5, 5;
 
-- LIMIT의 offset 생략 시
SELECT
		 *
  FROM tbl_menu;
  
SELECT
		 *
  FROM tbl_menu;
--  LIMIT 0, 5;
 LIMIT 5;
 
-- Limit룰 자주 쓰진 않지만 이후 TOP-N분석이나 paging 처리를 할 때 사용된다.

