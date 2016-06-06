create or replace PACKAGE PR_MAIN_PACKAGE AS 

FUNCTION FN_ACCOUNT_EXISTS(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T) RETURN BOOLEAN;
FUNCTION FN_CHILD_ACCOUNT_EXISTS(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T) RETURN BOOLEAN;
FUNCTION FN_ENTRY_EXISTS(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T) RETURN BOOLEAN;
FUNCTION FN_JVT_ENTRY_EXISTS(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T) RETURN BOOLEAN;
FUNCTION FN_TABLE_HAS_INDEX(IN_TABLE IN PR_INCOME_STATMENT_PACKAGE.STATMENTS_T, IN_INDEX IN VARCHAR2) RETURN BOOLEAN;
FUNCTION is_number(p_string IN VARCHAR2) RETURN INT;

PROCEDURE PR_DEBTS_TO_LOSES(SRC_CA_ID IN "Account".CA_ID%TYPE);
PROCEDURE PR_GENERAL_LEDGER(BUSINESS_ID IN "Business".BS_ID%TYPE, REPORT OUT PR_GL_PACKAGE.GL_T);
PROCEDURE PR_INCOME_STATMENT(BUSINESS_ID IN "Business".BS_ID%TYPE);

PROCEDURE PR_NEXT_YAER_COPY(ADDITION IN PR_NEXT_YEAR_PACKAGE.ACCOUNTS_T, 
							DELITION IN PR_NEXT_YEAR_PACKAGE.ACCOUNTS_T, 
							SRC_CA_ID IN "Chart of Accounts".CA_ID%TYPE, 
							DST_CA_ID IN "Chart of Accounts".CA_ID%TYPE);

PROCEDURE PR_POPULATE_WITH_TEMPLATE(BUSINESS_ID IN "Business".BS_ID%TYPE,
									FOR_BUSINESS_ID IN "Business".BS_ID%TYPE,
									JOURNAL_VAUCHER_CODE IN "Journal Vaucher".JV_CODE%TYPE,
									DOCUMENT_NUMBER IN "Journal Vaucher".JV_DOCUMENT_NUMBER%TYPE,
									SOFTWARE_USER_ID IN "Software User".SU_ID%TYPE, 
									DATE_OF_RECORDING IN "Journal Vaucher".JV_DATE_OF_RECORDING%TYPE,
									DATE_OF_CURRENCY IN "Journal Vaucher".JV_DATE_OF_CURRENCY%TYPE,
									AMOUNT IN "Vaucher Entry".JVE_DEBITS%TYPE);

PROCEDURE PR_REWIRE_JOURNAL_VAUCHER(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T, 
									TARGET IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T);

PROCEDURE PR_REWIRE_JVT(SOURCE IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T, TARGET IN TG_PARENT_ACCOUNT_PACKAGE.ACCOUNT_ID_T);


END PR_MAIN_PACKAGE;