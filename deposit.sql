create table RB_ATM_SYSTEM
(
    CB_BIN          VARCHAR(12) not null,
    SWX_BIN         VARCHAR(12) not null,
    SYSTEM_PHASE    VARCHAR(3)  not null,
    ONUS_WDRAWAL_SA VARCHAR(4),
    ONUS_WDRAWAL_CA VARCHAR(4),
    ONUS_EFT_POS_SA VARCHAR(4),
    ONUS_EFT_POS_CA VARCHAR(4),
    ONUS_XFER_DR_SA VARCHAR(4),
    ONUS_XFER_DR_CA VARCHAR(4),
    ONUS_XFER_CR_SA VARCHAR(4),
    ONUS_XFER_CR_CA VARCHAR(4),
    ONUS_DBIL_DR_SA VARCHAR(4),
    ONUS_DBIL_DR_CA VARCHAR(4),
    ONUS_DBIL_CR_SA VARCHAR(4),
    ONUS_DBIL_CR_CA VARCHAR(4),
    OTHR_WDRAWAL_SA VARCHAR(4),
    OTHR_WDRAWAL_CA VARCHAR(4),
    OTHR_EFT_POS_SA VARCHAR(4),
    OTHR_EFT_POS_CA VARCHAR(4),
    OTHR_XFER_DR_SA VARCHAR(4),
    OTHR_XFER_DR_CA VARCHAR(4),
    OTHR_XFER_CR_SA VARCHAR(4),
    OTHR_XFER_CR_CA VARCHAR(4),
    OTHR_DBIL_DR_SA VARCHAR(4),
    OTHR_DBIL_DR_CA VARCHAR(4),
    OTHR_DBIL_CR_SA VARCHAR(4),
    OTHR_DBIL_CR_CA VARCHAR(4),
    ONUS_DEP_SA     VARCHAR(4),
    ONUS_DEP_CA     VARCHAR(4),
    OTHR_DEP_SA     VARCHAR(4),
    OTHR_DEP_CA     VARCHAR(4),
    NETWORK_ID_DFLT VARCHAR(3),
    DFLT_BRANCH     VARCHAR(6),
    constraint RAM_PK
        primary key (CB_BIN, SWX_BIN, SYSTEM_PHASE)
)
;

create table RB_VOUCHER_TBL
(
    SEQ_NO           NUMERIC           not null,
    PRINT_CODE       VARCHAR(8) not null,
    TRAN_DATE        DATE             not null,
    TRAN_DATE_TIME   DATE,
    TRAN_BRANCH      VARCHAR(6),
    TRAN_REF_NO      VARCHAR(20),
    INTERNAL_KEY     NUMERIC,
    ACCT_NO          VARCHAR(20),
    TRAN_TYPE        VARCHAR(4),
    TRAN_CODE        VARCHAR(4),
    CR_DR_MAINT_IND  VARCHAR(1),
    TRAN_SEQ_NO      NUMERIC,
    CLIENT_NO        VARCHAR(12),
    TRAN_AMT         NUMERIC,
    TRAN_CCY         VARCHAR(3),
    ACCT_AMT         NUMERIC,
    ACCT_CCY         VARCHAR(3),
    CROSS_RATE       NUMERIC,
    NARRATIVE        VARCHAR(300),
    SERV_CHARGE      VARCHAR(1),
    REVERSAL_FLAG    VARCHAR(1),
    TRACE_ID         NUMERIC,
    SERV_TYPE        VARCHAR(3),
    SERV_SEQ_NO      NUMERIC,
    SERV_TRAN_AMT    NUMERIC,
    SERV_CCY         VARCHAR(3),
    SERV_TRAN_DESC   VARCHAR(50),
    TAX_TYPE         VARCHAR(3),
    TAX_SEQ_NO       NUMERIC,
    TAX_TRAN_AMT     NUMERIC,
    TAX_CCY          VARCHAR(3),
    TAX_RATE         NUMERIC,
    REFERENCE        VARCHAR(13),
    OFFICER_ID       VARCHAR(30),
    OVERRIDE_ID      VARCHAR(30),
    LEDGER_BAL       NUMERIC,
    CHEQUE_NO        VARCHAR(13),
    LOAN_NO          VARCHAR(10),
    DRAWDOWN_NO      NUMERIC(3),
    LOAN_PRINC_AMT   NUMERIC,
    LOAN_INT_AMT     NUMERIC,
    LOAN_OVERDUE_INT NUMERIC,
    PRINTED          VARCHAR(1),
    PRINT_DATE       DATE,
    PRINT_BY         VARCHAR(30),
    REPRINTED        VARCHAR(1),
    REPRINT_DATE     DATE,
    REPRINT_BY       VARCHAR(30),
    constraint RVC_PK
        primary key (SEQ_NO, PRINT_CODE, TRAN_DATE)
)
;

create table RB_CHEQUE_CTRL
(
    SEQ_NO            NUMERIC           not null,
    DOC_TYPE          VARCHAR(2) not null,
    BRANCH            VARCHAR(6) not null,
    INTERNAL_KEY      NUMERIC(12)       not null,
    START_NO          NUMERIC           not null,
    END_NO            NUMERIC           not null,
    LAST_ISSUED_NO    NUMERIC,
    ISSUE_DATE        DATE,
    BOOK_SIZE         VARCHAR(2),
    BOOK_TYPE         VARCHAR(2),
    NO_OF_LEAVES      NUMERIC(3)        not null,
    PRINT_NAME        VARCHAR(1),
    COLL_FROM_BRANCH  VARCHAR(6),
    AUTO_CHEQUE_ISSUE NUMERIC(3),
    CHQBOOK_CTRL_NO   NUMERIC(12),
    constraint RCQ_PK
        primary key (INTERNAL_KEY, DOC_TYPE, BRANCH, SEQ_NO)
)
;

create table RB_ACCT_TYPE
(
    ACCT_TYPE         VARCHAR(3)  not null
        constraint RAT_PK
            primary key,
    ACCT_TYPE_DESC    VARCHAR(30) not null,
    DEPOSIT_TYPE      VARCHAR(1)  not null,
    CALL_DEPOSIT      VARCHAR(1)  not null,
    GL_CODE_A         VARCHAR(16),
    GL_CODE_L         VARCHAR(16),
    GL_CODE_I         VARCHAR(16),
    GL_CODE_E         VARCHAR(16),
    GL_CODE_AIR       VARCHAR(16),
    GL_CODE_AIP       VARCHAR(16),
    GL_CODE_AII       VARCHAR(16),
    GL_CODE_AIE       VARCHAR(16),
    CASHIER_ORDER_IND VARCHAR(1)  not null,
    CB_CODE           NUMERIC(12),
    HPP_IND           VARCHAR(1),
    PROD_ID           VARCHAR(2)  not null
)
;

create table RB_ATM_AUDIT
(
    TRAN_NO         NUMERIC(12)        not null,
    BRANCH          VARCHAR(6)  not null,
    CCY             VARCHAR(3)  not null,
    ACCT_NO         VARCHAR(19) not null,
    CARD_NO         VARCHAR(19),
    CR_INST         VARCHAR(11),
    CR_ACCT_NO      VARCHAR(19),
    PROC_CODE       VARCHAR(6),
    TRAN_TYPE       VARCHAR(4)  not null,
    TRAN_AMT        NUMERIC,
    TRAN_AMT_ORIG   NUMERIC,
    REFERENCE       VARCHAR(12),
    EFFECT_DATE     DATE              not null,
    TRAN_DATE       DATE              not null,
    STATUS          VARCHAR(1),
    SEQ_NO          NUMERIC(12),
    CHK_BOOK_REQ    VARCHAR(1),
    STMT_REQ        VARCHAR(1),
    ACQ_INST        VARCHAR(11),
    ACQ_BRANCH      VARCHAR(6),
    ACQ_TERMINAL    VARCHAR(8),
    FUNC_CODE       VARCHAR(3),
    ERROR_NO        VARCHAR(6),
    ERROR_MSG       VARCHAR(60),
    FORCED_POST     VARCHAR(1),
    DEPOSIT_TYPE    VARCHAR(1),
    ACTION_CODE     VARCHAR(3),
    CR_DEPOSIT_TYPE VARCHAR(1),
    CR_SEQ_NO       NUMERIC,
    VAULT_TELLER_ID VARCHAR(30),
    RUN_DATE        DATE,
    RCV_TIMESTAMP   TIMESTAMP(6),
    ACT_ID_CODE     VARCHAR(15),
    ACT_NAME        VARCHAR(40),
    RET_REF_NO      VARCHAR(12),
    AUTH_CODE       VARCHAR(6),
    constraint RAA_PK
        primary key (TRAN_NO, BRANCH, TRAN_DATE, EFFECT_DATE, ACCT_NO, TRAN_TYPE)
)
;

