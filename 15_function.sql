
-- ascii(아스키 코드), char(숫자)
SELECT ASCII('a'), CHAR(97);

-- bit_length(문자열), char_length(문자열), length(문자열)
-- 영어, 숫자, 특수기호 제외한 문자당 3바이트 할당
SELECT
		 BIT_LENGTH('한글')
	  , CHAR_LENGTH('한글')
	  , LENGTH('한글');

-- concat(문자열1, 문자열2, ...), concat_ws(구분자, 문자열1, 문자열2)
SELECT CONCAT('nice', ' to', ' meet', ' you!');
SELECT CONCAT_WS('^', 'nice', 'to', 'meet', 'you!');
SELECT CONCAT(CAST(menu_price AS CHAR), '원') FROM tbl_menu;

-- ELT(위치, 문자열1, 문자열2, ...), FIELD(찾을 문자열, 문자열1, 문자열2, ...),
-- FIND_IN_SER(찾을 문자열, 문자열 리스트), INSTR(기준 문자열, 부분 문자열),
-- LOCATE(부분 문자열, 기준 문자열)
SELECT
		 ELT(2, '축구', '야구', '농구')
	  , FIELD('축구', '야구', '농구', '축구')
	  , FIND_IN_SET('축구', '야구,농구,축구')
	  , INSTR('축구농구야구', '농구')
	  , LOCATE('야구', '축구농구야구');  -- INSTR과 LOCATE는 서로 인자가 반대

-- INSERT(기준 문자열, 위치, 해당 위치에서 지울 길이, 삽입할 문자열)
SELECT INSERT('나와라 피카츄!', 5, 3, '꼬부기');

-- LEFT(문자열, 길이), RIGHT(문자열, 길이)
SELECT LEFT('Hello World!', 5), RIGHT('Nice Shot!', 5);

-- UPPER(문자열), LOWER(문자열)
SELECT LOWER('Hello World!'), UPPER('Hello World!');

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열)
SELECT LPAD('왼쪽', 10, '#'), RPAD('오른쪽', 10, '#'); -- 좌측 정렬, 우측 정렬 효과낼 수 있다.

-- LTRIM(문자열), RTRIM(문자열)
-- TRIM(문자열), TRIM(방향 자를_문자열 FROM 문자열)
SELECT LTRIM('       왼쪽'), RTRIM('오른쪽       ');
SELECT TRIM('       MariaDB       ')
	  , TRIM(BOTH '@' FROM '@@@@MariaDB@@@@')
	  , TRIM(LEADING '@' FROM '@@@@MariaDB@@@@')   -- LTRIM
	  , TRIM(TRAILING '@' FROM '@@@@MariaDB@@@@'); -- RTRIM

SELECT concat(menu_name, '의 가격은', menu_price, '입니다.') FROM tbl_menu;

-- FORMAT(숫자, 소수점 자릿수)
SELECT FORMAT(12312314566, 3);

-- BINT(숫자), OCT(숫자), HEX(숫자) ->2, 8, 16진수로
SELECT BIN(65), OCT(65), HEX(65);

-- 

SELECT REPEAT('재미져', 5);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
SELECT REPLACE('마리아DB', '마리아', 'Maria');

-- REVERSE(문자열) -> 문자 거꾸로
SELECT REVERSE('happiness');

-- /
SELECT CONCAT('제 포켓몬은', SPACE(3), '이고, 속성은', SPACE(6), '입니다.');

-- SUBSTRING(문자열, 시작위치, 길이) -> 시작위치에서 길이만큼 추출, 이때 길이는 생략 가능
SELECT SUBSTRING('열심히 db공부를 해봅시다!', 5, 4)
	  , SUBSTRING('열심히 db공부를 해봅시다!', 11); -- 11번째 문자부터 끝까지

-- SUBSTRING_INDEX(문자열,구분자, 횟수)
SELECT
		 SUBSTRING_INDEX('010-123-1234', '-', 2)     -- 앞에서 구분자 기준 2묶음
	  , SUBSTRING_INDEX('010-123-1234', '-', -1);   -- 뒤에서 구분자 기준 1묶음


	  
-- 2. 숫자 관련 함수

-- ABS(숫자)
SELECT ABS(-123);

-- CEILING(숫자)-올림, FLOOR(숫자)-버림, ROUND(숫자)-반올림
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10), CONV('A', 16, 2);

-- MOD(숫자1, 숫자2) -- 나머지
SELECT MOD(10,3), 10 % 3;

-- POW(숫자1, 숫자2): 3의 2제곱, SQRT(숫자): 루트81
SELECT POW(3, 2), SQRT(81);

-- RAND()
-- FLOOR(RAND() * 생성할 난수 개수 + 난수의 초기값)
SELECT FLOOR(RAND() * 4 + 5), FLOOR(RAND() * 4) + 5;

-- SIGN(숫자) -- ?
SELECT SIGN(10.1), SIGN(0), SIGN(-1.1);

-- TRUNCATE(숫자, 정수) -- 소수점 정수자리까지 표시
SELECT TRUNCATE(12345.12345, 2),
		 TRUNCATE(12345.12745, 2);


-- 3. 날짜 및 시간 관련 함수

-- ADDDATE(날짜, 차이): 일자 더하기, SUBDATE(날짜, 차이) -- 윤년 고려하여 계산해줌!
SELECT ADDDATE('2020-02-01', INTERVAL 28 DAY),
		 ADDDATE('2020-02-01', 28),
		 SUBDATE('2020-02-01', INTERVAL 1 DAY),
		 SUBDATE('2020-02-01', 1);

SELECT ADDDATE('2020-02-01', INTERVAL 28 MONTH),
		 SUBDATE('2020-02-01', INTERVAL 1 MONTH);

-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
SELECT ADDTIME('2023-12-28 10:27:00', '11:0:10'), SUBTIME('2023-12-28 10:27:00', '11:0:10');

-- CURDATE(), CURTIME(), NOW(), SYSDATE()-> 컴퓨터 시스템 시간을 뉴욕으로 설정시 뉴욕 시간을 보여줌.
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

SELECT @@GLOBAL.TIME_ZONE; -- 현재 타임존 기준을 확인하는 조회문

-- YEAR(날짜), MONTH(날짜), DAY(날짜) -- CAST?
-- DATE(날짜/시간) -> 날짜만 추출, TIME(날짜/시간) -> 시간만 추출
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAY(CURDATE()), DAY(CAST('2023-12-28' AS DATE));
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURTIME()), MICROSECOND(CURTIME());

SELECT DATE(NOW()), TIME(NOW());

-- DATEDIFF(날짜1, 날짜2), TIMEDIFF(날짜1 또는 시간1, 날짜2 또는 시간2)
SELECT DATEDIFF('2024-06-14', '2023-12-28'),
		 TIMEDIFF('2023-12-29 22:01', '2023-12-28 02:00'), TIMEDIFF('22:00:00', CURTIME());

-- DAYOFWEEK(날짜): 일요일부터 시작, MONTHNAME(날짜): 월, DAYOFYEAR(날짜): 1년 기준 며칠 지났는지
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜): 달의 마지막 날짜
SELECT LAST_DAY('20230201');

-- MAKEDATE(연도, 지난 날)
SELECT MAKEDATE(2023, 35);

-- MAKETIME(시, 분, 초)
SELECT MAKETIME(17, 50, 01);

-- QUARTER(날짜) -- 1~4분기 표시
SELECT QUARTER('2023-12-28');

-- TIME_TO_SEC(시간) -- 오늘 흐른 시간(초)
SELECT TIME_TO_SEC(CURTIME()), TIME_TO_SEC('0:1:0');

