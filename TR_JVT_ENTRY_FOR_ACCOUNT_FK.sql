create or replace TRIGGER TR_JVT_ENTRY_FOR_ACCOUNT_FK 
BEFORE INSERT OR UPDATE OF AC_ID ON "Journal Vaucher Template Entry" 
FOR EACH ROW 
DECLARE
SRC TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T;
BEGIN
  SRC.AC_ID := :NEW.AC_ID;
  SRC.CA_ID := :NEW.CA_ID;

  IF TG_PARENT_ACCOUNT_PACKAGE.VE_ACC_FK_UPDATE_ENABLED AND NOT (FN_ACCOUNT_EXISTS (SRC)) THEN
    Raise_Application_Error (-20000, 'No account with this ID');
  END IF;
END;