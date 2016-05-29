-- Checks if the string is a number between 0 and 999
create or replace FUNCTION is_number (p_string IN VARCHAR2)
   RETURN INT
IS
   v_new_num NUMBER;
BEGIN
   v_new_num := TO_NUMBER(p_string, '999');
   RETURN 1;
EXCEPTION
WHEN VALUE_ERROR THEN
   RETURN 0;
END is_number;