create table RB_TRAN_DEF
(
    TRAN_TYPE               VARCHAR(4)  not null
        constraint RTD_PK
            primary key,
    TRAN_CODE               VARCHAR(4)  not null,
    TRAN_DESC               VARCHAR(30) not null,
    SOURCE_TYPE             VARCHAR(2)  not null,
    CR_DR_MAINT_IND         VARCHAR(1)  not null,
    REVERSAL_TRAN_TYPE      VARCHAR(4),
    SORT_PRIORITY           NUMERIC(2)         not null,
    CONTRA_GL_CODE          VARCHAR(16),
    SETTLEMENT_GL_CODE      VARCHAR(16),
    CASH_TRAN               VARCHAR(1)  not null,
    UPD_OD                  VARCHAR(1)  not null,
    UPD_ITEM_COUNT_AMT      VARCHAR(1)  not null,
    TAXABLE                 VARCHAR(1)  not null,
    SERV_CHARGE             VARCHAR(1)  not null,
    SHOW_ON_STMT            VARCHAR(1)  not null,
    FLOAT_DAYS              NUMERIC(2),
    MAX_BACK_DATE_DAYS      NUMERIC(3)         not null,
    MAX_FUTURE_DATE_DAYS    NUMERIC(3)         not null,
    CONSOLIDATE_ITEM        NUMERIC(3),
    MULTI_RVS_TRAN_TYPE_IND VARCHAR(1)  not null,
    CHECK_FUND_IND          VARCHAR(1),
    CHECK_RESTRAINT_IND     VARCHAR(1),
    NARRATIVE               VARCHAR(40),
    RATE_TYPE               VARCHAR(3),
    REVERSAL_TRAN_FLAG      VARCHAR(1),
    BALANCE_FLAG            VARCHAR(1),
    SLIP_FORMAT             VARCHAR(3),
    AUTO_APPROVAL           VARCHAR(1),
    APPROVAL_USER_LEVEL     VARCHAR(1),
    ENTRY_USER_LEVEL        VARCHAR(1),
    QUEUING_DAYS            NUMERIC(3),
    PURPOSE_CODE            VARCHAR(10),
    MIN_TRAN_AMT            NUMERIC,
    FORMAT                  VARCHAR(4),
    OPTIONAL_CODE           VARCHAR(1),
    RESTRAINT_FH_IND        VARCHAR(1),
    QUEUING_DAYS_OTH        NUMERIC(3),
    DIRECTION               VARCHAR(1),
    CODE                    VARCHAR(10),
    CO_TRAN_FLAG            VARCHAR(1)  not null,
    SWIFT_MSG_FLAG          VARCHAR(1)  not null,
    MIBS_TRAN_ID            VARCHAR(4),
    NETWORK_ID              VARCHAR(3)
)
;

create table RB_STAT_DEF
(
    STAT_ID         VARCHAR(3),
    TRAN_TYPE       VARCHAR(4)
        constraint RSTD_FK1
            references RB_TRAN_DEF,
    RESET_DATE      DATE,
    LAST_RESET_DATE DATE
)
;

create table RB_TRAN_TAX
(
    TRAN_TYPE     VARCHAR(4) not null
        constraint RTT_PK
            primary key
        constraint RTT_FK1
            references RB_TRAN_DEF,
    TAX_TYPE      VARCHAR(3) not null,
    TAX_TRAN_TYPE VARCHAR(4) not null
        constraint RTT_FK3
            references RB_TRAN_DEF,
    TAX_INCLUDED  VARCHAR(1) not null,
    REGION        VARCHAR(2),
    COUNTRY       VARCHAR(2)
)
;

create table RB_DR_ACCR_HIST
(
    INTERNAL_KEY      NUMERIC(12) not null,
    DR_INT_ACCRUED    NUMERIC,
    DR_ACCR_DATE      DATE       not null,
    DR_LAST_ACCR_DATE DATE,
    DR_INT_PRECISION  NUMERIC,
    DR_INT_COMPUTED   NUMERIC,
    constraint RDH_PK
        primary key (INTERNAL_KEY, DR_ACCR_DATE)
)
;

create table RB_INT_STMT
(
    INTERNAL_KEY       NUMERIC(12) not null
        constraint RIS_PK
            primary key,
    INT_CONTACT_TYPE   VARCHAR(3),
    INT_STMT_FREQ      VARCHAR(2),
    NEXT_INT_STMT_DATE DATE,
    INT_STMT_DAY       NUMERIC(2),
    LAST_INT_STMT_DATE DATE
)
;

create table RB_PROD_DEFAULT
(
    ACCT_TYPE              VARCHAR(3) not null
        constraint RPD_PK
            primary key
        constraint RPD_FK1
            references RB_ACCT_TYPE,
    PROD_GRP               VARCHAR(3) not null,
    PROFIT_CENTRE          VARCHAR(12),
    INT_IND                VARCHAR(1),
    SERV_CHARGE            VARCHAR(1),
    CHECK_BAL_IND          VARCHAR(1),
    CHECK_OD_IND           VARCHAR(1),
    ACTUAL_OR_LEDGER_BAL   VARCHAR(1),
    FREE_CHEQUES           NUMERIC(3),
    OWNERSHIP_TYPE         VARCHAR(2),
    DOC_TYPE               VARCHAR(2),
    TD_SUB_TYPE            VARCHAR(1),
    HOLD_RENEW             VARCHAR(1),
    HOLD_ROLLOVER          VARCHAR(1),
    STMT_PBK               VARCHAR(1),
    STMT_FREQ              VARCHAR(2),
    STMT_HANDLING          VARCHAR(2),
    STMT_COPIES            NUMERIC(2),
    STMT_NEXT_CYCLE_DATE   DATE,
    CR_INT_TYPE            VARCHAR(3),
    CR_INT_CALC_BAL        VARCHAR(2),
    CR_INT_FREQ            VARCHAR(2),
    CR_NEXT_CYCLE_DATE     DATE,
    CR_INT_DAY             NUMERIC(3),
    CR_LAST_CYCLE_DATE     DATE,
    CR_INT_ACCRUAL_FREQ    VARCHAR(2),
    CR_NEXT_ACCR_DATE      DATE,
    CR_INT_ACCRUAL_DAY     NUMERIC,
    CR_LAST_ACCRUAL_DATE   DATE,
    CR_TAX_TYPE            VARCHAR(3),
    DR_INT_TYPE            VARCHAR(3),
    DR_INT_CALC_BAL        VARCHAR(2),
    DR_INT_FREQ            VARCHAR(2),
    DR_NEXT_CYCLE_DATE     DATE,
    DR_LAST_CYCLE_DATE     DATE,
    DR_INT_DAY             NUMERIC(3),
    DR_INT_ACCRUAL_FREQ    VARCHAR(2),
    DR_NEXT_ACCR_DATE      DATE,
    DR_INT_ACCRUAL_DAY     NUMERIC,
    DR_LAST_ACCRUAL_DATE   DATE,
    PENALTY_MARGIN_RATE    NUMERIC(8, 3),
    STMT_DAY               NUMERIC(2),
    TD_ADDTL_PRINCIPAL     VARCHAR(1),
    CR_INT_RATE_IND        VARCHAR(1),
    DR_INT_RATE_IND        VARCHAR(1),
    CR_ACTUAL_CAP_DATE     DATE,
    DEFER_CAPITALISATION   VARCHAR(1),
    EXCEED_RF_LIMIT        VARCHAR(1),
    ASSIGN_NEW_CERT        VARCHAR(1),
    TD_PRETERM_INT_OPTION  VARCHAR(2),
    TD_PRETERM_INT_TYPE    VARCHAR(3),
    TD_PRETERM_RATE        NUMERIC(13, 8),
    TD_PRETERM_MIN_RATE    NUMERIC(13, 8),
    TD_PRETERM_MAX_RATE    NUMERIC(13, 8),
    TD_PENALTY_RATE        NUMERIC(13, 8),
    TD_AUTO_RENEW_ROLLOVER VARCHAR(1),
    TD_AUTO_ROLL_ACCT_TYPE VARCHAR(3),
    TD_AUTO_ROLL_NEW_TERM  VARCHAR(1)
)
;

