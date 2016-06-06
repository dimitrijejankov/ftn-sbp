/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     6/6/2016 3:24:02 AM                          */
/*==============================================================*/


alter table "Account"
   drop constraint "FK_ACCOUNT_HAS AN AC_CHART OF";

alter table "BS Has COA"
   drop constraint "FK_BS HAS C_BUSSINESS_CHART OF";

alter table "BS Has COA"
   drop constraint "FK_BS HAS C_REFERENCE_BUSINESS";

alter table "Business"
   drop constraint "FK_BUSINESS_GROUP HAS_ACCOUNTA";

alter table "Journal Vaucher"
   drop constraint "FK_JOURNAL _BUSINESS _CHART OF";

alter table "Journal Vaucher"
   drop constraint "FK_JOURNAL _REFERENCE_SOFTWARE";

alter table "Journal Vaucher Template"
   drop constraint "FK_JOURNAL _HAS TEMPL_BUSINESS";

alter table "Journal Vaucher Template"
   drop constraint "FK_JOURNAL _TEMPLATE _BUSINESS";

alter table "Journal Vaucher Template Entry"
   drop constraint "FK_JOURNAL _ACCOUNT F_ACCOUNT";

alter table "Journal Vaucher Template Entry"
   drop constraint "FK_JOURNAL _BUSSINES _BUSINESS";

alter table "Journal Vaucher Template Entry"
   drop constraint "FK_JOURNAL _VAUCHER T_JOURNAL";

alter table "Software User"
   drop constraint "FK_SOFTWARE_BELONGS T_ACCOUNTA";

alter table "Vaucher Entry"
   drop constraint "FK_VAUCHER _ENTRY FOR_ACCOUNT";

alter table "Vaucher Entry"
   drop constraint "FK_VAUCHER _ENTRY FOR_BUSINESS";

alter table "Vaucher Entry"
   drop constraint "FK_VAUCHER _ENTRY IS _VAUCHER";

alter table "Vaucher Entry"
   drop constraint "FK_VAUCHER _JOURNAL V_JOURNAL";

alter table "Vaucher Entry Type"
   drop constraint "FK_VAUCHER _GROUP HAS_ACCOUNTA";

drop index HAS_AN_ACCOUNT_FK;

alter table "Account"
   drop primary key cascade;

drop table "Account" cascade constraints;

alter table "Accountant User Group"
   drop primary key cascade;

drop table "Accountant User Group" cascade constraints;

drop table "BS Has COA" cascade constraints;

drop index BUSSINESS_HAS_ACCOUNTS2_FK;

drop index GROUP_HAS_BUSINESS_FK;

alter table "Business"
   drop primary key cascade;

drop table "Business" cascade constraints;

alter table "Chart of Accounts"
   drop primary key cascade;

drop table "Chart of Accounts" cascade constraints;

drop index BUSINESS_HAS_VAUCHERS_FK;

alter table "Journal Vaucher"
   drop primary key cascade;

drop table "Journal Vaucher" cascade constraints;

drop index TMP_FOR_BP_FK;

drop index HAS_TEMPLATES_FK;

alter table "Journal Vaucher Template"
   drop primary key cascade;

drop table "Journal Vaucher Template" cascade constraints;

drop index BP_FOR_TE_FK;

drop index ACCOUNT_FOR_TEMPLATE_ENTRY_FK;

drop index VAUCHER_TEMPLATE_HAS_FK;

alter table "Journal Vaucher Template Entry"
   drop primary key cascade;

drop table "Journal Vaucher Template Entry" cascade constraints;

drop index BELONGS_TO_USERGROUP_FK;

alter table "Software User"
   drop primary key cascade;

drop table "Software User" cascade constraints;

drop index ENTRY_FOR_BUSINESS_PARTNER_FK;

drop index ENTRY_FOR_ACCOUNT_FK;

drop index JOURNAL_VAUCHER_HAS_ENTRIES_FK;

drop index ENTRY_IS_OF_TYPE_FK;

alter table "Vaucher Entry"
   drop primary key cascade;

drop table "Vaucher Entry" cascade constraints;

drop index GROUP_HAS_VET_FK;

alter table "Vaucher Entry Type"
   drop primary key cascade;

drop table "Vaucher Entry Type" cascade constraints;

