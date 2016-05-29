-- Checks if a vaucher entry for the provided acount exists
create or replace FUNCTION FN_ENTRY_EXISTS(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T)
RETURN BOOLEAN IS
ENT_COUNT NUMBER(6);
BEGIN
  SELECT COUNT(*) INTO ENT_COUNT FROM "Vaucher Entry" v WHERE v.AC_ID = SOURCE.AC_ID AND v.CA_ID=SOURCE.CA_ID;
  IF ENT_COUNT = 0 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;
END FN_ENTRY_EXISTS;