create table RB_RESTRAINT_TYPE
(
    RESTRAINT_TYPE  VARCHAR(3)  not null
        constraint RRT_PK
            primary key,
    RESTRAINT_CLASS VARCHAR(2)  not null,
    RESTRAINT_DESC  VARCHAR(80) not null
)
;

create table RB_SIGNATORY
(
    CLIENT_NO      VARCHAR(12) not null,
    SIGNATORY_NO   NUMERIC(2)         not null,
    SIGNATORY_NAME VARCHAR(35) not null,
    SIGNATORY_DESC VARCHAR(50) not null,
    constraint RSN_PK
        primary key (CLIENT_NO, SIGNATORY_NO)
)
;

create table RB_ACCT_TRANSFER
(
    INTERNAL_KEY  NUMERIC(12) not null,
    TRF_FR_BRANCH VARCHAR(6),
    TRF_TO_BRANCH VARCHAR(6),
    TRF_DATE      DATE,
    SEQ_NO        NUMERIC     not null,
    LAST_UPD_DATE DATE,
    STATUS        VARCHAR(1),
    OFFICER_ID    VARCHAR(30),
    AUTHORIZER_ID VARCHAR(30),
    AUTH_DATE     DATE,
    constraint RAF_PK
        primary key (INTERNAL_KEY, SEQ_NO)
)
;

create table RB_ATM_BILLING
(
    SEQ_NO      VARCHAR(6)  not null,
    PROVIDER_ID VARCHAR(6)  not null,
    CUSTOMER_ID VARCHAR(15) not null,
    AMOUNT      NUMERIC,
    DESCRIPTION VARCHAR(128),
    constraint RB_ATM_BILLING_PK
        primary key (SEQ_NO, PROVIDER_ID, CUSTOMER_ID)
)
;

create table RB_INT_MATRIX_HIST
(
    INT_TYPE    VARCHAR(3) not null,
    CCY         VARCHAR(3) not null,
    EFFECT_DATE DATE             not null,
    BALANCE     NUMERIC           not null,
    TERM_TYPE   VARCHAR(1) not null,
    TERM_PERIOD NUMERIC(3)        not null,
    DAY_BASIS   NUMERIC(3),
    INT_RATE    NUMERIC(13, 8),
    constraint RXH_PK
        primary key (INT_TYPE, CCY, EFFECT_DATE, BALANCE, TERM_TYPE, TERM_PERIOD)
)
;

create table RB_SERV_VARIANT
(
    SERV_TYPE_VARIANT  VARCHAR(4)   not null
        constraint RSV_PK
            primary key,
    VARIANT_DESC       VARCHAR(100) not null,
    RATE_LADDER        VARCHAR(1),
    CALC_METHOD        VARCHAR(1),
    UNCOLL_SERV_CHARGE VARCHAR(1),
    BO_CLASS           VARCHAR(1)
)
;

create table RB_SERV_BAL_VARIANT
(
    SERV_TYPE_VARIANT VARCHAR(4) not null
        constraint RSBV_FK1
            references RB_SERV_VARIANT,
    CALC_BAL          VARCHAR(2) not null,
    constraint RSBV_PK
        primary key (SERV_TYPE_VARIANT, CALC_BAL)
)
;

create table RB_SERV_TYPE
(
    SERV_TYPE          VARCHAR(3)  not null
        constraint RST_PK
            primary key,
    RATE_LADDER        VARCHAR(1)  not null,
    CALC_METHOD        VARCHAR(1)  not null,
    SERV_TYPE_DESC     VARCHAR(30) not null,
    TRAN_TYPE          VARCHAR(4)  not null
        constraint RST_FK1
            references RB_TRAN_DEF,
    CALC_BAL           VARCHAR(2)  not null,
    AUTO_PRIME         VARCHAR(1),
    BO_CLASS           VARCHAR(1),
    STMT_SC            VARCHAR(1),
    UNCOLL_SERV_CHARGE VARCHAR(1),
    CONS               VARCHAR(1),
    SERV_TYPE_VARIANT  VARCHAR(4)  not null
        constraint RST_FK3
            references RB_SERV_VARIANT,
    STAT_ID            VARCHAR(3),
    constraint RST_FK2
        foreign key (SERV_TYPE_VARIANT, CALC_BAL) references RB_SERV_BAL_VARIANT
)
;

create table RB_PROD_SERV_DEFAULT
(
    ACCT_TYPE        VARCHAR(3) not null
        constraint RPS_FK1
            references RB_PROD_DEFAULT,
    SERV_TYPE        VARCHAR(3) not null
        constraint RPS_FK2
            references RB_SERV_TYPE,
    CLIENT_GROUP     VARCHAR(3) not null,
    CCY              VARCHAR(3) not null,
    TRAN_CLASS       VARCHAR(1) not null,
    ACCT_CLASS       VARCHAR(1) not null,
    SERV_FREQ        VARCHAR(2),
    NEXT_CHARGE_DATE DATE,
    SERV_DAY         NUMERIC(2),
    SC_DISCOUNT_TYPE VARCHAR(2),
    constraint RPS_PK
        primary key (ACCT_TYPE, SERV_TYPE, CLIENT_GROUP, CCY, TRAN_CLASS, ACCT_CLASS)
)
;

create table RB_CHEQUE_STATUS
(
    CHEQUE_STATUS       VARCHAR(3)  not null
        constraint RCU_PK
            primary key,
    CHEQUE_STATUS_CLASS VARCHAR(3)  not null,
    CHEQUE_STATUS_DESC  VARCHAR(30) not null,
    MANDATORY           VARCHAR(1)  not null,
    OFF_BAL_ACCTG       VARCHAR(1)
)
;

create table RB_SERV_RATE
(
    SERV_TYPE    VARCHAR(3) not null
        constraint RSR_FK1
            references RB_SERV_TYPE,
    CCY          VARCHAR(3) not null,
    EFFECT_DATE  DATE             not null,
    BALANCE      NUMERIC           not null,
    DAY_BASIS    NUMERIC(3)        not null,
    CLIENT_GROUP VARCHAR(3) not null,
    TRAN_CLASS   VARCHAR(1) not null,
    ACCT_CLASS   VARCHAR(1) not null,
    INT_BASIS    VARCHAR(2),
    SPREAD_RATE  NUMERIC(13, 8),
    ACTUAL_RATE  NUMERIC(13, 8),
    MIN_RATE     NUMERIC(13, 8),
    BASE_RATE    NUMERIC(13, 8),
    MAX_RATE     NUMERIC(13, 8),
    SPREAD_AMT   NUMERIC,
    RATE_AMT     NUMERIC,
    MIN_AMT      NUMERIC,
    MAX_AMT      NUMERIC,
    constraint RSR_PK
        primary key (SERV_TYPE, CCY, CLIENT_GROUP, EFFECT_DATE, BALANCE, TRAN_CLASS, ACCT_CLASS)
)
;