/*==============================================================*/
/* Table: "Account"                                             */
/*==============================================================*/
create table "Account" 
(
   CA_ID                INTEGER              not null,
   AC_ID                VARCHAR(3)           not null,
   AC_NAME              VARCHAR2(60)         not null
);

alter table "Account"
   add constraint PK_ACCOUNT primary key (CA_ID, AC_ID);

/*==============================================================*/
/* Index: HAS_AN_ACCOUNT_FK                                     */
/*==============================================================*/
create index HAS_AN_ACCOUNT_FK on "Account" (
   CA_ID ASC
);

/*==============================================================*/
/* Table: "Accountant User Group"                               */
/*==============================================================*/
create table "Accountant User Group" 
(
   SUG_ID               INTEGER              not null,
   SUG_NAME             VARCHAR2(60)         not null
);

alter table "Accountant User Group"
   add constraint "PK_ACCOUNTANT USER GROUP" primary key (SUG_ID);

/*==============================================================*/
/* Table: "BS Has COA"                                          */
/*==============================================================*/
create table "BS Has COA" 
(
   CA_ID                INTEGER,
   BS_ID                INTEGER
);

/*==============================================================*/
/* Table: "Business"                                            */
/*==============================================================*/
create table "Business" 
(
   BS_ID                INTEGER              not null,
   SUG_ID               INTEGER              not null,
   BS_NAME              VARCHAR2(60)         not null,
   BS_MBR               VARCHAR2(60)         not null,
   BS_PIB               VARCHAR2(60)         not null,
   BS_ADDRESS           VARCHAR2(60),
   BS_WEB_PAGE          VARCHAR2(200),
   BS_EMAIL             VARCHAR2(60),
   BS_TELEPHONE         VARCHAR2(60),
   BS_FAX               VARCHAR2(60)
);

alter table "Business"
   add constraint PK_BUSINESS primary key (BS_ID);

/*==============================================================*/
/* Index: GROUP_HAS_BUSINESS_FK                                 */
/*==============================================================*/
create index GROUP_HAS_BUSINESS_FK on "Business" (
   SUG_ID ASC
);

/*==============================================================*/
/* Index: BUSSINESS_HAS_ACCOUNTS2_FK                            */
/*==============================================================*/
create index BUSSINESS_HAS_ACCOUNTS2_FK on "Business" (
   CA_ID ASC
);

/*==============================================================*/
/* Table: "Chart of Accounts"                                   */
/*==============================================================*/
create table "Chart of Accounts" 
(
   CA_ID                INTEGER              not null,
   CA_DESCRIPTION       VARCHAR2(2000),
   CA_YEAR              DATE                 not null
);

alter table "Chart of Accounts"
   add constraint "PK_CHART OF ACCOUNTS" primary key (CA_ID);

/*==============================================================*/
/* Table: "Journal Vaucher"                                     */
/*==============================================================*/
create table "Journal Vaucher" 
(
   JV_ID                INTEGER              not null,
   CA_ID                INTEGER              not null,
   SU_ID                INTEGER,
   JV_CODE              INTEGER              not null,
   JV_DOCUMENT_NUMBER   INTEGER              not null,
   JV_DATE_OF_RECORDING DATE                 not null,
   JV_DATE_OF_CURRENCY  DATE                 not null
);

alter table "Journal Vaucher"
   add constraint "PK_JOURNAL VAUCHER" primary key (JV_ID);

/*==============================================================*/
/* Index: BUSINESS_HAS_VAUCHERS_FK                              */
/*==============================================================*/
create index BUSINESS_HAS_VAUCHERS_FK on "Journal Vaucher" (
   CA_ID ASC
);

/*==============================================================*/
/* Table: "Journal Vaucher Template"                            */
/*==============================================================*/
create table "Journal Vaucher Template" 
(
   JVT_ID               INTEGER              not null,
   BS_PART_ID           INTEGER,
   BS_ID                INTEGER              not null
);

alter table "Journal Vaucher Template"
   add constraint "PK_JOURNAL VAUCHER TEMPLATE" primary key (JVT_ID);

/*==============================================================*/
/* Index: HAS_TEMPLATES_FK                                      */
/*==============================================================*/
create index HAS_TEMPLATES_FK on "Journal Vaucher Template" (
   BS_PART_ID ASC
);

