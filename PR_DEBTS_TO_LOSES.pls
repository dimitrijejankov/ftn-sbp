CREATE OR REPLACE PROCEDURE PR_DEBTS_TO_LOSES 
(SRC_CA_ID IN "Account".CA_ID%TYPE) AS 

ACCOUNTS TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ARRAY_T;

DST TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T;

BEGIN
  -- Transfer all the entries for the loses (351) of this year to the cumulative loses (350)
  SELECT a.CA_ID, a.AC_ID 
  BULK COLLECT INTO ACCOUNTS 
  FROM "Account" a 
  WHERE a.CA_ID=SRC_CA_ID AND a.CA_ID = '351';
  
  DST.CA_ID := SRC_CA_ID;
  DST.AC_ID := '350';
  
  FOR idx in 1..ACCOUNTS.COUNT LOOP
    PR_REWIRE_JOURNAL_VAUCHER(ACCOUNTS(idx), DST);
  END LOOP;
  
  -- Transfer the unpaid captial (00 or 31) to the loses for the current year (351) 
  SELECT a.CA_ID, a.AC_ID 
  BULK COLLECT INTO ACCOUNTS 
  FROM "Account" a WHERE 
  a.CA_ID=SRC_CA_ID AND (a.CA_ID LIKE '00*' OR a.CA_ID LIKE '31*');
  
  DST.CA_ID := SRC_CA_ID;
  DST.AC_ID := '351';

  
END PR_DEBTS_TO_LOSES;