create table RB_ACCT_INFO
(
    INTERNAL_KEY   NUMERIC(12)        not null,
    CERTIFICATE_NO VARCHAR(8),
    CLIENT_NO      VARCHAR(12) not null,
    SIGNATORY_NO   NUMERIC(2)         not null,
    "LIMIT"          NUMERIC            not null,
    MANDATORY_IND  VARCHAR(1)  not null,
    START_DATE     DATE              not null,
    END_DATE       DATE              not null,
    INFO_1         VARCHAR(50),
    INFO_2         VARCHAR(50),
    INFO_3         VARCHAR(50),
    TELLER_ID      VARCHAR(30),
    OFFICER_ID     VARCHAR(30),
    constraint RAI_PK
        primary key (CLIENT_NO, INTERNAL_KEY, SIGNATORY_NO)
)
;

create table RB_TRAN_SERV
(
    TRAN_TYPE        VARCHAR(4) not null
        constraint RTS_FK1
            references RB_TRAN_DEF,
    SERV_TYPE        VARCHAR(3) not null
        constraint RTS_FK2
            references RB_SERV_TYPE,
    CLIENT_GROUP     VARCHAR(3) not null,
    CCY              VARCHAR(3) not null,
    TRAN_CLASS       VARCHAR(1) not null,
    ACCT_CLASS       VARCHAR(1) not null,
    SC_DISCOUNT_TYPE VARCHAR(2)
)
;

create table RB_DISCOUNT_SERV_CHARGE
(
    SC_DISCOUNT_TYPE VARCHAR(2) not null
        constraint RDS_PK
            primary key,
    SC_DISCOUNT_RATE NUMERIC(5, 2)
)
;

create table RB_ONL_ACCT
(
    INTERNAL_KEY       NUMERIC not null
        constraint RB_ONL_ACCT_PK
            primary key,
    ACCT_NO            VARCHAR(20),
    ACCT_TYPE          VARCHAR(3),
    DR_CLIENT          VARCHAR(12),
    DR_CCY             VARCHAR(3),
    DR_BRANCH          VARCHAR(6),
    DR_ACCT_NO         VARCHAR(20),
    CR_INTERNAL_KEY    NUMERIC,
    CR_ACCT_NO         VARCHAR(20),
    THIRD_ACCT_NO      VARCHAR(20),
    THIRD_INTERNAL_KEY NUMERIC,
    RENEWAL_TYPE       VARCHAR(3),
    PRINCIPAL_AMT      NUMERIC,
    REQUEST_ID         VARCHAR(4000),
    REQUEST_DATE       DATE,
    REQUEST_USER       VARCHAR(300),
    REQUEST_CHANNEL    VARCHAR(300),
    BRANCH             VARCHAR(6),
    USER_ID            VARCHAR(30),
    OVERRIDE_ID        VARCHAR(30)
)
;

create table RB_ONL_ACCT_TYPE
(
    ACCT_TYPE       VARCHAR(3) not null
        constraint RB_ONL_ACCT_TYPE_PK
            primary key,
    METHOD_TYPE     VARCHAR(2),
    THIRD_ACCT_TYPE VARCHAR(3),
    STATUS          VARCHAR(1),
    THIRD_NARRATIVE VARCHAR(270)
)
;

create table RB_ATM_TERMINAL
(
    BRANCH          VARCHAR(6) not null,
    ACQ_TERMINAL    VARCHAR(8) not null,
    ACQ_BRANCH      VARCHAR(6),
    VAULT_TELLER_ID VARCHAR(30),
    LAST_TRAN_TIME  NUMERIC,
    constraint RRM_PK
        primary key (BRANCH, ACQ_TERMINAL)
)
;

create table RB_BILL_TRAN_HIST
(
    TRAN_SEQ_NO     NUMERIC            not null
        constraint RBI_PK
            primary key,
    BRANCH          VARCHAR(6)  not null,
    TRAN_DATE       DATE              not null,
    TRAN_TIME       DATE              not null,
    INST_CODE       VARCHAR(10) not null,
    TRAN_DESC       VARCHAR(30) not null,
    ACCOUNT_NO      VARCHAR(20),
    SUBSCRIBER_NAME VARCHAR(30),
    CHEQUE_NO       VARCHAR(13),
    TRAN_AMT        NUMERIC            not null,
    PAYMENT_REF     VARCHAR(30) not null,
    NARRATIVE       VARCHAR(50),
    SETTLE_IND      VARCHAR(1),
    CCY             VARCHAR(3)  not null
)
;

create table RB_SERV_CARD
(
    INTERNAL_KEY NUMERIC(12)       not null,
    SEQ_NO       NUMERIC(2)        not null,
    SERV_CODE    VARCHAR(3) not null,
    SERV_NO      VARCHAR(20),
    constraint RRS_PK
        primary key (INTERNAL_KEY, SERV_CODE, SEQ_NO)
)
;

create table RB_SERV_CARD_TYPE
(
    SERV_CODE VARCHAR(3) not null
        constraint RVT_PK
            primary key,
    SERV_DESC VARCHAR(35)
)
;

create table RB_ACCT_STATUS
(
    ACCT_TYPE   VARCHAR(3) not null
        constraint RAS_FK2
            references RB_ACCT_TYPE,
    ACCT_STATUS VARCHAR(1) not null,
    MTH_NON_OP  NUMERIC(3),
    constraint RAS_PK
        primary key (ACCT_TYPE, ACCT_STATUS)
)
;

create table RB_TC_DENOM_GROUP
(
    TC_DENOM_GROUP      VARCHAR(8)  not null
        constraint RCG_PK
            primary key,
    TC_DENOM_GROUP_DESC VARCHAR(30) not null
)
;

create table RB_CHEQUE_TYPE
(
    CHEQUE_TYPE             VARCHAR(3)  not null
        constraint RCY_PK
            primary key,
    PROC_TYPE               VARCHAR(3)  not null,
    CHEQUE_DESC             VARCHAR(30) not null,
    TC_DENOM_GROUP          VARCHAR(8)
        constraint RCY_FK3
            references RB_TC_DENOM_GROUP,
    ACCT_ENTRY_CLIENT_TYPE  VARCHAR(1)  not null,
    GL_CODE                 VARCHAR(16),
    CLIENT_NO               VARCHAR(12),
    COLL_GL_CODE            VARCHAR(16),
    COLL_CONTRA_GL_CODE     VARCHAR(16),
    HO_GL_CODE              VARCHAR(16),
    HO_CONTRA_GL_CODE       VARCHAR(16),
    PROFIT_CENTRE           VARCHAR(12) not null,
    OFF_BAL_FLAG            VARCHAR(1)  not null,
    OFF_BAL_GL_CODE         VARCHAR(16),
    OFF_BAL_CONTRA_GL_CODE  VARCHAR(16),
    RB_TRAN_TYPE_CASH_SELL  VARCHAR(4),
    RB_TRAN_TYPE_CASH_BUY   VARCHAR(4),
    RB_TRAN_TYPE_SELL_DR    VARCHAR(4),
    RB_TRAN_TYPE_BUY_CR     VARCHAR(4),
    LAST_CHANGE_DATE        DATE              not null,
    LAST_CHANGE_OFFICER     VARCHAR(30) not null,
    UNPOSTED_FLAG           VARCHAR(1),
    UNPOSTED_GL_CODE        VARCHAR(16),
    UNCLAIMED_FLAG          VARCHAR(1),
    REGISTER_PERIOD         NUMERIC(3),
    REGISTER_PERIOD_TYPE    VARCHAR(1),
    CHEQUE_SELL_PERIOD      NUMERIC(3),
    CHEQUE_SELL_PERIOD_TYPE VARCHAR(1),
    ALLOW_BRANCH_DISTN      VARCHAR(1),
    ALLOW_BRANCH_REDISTN    VARCHAR(1),
    AUTO_CHEQUE_ASSIGN      VARCHAR(1),
    PREFIX_REQ              VARCHAR(1),
    INTL_CHEQUE_IND         VARCHAR(1)  not null,
    AGENT_BANK              VARCHAR(8),
    AGENT_BRANCH            VARCHAR(6),
    ALLOW_CHEQUE_DENOM      VARCHAR(1)  not null,
    REPRINT_CHEQUE_STATUS   VARCHAR(3),
    SELL_OFF_BAL_FLAG       VARCHAR(1)  not null,
    SELL_GL_CODE            VARCHAR(16),
    SELL_CONTRA_GL_CODE     VARCHAR(16),
    INTERBRANCH_ACCT_FLAG   VARCHAR(1),
    SUSP_ACCT_FLAG          VARCHAR(1),
    CLEARING_SUSP_ACCT_FLAG VARCHAR(1),
    SUSP_GL_CODE            VARCHAR(16),
    CLEARING_SUSP_GL_CODE   VARCHAR(16),
    REG_CHEQUE              VARCHAR(1),
    SC_GL_CODE              VARCHAR(16),
    STALE_BASIS_NO          NUMERIC(3),
    STALE_BASIS_TYPE        VARCHAR(1),
    STALE_GL_CODE           VARCHAR(16)
)
;