/*==============================================================*/
/* Index: TMP_FOR_BP_FK                                         */
/*==============================================================*/
create index TMP_FOR_BP_FK on "Journal Vaucher Template" (
   BS_ID ASC
);

/*==============================================================*/
/* Table: "Journal Vaucher Template Entry"                      */
/*==============================================================*/
create table "Journal Vaucher Template Entry" 
(
   JVTE_ID              INTEGER              not null,
   CA_ID                INTEGER              not null,
   AC_ID                VARCHAR(3)           not null,
   JVT_ID               INTEGER              not null,
   BS_ID                INTEGER,
   JVTE_DESCRIPTION     VARCHAR2(2000),
   JVTE_DEBITS          NUMBER(7,4)          not null,
   JVTE_CREDITS         NUMBER(7,4)          not null
);

alter table "Journal Vaucher Template Entry"
   add constraint "PK_JOURNAL VAUCHER TEMPLATE EN" primary key (JVTE_ID);

/*==============================================================*/
/* Index: VAUCHER_TEMPLATE_HAS_FK                               */
/*==============================================================*/
create index VAUCHER_TEMPLATE_HAS_FK on "Journal Vaucher Template Entry" (
   JVT_ID ASC
);

/*==============================================================*/
/* Index: ACCOUNT_FOR_TEMPLATE_ENTRY_FK                         */
/*==============================================================*/
create index ACCOUNT_FOR_TEMPLATE_ENTRY_FK on "Journal Vaucher Template Entry" (
   CA_ID ASC,
   AC_ID ASC
);

/*==============================================================*/
/* Index: BP_FOR_TE_FK                                          */
/*==============================================================*/
create index BP_FOR_TE_FK on "Journal Vaucher Template Entry" (
   BS_ID ASC
);

/*==============================================================*/
/* Table: "Software User"                                       */
/*==============================================================*/
create table "Software User" 
(
   SU_ID                INTEGER              not null,
   SUG_ID               INTEGER,
   SU_EMAIL             VARCHAR2(60)         not null,
   SU_PASSWORD          VARCHAR2(60)         not null,
   SU_TYPE              CHAR(1)              not null,
   SU_NAME              VARCHAR2(60)         not null,
   SU_LASTNAME          VARCHAR2(60)         not null
);

alter table "Software User"
   add constraint "PK_SOFTWARE USER" primary key (SU_ID);

/*==============================================================*/
/* Index: BELONGS_TO_USERGROUP_FK                               */
/*==============================================================*/
create index BELONGS_TO_USERGROUP_FK on "Software User" (
   SUG_ID ASC
);

/*==============================================================*/
/* Table: "Vaucher Entry"                                       */
/*==============================================================*/
create table "Vaucher Entry" 
(
   JVE_ID               INTEGER              not null,
   JV_ID                INTEGER              not null,
   SUG_ID               INTEGER,
   VET_ID               INTEGER,
   BS_ID                INTEGER              not null,
   CA_ID                INTEGER              not null,
   AC_ID                VARCHAR(3)           not null,
   JVE_DESCRIPTION      VARCHAR2(2000),
   JVE_DEBITS           NUMBER(10,4)         not null,
   JVE_CREDITS          NUMBER(10,4)         not null
);

alter table "Vaucher Entry"
   add constraint "PK_VAUCHER ENTRY" primary key (JVE_ID);

/*==============================================================*/
/* Index: ENTRY_IS_OF_TYPE_FK                                   */
/*==============================================================*/
create index ENTRY_IS_OF_TYPE_FK on "Vaucher Entry" (
   SUG_ID ASC,
   VET_ID ASC
);

/*==============================================================*/
/* Index: JOURNAL_VAUCHER_HAS_ENTRIES_FK                        */
/*==============================================================*/
create index JOURNAL_VAUCHER_HAS_ENTRIES_FK on "Vaucher Entry" (
   JV_ID ASC
);

/*==============================================================*/
/* Index: ENTRY_FOR_ACCOUNT_FK                                  */
/*==============================================================*/
create index ENTRY_FOR_ACCOUNT_FK on "Vaucher Entry" (
   CA_ID ASC,
   AC_ID ASC
);

