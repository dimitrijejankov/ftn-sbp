-- Checks if Journal Vaucher Template Entry with the provided account exists.
create or replace FUNCTION FN_JVT_ENTRY_EXISTS(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T)
RETURN BOOLEAN IS
ENT_COUNT NUMBER(6);
BEGIN
  SELECT COUNT(*) INTO ENT_COUNT FROM "Journal Vaucher Template Entry" v WHERE v.AC_ID = SOURCE.AC_ID AND v.CA_ID=SOURCE.CA_ID;
  IF ENT_COUNT = 0 THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;
END FN_JVT_ENTRY_EXISTS;