create table RB_CHEQUE_RD
(
    CHEQUE_RD_KEY        NUMERIC            not null
        constraint RRD_PK
            primary key,
    CHEQUE_TYPE          VARCHAR(3)  not null
        constraint RRD_FK1
            references RB_CHEQUE_TYPE,
    BRANCH               VARCHAR(6)  not null,
    REG_DATE             DATE              not null,
    DISTR_DATE           DATE,
    AMOUNT               NUMERIC            not null,
    OFFICER_ID           VARCHAR(30) not null,
    OVERRIDE_OFFICER_ID  VARCHAR(30),
    NEW_BRANCH           VARCHAR(6),
    MODULE_ID_ASSIGNMENT VARCHAR(2),
    AGENT_BANK           VARCHAR(8),
    AGENT_BRANCH         VARCHAR(6),
    CCY                  VARCHAR(3)  not null
)
;

create table RB_CHEQUE_DETAIL
(
    CHEQUE_RD_KEY            NUMERIC           not null,
    SEQ_NO                   NUMERIC(10),
    REF_NO                   VARCHAR(20),
    DENOMINATION             NUMERIC           not null,
    BRANCH                   VARCHAR(6) not null,
    PREFIX                   VARCHAR(30),
    CHEQUE_NO                NUMERIC(13)       not null,
    CHEQUE_TYPE              VARCHAR(3) not null
        constraint RCI_FK1
            references RB_CHEQUE_TYPE,
    CHEQUE_STATUS            VARCHAR(3) not null,
    AMOUNT                   NUMERIC           not null,
    REG_DATE                 DATE             not null,
    DISTR_DATE               DATE,
    DEAL_DATE                DATE,
    PREP_DATE                DATE,
    VERIFY_DATE              DATE,
    SETTLE_DATE              DATE,
    ADMIN_DATE               DATE,
    LAST_CHANGE_DATE         DATE,
    LAST_CHANGE_OFFICER      VARCHAR(30),
    PAID_TO                  VARCHAR(30),
    BANK_CODE                VARCHAR(8),
    CHEQUE_OWNER             VARCHAR(20),
    CCY                      VARCHAR(3) not null,
    CHEQUE_MODULE_ASSIGNMENT VARCHAR(2),
    LAST_MVMT_STATUS         VARCHAR(1),
    MODULE_ID_ASSIGNMENT     VARCHAR(2),
    OFFICER_ASSIGN_DATE      DATE,
    OFFICER_ID               VARCHAR(30),
    OLD_OFFICER_ID           VARCHAR(30),
    TRAN_BRANCH              VARCHAR(6),
    MISC_HIST_SEQ_NO         NUMERIC(12),
    SELL_MISC_HIST_SEQ_NO    NUMERIC(12),
    GRP_SEQ_NO               NUMERIC(12),
    BATCH_NO                 NUMERIC(12),
    NOS_INTERNAL_KEY         NUMERIC(12),
    BANK_NAME                VARCHAR(35),
    FT_INTERNAL_KEY          NUMERIC(12),
    TRAN_REF_NO              VARCHAR(20),
    FT_MSG_REF_NO            VARCHAR(16),
    SELL_INTERNAL_KEY        NUMERIC(12),
    BANK_BRANCH              VARCHAR(6),
    CR_DR                    VARCHAR(1),
    NARRATIVE                VARCHAR(50),
    SETTLE_AMOUNT            NUMERIC,
    REG_CHEQUE               VARCHAR(1)
)
;

create table RB_USER_CTRL
(
    OFFICER_ID        VARCHAR(30) not null,
    CCY               VARCHAR(3)  not null,
    CASH_LIMIT        NUMERIC,
    DR_TRAN_LIMIT     NUMERIC,
    CR_TRAN_LIMIT     NUMERIC,
    START_OF_DAY_CASH NUMERIC,
    DEP_CASH          NUMERIC,
    DEP_NONCASH       NUMERIC,
    WDL_CASH          NUMERIC,
    WDL_NONCASH       NUMERIC,
    CASH_TFR_AMT      NUMERIC,
    FINAL_COUNT       VARCHAR(1),
    COMPUTED_TOTAL    NUMERIC,
    CASH_CTRL_DATE    DATE,
    constraint RUC_PK
        primary key (OFFICER_ID, CCY)
)
;

create table RB_CASH_CTRL
(
    OFFICER_ID           VARCHAR(30) not null,
    CCY                  VARCHAR(3)  not null,
    TFR_DATE             DATE              not null,
    CASH_BAL             NUMERIC,
    TFR_AMT              NUMERIC,
    APPROVING_OFFICER_ID VARCHAR(30),
    constraint RCC_PK
        primary key (OFFICER_ID, CCY, TFR_DATE),
    constraint RCC_FK1
        foreign key (OFFICER_ID, CCY) references RB_USER_CTRL
)
;

create table RB_RESTRAINTS
(
    INTERNAL_KEY        NUMERIC(12)       not null,
    RESTRAINT_TYPE      VARCHAR(3) not null
        constraint RRN_FK1
            references RB_RESTRAINT_TYPE,
    SEQ_NO              NUMERIC           not null,
    START_CHEQUE_NO     VARCHAR(13),
    END_CHEQUE_NO       VARCHAR(13),
    START_DATE          DATE,
    END_DATE            DATE,
    START_AMT           NUMERIC,
    END_AMT             NUMERIC,
    PLEDGED_AMT         NUMERIC,
    PLEDGED_ACCT_TYPE   VARCHAR(3)
        constraint RRN_FK2
            references RB_ACCT_TYPE,
    PLEDGED_ACCT_NO     VARCHAR(20),
    LAST_CHANGE_DATE    DATE,
    LAST_CHANGE_OFFICER VARCHAR(30),
    NARRATIVE           VARCHAR(240),
    STATUS              VARCHAR(1),
    STL_SEQ_NO          NUMERIC,
    SOURCE_MODULE       VARCHAR(2),
    TRAN_TYPE           VARCHAR(4),
    PRIORITY            NUMERIC(4),
    OTH_BANK_CODE       VARCHAR(8),
    OTH_ACCT_NO         VARCHAR(20),
    OTH_ACCT_DESC       VARCHAR(150),
    PURPOSE_CODE        VARCHAR(10),
    SPEC_CODE           VARCHAR(10),
    REFERENCE           VARCHAR(13),
    MSG_CLIENT          VARCHAR(250),
    MSG_BANK            VARCHAR(150),
    NO_OF_PAYMENT       NUMERIC,
    PAYMENT_MADE        NUMERIC,
    TO_PAY_AMT          NUMERIC,
    PAID_AMT            NUMERIC,
    TRAN_AMT            NUMERIC,
    APPROVAL_DATE       DATE,
    INTERRUPT           VARCHAR(1),
    OVERRIDE_OFFICER    VARCHAR(30),
    RESTRAINT_SRC       VARCHAR(1)
)
;