/*==============================================================*/
/* Index: ENTRY_FOR_BUSINESS_PARTNER_FK                         */
/*==============================================================*/
create index ENTRY_FOR_BUSINESS_PARTNER_FK on "Vaucher Entry" (
   BS_ID ASC
);

/*==============================================================*/
/* Table: "Vaucher Entry Type"                                  */
/*==============================================================*/
create table "Vaucher Entry Type" 
(
   SUG_ID               INTEGER              not null,
   VET_ID               INTEGER              not null,
   VET_NAME             VARCHAR2(60)         not null,
   VET_DESCRIPTION      VARCHAR2(2000)
);

alter table "Vaucher Entry Type"
   add constraint "PK_VAUCHER ENTRY TYPE" primary key (SUG_ID, VET_ID);

/*==============================================================*/
/* Index: GROUP_HAS_VET_FK                                      */
/*==============================================================*/
create index GROUP_HAS_VET_FK on "Vaucher Entry Type" (
   SUG_ID ASC
);

alter table "Account"
   add constraint "FK_ACCOUNT_HAS AN AC_CHART OF" foreign key (CA_ID)
      references "Chart of Accounts" (CA_ID);

alter table "BS Has COA"
   add constraint "FK_BS HAS C_BUSSINESS_CHART OF" foreign key (CA_ID)
      references "Chart of Accounts" (CA_ID);

alter table "BS Has COA"
   add constraint "FK_BS HAS C_REFERENCE_BUSINESS" foreign key (BS_ID)
      references "Business" (BS_ID);

alter table "Business"
   add constraint "FK_BUSINESS_GROUP HAS_ACCOUNTA" foreign key (SUG_ID)
      references "Accountant User Group" (SUG_ID);

alter table "Journal Vaucher"
   add constraint "FK_JOURNAL _BUSINESS _CHART OF" foreign key (CA_ID)
      references "Chart of Accounts" (CA_ID);

alter table "Journal Vaucher"
   add constraint "FK_JOURNAL _REFERENCE_SOFTWARE" foreign key (SU_ID)
      references "Software User" (SU_ID);

alter table "Journal Vaucher Template"
   add constraint "FK_JOURNAL _HAS TEMPL_BUSINESS" foreign key (BS_PART_ID)
      references "Business" (BS_ID);

alter table "Journal Vaucher Template"
   add constraint "FK_JOURNAL _TEMPLATE _BUSINESS" foreign key (BS_ID)
      references "Business" (BS_ID);

alter table "Journal Vaucher Template Entry"
   add constraint "FK_JOURNAL _ACCOUNT F_ACCOUNT" foreign key (CA_ID, AC_ID)
      references "Account" (CA_ID, AC_ID);

alter table "Journal Vaucher Template Entry"
   add constraint "FK_JOURNAL _BUSSINES _BUSINESS" foreign key (BS_ID)
      references "Business" (BS_ID);

alter table "Journal Vaucher Template Entry"
   add constraint "FK_JOURNAL _VAUCHER T_JOURNAL" foreign key (JVT_ID)
      references "Journal Vaucher Template" (JVT_ID);

alter table "Software User"
   add constraint "FK_SOFTWARE_BELONGS T_ACCOUNTA" foreign key (SUG_ID)
      references "Accountant User Group" (SUG_ID);

alter table "Vaucher Entry"
   add constraint "FK_VAUCHER _ENTRY FOR_ACCOUNT" foreign key (CA_ID, AC_ID)
      references "Account" (CA_ID, AC_ID);

alter table "Vaucher Entry"
   add constraint "FK_VAUCHER _ENTRY FOR_BUSINESS" foreign key (BS_ID)
      references "Business" (BS_ID);

alter table "Vaucher Entry"
   add constraint "FK_VAUCHER _ENTRY IS _VAUCHER" foreign key (SUG_ID, VET_ID)
      references "Vaucher Entry Type" (SUG_ID, VET_ID);

alter table "Vaucher Entry"
   add constraint "FK_VAUCHER _JOURNAL V_JOURNAL" foreign key (JV_ID)
      references "Journal Vaucher" (JV_ID);

alter table "Vaucher Entry Type"
   add constraint "FK_VAUCHER _GROUP HAS_ACCOUNTA" foreign key (SUG_ID)
      references "Accountant User Group" (SUG_ID);

