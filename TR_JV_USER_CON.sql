create or replace TRIGGER TR_JV_USER_CON 
BEFORE INSERT OR UPDATE ON "Journal Vaucher" 
FOR EACH ROW 
DECLARE

COUNT_V NUMBER;

BEGIN

SELECT COUNT(*) INTO COUNT_V FROM "Business" b, "BS Has COA" bhc, "Accountant User Group" aug, "Software User" u
WHERE b.BS_ID = bhc.BS_ID AND :NEW.CA_ID=bhc.CA_ID AND b.SUG_ID = aug.SUG_ID AND u.SUG_ID=aug.SUG_ID AND u.SU_ID = :NEW.SU_ID;

IF COUNT_V = 0 THEN
  Raise_Application_Error(-20000, 'User must be a part of Accountant User Group that is managing the business');
END IF;

END;