create table RB_RUN_FIN_HIST
(
    INTERNAL_KEY     NUMERIC(12) not null,
    POST_DATE        DATE       not null,
    DR_INT           NUMERIC,
    THIRD_PARTY_ACCT NUMERIC(12),
    INT_TYPE         VARCHAR(3),
    constraint RFH_PK
        primary key (INTERNAL_KEY, POST_DATE)
)
;

create table RB_ACCT_SIGN
(
    INTERNAL_KEY   NUMERIC(12)        not null,
    CERTIFICATE_NO VARCHAR(8),
    CLIENT_NO      VARCHAR(12) not null,
    SIGNATORY_NO   NUMERIC(2)         not null,
    SIGNATURE_NO   NUMERIC(2)         not null,
    constraint RSI_PK
        primary key (CLIENT_NO, INTERNAL_KEY, SIGNATORY_NO, SIGNATURE_NO)
)
;

create table RB_INT_MATRIX
(
    INT_TYPE    VARCHAR(3) not null,
    CCY         VARCHAR(3) not null,
    EFFECT_DATE DATE             not null,
    BALANCE     NUMERIC           not null,
    TERM_TYPE   VARCHAR(1) not null,
    TERM_PERIOD NUMERIC(3)        not null,
    DAY_BASIS   NUMERIC(3),
    INT_RATE    NUMERIC(13, 8),
    constraint RIM_PK
        primary key (INT_TYPE, CCY, EFFECT_DATE, BALANCE, TERM_TYPE, TERM_PERIOD)
)
;

create table RB_POST_DATE
(
    BRANCH      VARCHAR(6) not null,
    FLOAT_DAYS  NUMERIC(3)        not null,
    EFFECT_DATE DATE             not null,
    POST_DATE   DATE,
    constraint RPT_PK
        primary key (BRANCH, FLOAT_DAYS, EFFECT_DATE)
)
;

create table RB_ACCT
(
    INTERNAL_KEY         NUMERIC(12) not null
        constraint RAC_PK
            primary key,
    BRANCH               VARCHAR(6),
    CCY                  VARCHAR(3),
    CLIENT_NO            VARCHAR(12),
    GLOBAL_ID_TYPE       VARCHAR(3),
    GLOBAL_ID            VARCHAR(16),
    PROFIT_CENTRE        VARCHAR(12),
    ACCT_OPEN_DATE       DATE,
    ACCT_STATUS          VARCHAR(1),
    ACCT_NO              VARCHAR(20),
    ACCT_TYPE            VARCHAR(3)
        constraint RAC_FK3
            references RB_ACCT_TYPE
        constraint RAC_FK5
            references RB_PROD_DEFAULT,
    ACCT_CLOSE_DATE      DATE,
    ACCT_CLOSE_REASON    VARCHAR(80),
    CERTIFICATE_NO       VARCHAR(8),
    DEPOSIT_TYPE         VARCHAR(1),
    ACTUAL_OR_LEDGER_BAL VARCHAR(1),
    LEDGER_BAL           NUMERIC,
    ACTUAL_BAL           NUMERIC,
    CALC_BAL             NUMERIC,
    PREV_DAY_LEDGER_BAL  NUMERIC,
    PREV_DAY_ACTUAL_BAL  NUMERIC,
    PREV_DAY_CALC_BAL    NUMERIC,
    TOLERANCE_AMT        NUMERIC,
    TOTAL_FLOATS_AMT     NUMERIC,
    TOTAL_PLEDGED_AMT    NUMERIC,
    ALT_ACCT_NO          VARCHAR(35)
)
;

CREATE TABLE RB_ACCT_OFFICER (
  INTERNAL_KEY NUMERIC(12) not null
        constraint RAC_PK_OFFICER
            primary key,
  ACCT_CLOSE_OFFICER   VARCHAR(30),
  CASHIER_ORDER_IND    VARCHAR(1),
  WS_ID                VARCHAR(200),
  USER_ID              VARCHAR(30),
  OFFICER_ID           VARCHAR(3),
  LAST_CHANGE_OFFICER  VARCHAR(30)
)
;

create table RB_ACCT_BAL
(
    INTERNAL_KEY         NUMERIC(12) not null,
    TRAN_DATE            DATE       not null,
    ACTUAL_BAL           NUMERIC,
    LEDGER_BAL           NUMERIC,
    CALC_BAL             NUMERIC,
    PREV_ACTUAL_BAL      NUMERIC,
    PREV_LEDGER_BAL      NUMERIC,
    PREV_CALC_BAL        NUMERIC,
    ACTUAL_OR_LEDGER_BAL VARCHAR(1),
    OD_OS_PRINCIPAL      NUMERIC,
    constraint RAB_PK
        primary key (INTERNAL_KEY, TRAN_DATE)
)
;

create table RB_ACCT_STATS
(
    INTERNAL_KEY             NUMERIC(12) not null
        constraint RBS_PK
            primary key,
    NO_OF_WDL_MTD            NUMERIC(15),
    NO_OF_CHEQUE_WDL_MTD     NUMERIC(15),
    NO_OF_CHEQUES_REJECT_MTD NUMERIC(15),
    NO_OF_CHEQUES_OD_MTD     NUMERIC(15),
    NO_OF_TRAN_MTD           NUMERIC(15),
    NO_OF_CHEQUE_DEP_MTD     NUMERIC(15),
    NO_OF_DEP_MTD            NUMERIC(15),
    AMT_OF_DEP_MTD           NUMERIC,
    AMT_OF_CHEQUE_DEP_MTD    NUMERIC,
    AMT_OF_WDL_MTD           NUMERIC,
    AMT_OF_CHEQUE_WDL_MTD    NUMERIC,
    AMT_OF_CHEQUE_REJECT_MTD NUMERIC,
    AMT_OF_OD_CHARGED_MTD    NUMERIC,
    AMT_WHD_MTD              NUMERIC,
    LOW_BAL_MTD              NUMERIC,
    HIGH_BAL_MTD             NUMERIC,
    AGG_BAL_MTD              NUMERIC,
    MTD_DAYS                 NUMERIC,
    CR_PRODUCT_MTD           NUMERIC,
    DR_PRODUCT_MTD           NUMERIC,
    AVG_DAILY_BAL            NUMERIC,
    NO_OF_WDL_CTD            NUMERIC(15),
    NO_OF_CHEQUE_WDL_CTD     NUMERIC(15),
    NO_OF_CHEQUES_REJECT_CTD NUMERIC(15),
    NO_OF_CHEQUES_OD_CTD     NUMERIC(15),
    NO_OF_TRAN_CTD           NUMERIC(15),
    NO_OF_CHEQUE_DEP_CTD     NUMERIC(15),
    NO_OF_DEP_CTD            NUMERIC(15),
    AMT_OF_DEP_CTD           NUMERIC,
    AMT_OF_CHEQUE_DEP_CTD    NUMERIC,
    AMT_OF_WDL_CTD           NUMERIC,
    AMT_OF_CHEQUE_WDL_CTD    NUMERIC,
    AMT_OF_CHEQUE_REJECT_CTD NUMERIC,
    AMT_OF_OD_CHARGED_CTD    NUMERIC,
    AMT_WHD_CTD              NUMERIC,
    LOW_BAL_CTD              NUMERIC,
    HIGH_BAL_CTD             NUMERIC,
    AGG_BAL_CTD              NUMERIC,
    CTD_DAYS                 NUMERIC,
    NO_OF_WDL_YTD            NUMERIC(15),
    NO_OF_CHEQUE_WDL_YTD     NUMERIC(15),
    NO_OF_CHEQUES_REJECT_YTD NUMERIC(15),
    NO_OF_CHEQUES_OD_YTD     NUMERIC(15),
    NO_OF_TRAN_YTD           NUMERIC(15),
    NO_OF_CHEQUE_DEP_YTD     NUMERIC(15),
    NO_OF_DEP_YTD            NUMERIC(15),
    AMT_OF_DEP_YTD           NUMERIC,
    AMT_OF_CHEQUE_DEP_YTD    NUMERIC,
    AMT_OF_WDL_YTD           NUMERIC,
    AMT_OF_CHEQUE_WDL_YTD    NUMERIC,
    AMT_OF_CHEQUE_REJECT_YTD NUMERIC,
    AMT_OF_OD_CHARGED_YTD    NUMERIC,
    AMT_WHD_YTD              NUMERIC,
    LOW_BAL_YTD              NUMERIC,
    HIGH_BAL_YTD             NUMERIC,
    AGG_BAL_YTD              NUMERIC,
    YTD_DAYS                 NUMERIC,
    CTRL_DATE                DATE,
    AGG_BAL_QTD              NUMERIC,
    QTD_DAYS                 NUMERIC,
    AGG_BAL_STD              NUMERIC,
    STD_DAYS                 NUMERIC,
    STAT_CTRL_DATE           DATE,
    ACCT_BAL                 NUMERIC,
    PREV_ACCT_BAL            NUMERIC,
    INT_LOW_BAL_MTD          NUMERIC,
    INT_HIGH_BAL_MTD         NUMERIC,
    INT_AGG_BAL_MTD          NUMERIC,
    INT_AVG_DAILY_BAL        NUMERIC
)
;

