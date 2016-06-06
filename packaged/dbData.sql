--------------------------------------------------------
--  File created - Monday-June-06-2016   
--------------------------------------------------------
REM INSERTING into DIMITRIJEJANKOV."Account"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Account" (CA_ID,AC_ID,AC_NAME) values (1,'51','Prihod 1');
Insert into DIMITRIJEJANKOV."Account" (CA_ID,AC_ID,AC_NAME) values (1,'62','Dug 1');
Insert into DIMITRIJEJANKOV."Account" (CA_ID,AC_ID,AC_NAME) values (2,'51','Prihod 1');
Insert into DIMITRIJEJANKOV."Account" (CA_ID,AC_ID,AC_NAME) values (2,'62','Dug 1');
Insert into DIMITRIJEJANKOV."Account" (CA_ID,AC_ID,AC_NAME) values (1,'511','Pod Prihod 1');
REM INSERTING into DIMITRIJEJANKOV."Accountant User Group"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Accountant User Group" (SUG_ID,SUG_NAME) values (1,'Grupa 1');
Insert into DIMITRIJEJANKOV."Accountant User Group" (SUG_ID,SUG_NAME) values (2,'Grupa 2');
REM INSERTING into DIMITRIJEJANKOV."BS Has COA"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."BS Has COA" (CA_ID,BS_ID) values (1,1);
Insert into DIMITRIJEJANKOV."BS Has COA" (CA_ID,BS_ID) values (2,1);
REM INSERTING into DIMITRIJEJANKOV."Business"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Business" (BS_ID,SUG_ID,BS_NAME,BS_MBR,BS_PIB,BS_ADDRESS,BS_WEB_PAGE,BS_EMAIL,BS_TELEPHONE,BS_FAX) values (1,1,'Biznis 1','123','123','xyz','xyz','mail','9998','9999');
Insert into DIMITRIJEJANKOV."Business" (BS_ID,SUG_ID,BS_NAME,BS_MBR,BS_PIB,BS_ADDRESS,BS_WEB_PAGE,BS_EMAIL,BS_TELEPHONE,BS_FAX) values (2,1,'Biznis 2','321','321','qwe','qwe','mail2','8888','8889');
REM INSERTING into DIMITRIJEJANKOV."Chart of Accounts"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Chart of Accounts" (CA_ID,CA_DESCRIPTION,CA_YEAR) values (1,'Chart of Accounts 1',to_date('08-JUN-16','DD-MON-RR'));
Insert into DIMITRIJEJANKOV."Chart of Accounts" (CA_ID,CA_DESCRIPTION,CA_YEAR) values (2,'Chart of Accounts 2',to_date('16-JUN-16','DD-MON-RR'));
REM INSERTING into DIMITRIJEJANKOV."Journal Vaucher"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Journal Vaucher" (JV_ID,CA_ID,SU_ID,JV_CODE,JV_DOCUMENT_NUMBER,JV_DATE_OF_RECORDING,JV_DATE_OF_CURRENCY) values (1,1,1,23,23,to_date('02-JUN-16','DD-MON-RR'),to_date('10-JUN-16','DD-MON-RR'));
REM INSERTING into DIMITRIJEJANKOV."Journal Vaucher Template"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Journal Vaucher Template" (JVT_ID,BS_PART_ID,BS_ID) values (1,2,1);
REM INSERTING into DIMITRIJEJANKOV."Journal Vaucher Template Entry"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Journal Vaucher Template Entry" (JVTE_ID,CA_ID,AC_ID,JVT_ID,BS_ID,JVTE_DESCRIPTION,JVTE_DEBITS,JVTE_CREDITS) values (1,2,'51',1,1,'xyz',10,0);
Insert into DIMITRIJEJANKOV."Journal Vaucher Template Entry" (JVTE_ID,CA_ID,AC_ID,JVT_ID,BS_ID,JVTE_DESCRIPTION,JVTE_DEBITS,JVTE_CREDITS) values (2,2,'62',1,2,'qwe',0,10);
REM INSERTING into DIMITRIJEJANKOV."Software User"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Software User" (SU_ID,SUG_ID,SU_EMAIL,SU_PASSWORD,SU_TYPE,SU_NAME,SU_LASTNAME) values (1,1,'dimitrije@gmail.com','xyz','U','Dimitrije','Jankov');
Insert into DIMITRIJEJANKOV."Software User" (SU_ID,SUG_ID,SU_EMAIL,SU_PASSWORD,SU_TYPE,SU_NAME,SU_LASTNAME) values (2,2,'vladimir@gmai.com','qwe','U','Vladimir','Jankov');
REM INSERTING into DIMITRIJEJANKOV."Vaucher Entry"
SET DEFINE OFF;
Insert into DIMITRIJEJANKOV."Vaucher Entry" (JVE_ID,JV_ID,SUG_ID,VET_ID,BS_ID,CA_ID,AC_ID,JVE_DESCRIPTION,JVE_DEBITS,JVE_CREDITS) values (1,1,1,null,1,1,'511','xyz',10,0);
Insert into DIMITRIJEJANKOV."Vaucher Entry" (JVE_ID,JV_ID,SUG_ID,VET_ID,BS_ID,CA_ID,AC_ID,JVE_DESCRIPTION,JVE_DEBITS,JVE_CREDITS) values (2,1,1,null,1,1,'511','qwe',0,10);
REM INSERTING into DIMITRIJEJANKOV."Vaucher Entry Type"
SET DEFINE OFF;