CREATE TABLE RB_ACCT_EXTEND (
  INTERNAL_KEY         NUMERIC(12) not null
        constraint RAC_PK_EXTEND
            primary key,
  CATEGORY_TYPE        VARCHAR(2),
  CLIENT_TYPE          VARCHAR(3),
  DIRECT_DEBIT         VARCHAR(1),
  CB_CODE              NUMERIC(12),
  DR_TURNOVER          NUMERIC,
  CR_TURNOVER          NUMERIC,
  EXCEED_RF_LIMIT      VARCHAR(1),
  INTERNET_ACCT        VARCHAR(1),
  INTERNET_ENROLL_DATE DATE,
  OWNERSHIP_TYPE         VARCHAR(2),
  FREE_CHEQUES         NUMERIC(3),
  ATA_ACCT             VARCHAR(20),
  INT_STMT             VARCHAR(1),
  STMT_PBK             VARCHAR(1),
  PRINT_STMT           VARCHAR(1),
  CLIENT_IND           VARCHAR(1),
  DEL_FLAG             VARCHAR(1),
  OD_FACILITY          VARCHAR(1),
  RESTRAINT_PRESENT    VARCHAR(1),
  COMPENSE_ACCT_TYPE   VARCHAR(1),
  COMPENSE_CTRL_ACCT   NUMERIC(12)
)
;

create table RB_CR_ACCR_HIST
(
    INTERNAL_KEY      NUMERIC(12) not null,
    CR_INT_ACCRUED    NUMERIC,
    CR_ACCR_DATE      DATE       not null,
    CR_LAST_ACCR_DATE DATE,
    CR_INT_PRECISION  NUMERIC,
    CR_INT_COMPUTED   NUMERIC
)
;

create table RB_INT_STMT_TRAN
(
    INTERNAL_KEY     NUMERIC(12) not null
        constraint RI2_FK1
            references RB_ACCT,
    POST_DATE        DATE       not null,
    START_DATE       DATE       not null,
    END_DATE         DATE       not null,
    CALC_AMT         NUMERIC,
    INT_RATE         NUMERIC(13, 8),
    INT_AMT          NUMERIC     not null,
    THIRD_PARTY_ACCT NUMERIC(12),
    TENOR            VARCHAR(6),
    TRAN_SEQ_NO      NUMERIC     not null,
    PRINT_IND        VARCHAR(1)
)
;

create table RB_MTH_END
(
    INTERNAL_KEY                 NUMERIC(12) not null,
    MTH_END_DATE                 DATE       not null,
    LEDGER_BAL                   NUMERIC,
    FLOAT_AMT                    NUMERIC,
    ACTUAL_BAL                   NUMERIC,
    AVG_BAL                      NUMERIC,
    LOW_BAL                      NUMERIC,
    HIGH_BAL                     NUMERIC,
    CR_INT_ACCRUED               NUMERIC,
    DR_INT_ACCRUED               NUMERIC,
    DR_INT_ACCRUED_NOT_PAID      NUMERIC,
    ACCRUED_BAL                  NUMERIC,
    CR_INT_ACCRUED_NOT_COLLECTED NUMERIC,
    CR_PRODUCT                   NUMERIC,
    DR_PRODUCT                   NUMERIC,
    CR_INT_TYPE                  VARCHAR(3),
    DR_INT_TYPE                  VARCHAR(3),
    CR_ACCT_LEVEL_INT_RATE       NUMERIC(13, 8),
    DR_ACCT_LEVEL_INT_RATE       NUMERIC(13, 8),
    CR_SPREAD_RATE               NUMERIC(13, 8),
    DR_SPREAD_RATE               NUMERIC(13, 8),
    PENALTY_MARGIN_RATE          NUMERIC(13, 8),
    INT_LOW_BAL                  NUMERIC,
    INT_HIGH_BAL                 NUMERIC,
    INT_AVG_BAL                  NUMERIC,
    OD_OS_PRINCIPAL              NUMERIC,
    DR_SMR_INT_ACCRUED           NUMERIC,
    CR_INT_PAID_MTD              NUMERIC,
    CR_INT_PAID_YTD              NUMERIC,
    DR_INT_COLL_MTD              NUMERIC,
    DR_INT_COLL_YTD              NUMERIC,
    constraint RME_PK
        primary key (INTERNAL_KEY, MTH_END_DATE)
)
;

create table RB_SERV_CHARGE
(
    INTERNAL_KEY        NUMERIC(12)       not null,
    SERV_TYPE           VARCHAR(3) not null
        constraint RSC_FK1
            references RB_SERV_TYPE,
    THIRD_PARTY         VARCHAR(1) not null,
    PERIOD_FREQ         VARCHAR(2),
    SERV_DAY            NUMERIC(2),
    CHARGE_TO_BANK      VARCHAR(8),
    CHARGE_TO_BRANCH    VARCHAR(6),
    CHARGE_TO_ACCT_TYPE VARCHAR(3)
        constraint RSC_FK4
            references RB_ACCT_TYPE,
    CHARGE_TO_ACCT_NO   NUMERIC(12),
    LAST_CHARGE_DATE    DATE,
    NEXT_CHARGE_DATE    DATE             not null,
    LAST_CHANGE_DATE    DATE,
    LAST_CHANGE_OFFICER VARCHAR(30),
    SC_DISCOUNT_TYPE    VARCHAR(2)
        constraint RSC_FK5
            references RB_DISCOUNT_SERV_CHARGE,
    constraint RSC_PK
        primary key (INTERNAL_KEY, NEXT_CHARGE_DATE, SERV_TYPE)
)
;

create table RB_STMT
(
    INTERNAL_KEY        NUMERIC(12)       not null,
    CONTACT_TYPE        VARCHAR(3) not null,
    NO_OF_COPIES        NUMERIC(2)        not null,
    STMT_HANDLING       VARCHAR(2) not null,
    STMT_LANG           VARCHAR(2),
    PERIOD_FREQ         VARCHAR(2) not null,
    STMT_DAY            NUMERIC(2),
    SUMMARY_POST        VARCHAR(1),
    CLOSING_BAL         NUMERIC,
    LAST_STMT_DATE      DATE,
    NEXT_STMT_DATE      DATE             not null,
    LAST_CHANGE_DATE    DATE,
    LAST_CHANGE_OFFICER VARCHAR(30),
    SUPPRESS_PRINT      VARCHAR(1),
    LAST_STMT_NO        NUMERIC(5),
    PRINT_PRIORITY      VARCHAR(1),
    constraint RSM_PK
        primary key (INTERNAL_KEY, NEXT_STMT_DATE, CONTACT_TYPE)
)
;

create table RB_ACCT_TIME (
  INTERNAL_KEY  NUMERIC(12) not null
        constraint RAC_PK_TIME primary key REFERENCES rb_acct(INTERNAL_KEY),
  OPEN_TRAN_DATE date,
  LAST_CHANGE_DATE date,
  LAST_RUN_DATE date,
  LAST_TRAN_DATE date,
  LAST_BAL_UPDATE date,
  LAST_PBK_UPD_BAL numeric,
  LAST_PBK_UPD_DATE date,
  LAST_PBK_LINE numeric
);

create table RB_STMT_DETAIL
(
    SEQ_NO        NUMERIC not null
        constraint RSL_PK
            primary key,
    INTERNAL_KEY  NUMERIC,
    TRAN_TYPE     VARCHAR(4),
    TRAN_DESC     VARCHAR(30),
    TRAN_DATE     DATE,
    EFFECT_DATE   DATE,
    POST_DATE     DATE,
    TRAN_PRIORITY NUMERIC(2),
    REFERENCE     VARCHAR(13),
    DEBIT_AMT     NUMERIC,
    CREDIT_AMT    NUMERIC,
    BALANCE       NUMERIC,
    PREV_BALANCE  NUMERIC,
    OFFICER_ID    VARCHAR(30),
    STMT_SEQ      NUMERIC
)
;

create table RB_STMT_HEADER
(
    SEQ_NO         NUMERIC not null,
    INTERNAL_KEY   NUMERIC not null,
    CONTACT_TYPE   VARCHAR(30),
    ACCT_NO        VARCHAR(20),
    ACCT_DESC      VARCHAR(40),
    ACCT_TYPE      VARCHAR(3),
    ACCT_TYPE_DESC VARCHAR(30),
    CCY            VARCHAR(3),
    CCY_DESC       VARCHAR(20),
    BRANCH         VARCHAR(6),
    BRANCH_NAME    VARCHAR(30),
    NAME           VARCHAR(35),
    ADDR1          VARCHAR(35),
    ADDR2          VARCHAR(35),
    ADDR3          VARCHAR(35),
    ADDR4          VARCHAR(35),
    POSTAL_CODE    VARCHAR(10),
    START_BALANCE  NUMERIC,
    END_BALANCE    NUMERIC,
    START_DATE     DATE,
    END_DATE       DATE,
    PRINT_PRIORITY VARCHAR(1),
    STMT_HANDLING  VARCHAR(2),
    OFFICER_ID     VARCHAR(30),
    constraint RSE_PK
        primary key (INTERNAL_KEY, SEQ_NO)
)
;

create table RB_STMT_TRAN
(
    SEQ_NO        NUMERIC not null
        constraint RSS_PK
            primary key,
    INTERNAL_KEY  NUMERIC,
    TRAN_TYPE     VARCHAR(4),
    TRAN_DESC     VARCHAR(30),
    TRAN_DATE     DATE,
    EFFECT_DATE   DATE,
    POST_DATE     DATE,
    DEBIT_AMT     NUMERIC,
    CREDIT_AMT    NUMERIC,
    REFERENCE     VARCHAR(13),
    STMT_DATE     DATE,
    PREV_BALANCE  NUMERIC,
    SORT_PRIORITY NUMERIC(2),
    CONS_SEQ_NO   NUMERIC
)
;

create table RB_TRAN_HIST
(
    SEQ_NO               NUMERIC(12)       not null,
    INTERNAL_KEY         NUMERIC(12)       not null,
    TRAN_DATE            DATE             not null,
    SOURCE_TYPE          VARCHAR(2) not null,
    TERMINAL_ID          VARCHAR(200),
    BRANCH               VARCHAR(6),
    OFFICER_ID           VARCHAR(30),
    TRAN_TYPE            VARCHAR(4),
    EFFECT_DATE          DATE,
    POST_DATE            DATE,
    REVERSAL_TRAN_TYPE   VARCHAR(4),
    REVERSAL_DATE        DATE,
    PBK_UPD_FLAG         VARCHAR(1),
    STMT_DATE            DATE,
    TRAN_AMT             NUMERIC,
    REFERENCE_TYPE       VARCHAR(4),
    REFERENCE            VARCHAR(13),
    REFERENCE_BANK       VARCHAR(8),
    FLOAT_DAYS           NUMERIC(2),
    PREVIOUS_BAL_AMT     NUMERIC,
    ACTUAL_BAL_AMT       NUMERIC,
    TFR_INTERNAL_KEY     NUMERIC(12),
    TFR_SEQ_NO           NUMERIC(12),
    TRACE_ID             NUMERIC(12),
    CR_DR_MAINT_IND      VARCHAR(1),
    OVERRIDE_OFFICER     VARCHAR(30),
    REFERENCE_BRANCH     VARCHAR(6),
    TRAN_DESC            VARCHAR(30),
    TIME_STAMP           DATE,
    BR_SEQ_NO            NUMERIC,
    CD_CASH_FLOW_FLAG    VARCHAR(1),
    VALUE_DATE           DATE,
    CCY                  VARCHAR(3),
    PROFIT_CENTRE        VARCHAR(12),
    SOURCE_MODULE        VARCHAR(2),
    BT_OFFICER_ID        VARCHAR(30),
    BT_OVERRIDE_ID       VARCHAR(30),
    RECEIPT_NO           VARCHAR(20),
    PRIMARY_SEQ_NO       NUMERIC(12),
    RATE_TYPE            VARCHAR(3),
    PURPOSE_CODE         VARCHAR(10),
    SPEC_CODE            VARCHAR(10),
    OTH_BANK_CODE        VARCHAR(8),
    OTH_ACCT_NO          VARCHAR(20),
    OTH_ACCT_DESC        VARCHAR(150),
    OTH_ACCT_DESC2       VARCHAR(150),
    OTH_REFERENCE        VARCHAR(10),
    OTH_SPEC_CODE        VARCHAR(10),
    OTH_VALUE_DATE       DATE,
    MSG_CLIENT           VARCHAR(250),
    TRAN_REF_NO          VARCHAR(30),
    CLIENT_CROSS_REF     VARCHAR(23),
    TRN                  VARCHAR(20),
    SOURCE_REF_NO        VARCHAR(20),
    OTH_AMT              NUMERIC,
    SOURCE_REF_TYPE      VARCHAR(2),
    SERV_CHARGE          VARCHAR(1),
    CONS_SEQ_NO          NUMERIC,
    SORT_PRIORITY        NUMERIC(2),
    APPROVAL_DATE        DATE,
    FORMAT               VARCHAR(4),
    LAST_PROCESS_DATE    DATE,
    LAST_PROCESS_ERR     NUMERIC(6),
    MSG_BANK             VARCHAR(150),
    ORIG_SETTLEMENT_DATE DATE,
    ORIG_TRAN_REF_NO     VARCHAR(30),
    STATUS_INFO          VARCHAR(2000),
    NARRATIVE            VARCHAR(270),
    TRAN_DATE_TIME       DATE,
    FH_SEQ_NO            NUMERIC,
    TRAN_ENTRY_DATE      DATE,
    VOUCHER_NO           NUMERIC(8),
    SYSTEM_PHASE         VARCHAR(3),
    constraint RTH_PK
        primary key (TRAN_DATE, SEQ_NO)
)
;
