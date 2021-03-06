CREATE SCHEMA IF NOT EXISTS PAYMENT_METHOD_ENTITY_GROUP;

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.CREDIT_TENDER (
  ID VARCHAR(36) UNIQUE NOT NULL,
  PAYMENT_METHOD_STATUS VARCHAR(500) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_CARD (
  CREDIT_CARD_EXPIRED BOOLEAN NOT NULL,
  CARD_TOKEN VARCHAR(500) NOT NULL,
  ISSUE_NUMBER VARCHAR(500) NOT NULL,
  BILL_TO_CITY VARCHAR(500),
  ID VARCHAR(36) UNIQUE NOT NULL,
  MASKED_NUMBER VARCHAR(500) NOT NULL,
  NAME VARCHAR(500) NOT NULL,
  COMPANY_NAME VARCHAR(500),
  CARD_HOLDER_NAME VARCHAR(500) NOT NULL,
  NUMBER_LAST_DIGITS VARCHAR(500) NOT NULL,
  PAYMENT_CARD_TYPE VARCHAR(500) NOT NULL,
  DERIVED_CARD_TYPE_CODE VARCHAR(500),
  BILL_TO_FIRST_NAME VARCHAR(500),
  BILL_TO_STREET VARCHAR(500),
  EXPIRATION_YEAR VARCHAR(500) NOT NULL,
  BILL_TO_STREET2 VARCHAR(500),
  EXPIRATION_MONTH VARCHAR(500) NOT NULL,
  BILL_TO_LAST_NAME VARCHAR(500),
  PAYMENT_METHOD_STATUS VARCHAR(500) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD_TYPE (
  TYPE_DESCRIPTION VARCHAR(500),
  MEDIA_TYPE VARCHAR(500),
  MAX_PER_PERIOD_AMOUNT INTEGER,
  TYPE_REQUIRED_IDENTIFICATION VARCHAR(500),
  ID VARCHAR(36) UNIQUE NOT NULL,
  NAME VARCHAR(500),
  USE_MINIMUM_AGE_YEAR INTEGER,
  MAX_TRANSACTION_AMOUNT INTEGER,
  MAX_PER_PERIOD_TRANSACTION_COUNT INTEGER,
  PRIMARY KEY (ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.COUPON (
  PRIMARY_SCAN_CODE_LABEL VARCHAR(500),
  IS_RETURN_COUPON BOOLEAN,
  EXPIRATION_DATE DATE,
  ID VARCHAR(36) UNIQUE NOT NULL,
  SECONDARY_SCAN_CODE_LABEL VARCHAR(500),
  SCAN_CODE VARCHAR(500),
  COUPON_CODE VARCHAR(500),
  RETURN_COUPON_REASON VARCHAR(500),
  DISCOUNT_AMOUNT INTEGER,
  IS_VALID BOOLEAN,
  COUPON_STATUS VARCHAR(500),
  DISCOUNT_PERCENTAGE INTEGER,
  COUPON_COUNT INTEGER,
  PAYMENT_METHOD_STATUS VARCHAR(500) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD (
  PAYMENT_METHOD_STATUS VARCHAR(500) NOT NULL,
  ID VARCHAR(36) UNIQUE NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.CREDIT_TENDER_ACCOUNT_JOIN (
  CREDIT_TENDER_ID  VARCHAR(36) NOT NULL,
  ACCOUNT_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(CREDIT_TENDER_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.CREDIT_TENDER(ID),
  FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT_ENTITY_GROUP.ACCOUNT(ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.CREDIT_TENDER_PAYMENT_METHOD_TYPE_JOIN (
  CREDIT_TENDER_ID  VARCHAR(36) NOT NULL,
  PAYMENT_METHOD_TYPE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(CREDIT_TENDER_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.CREDIT_TENDER(ID),
  FOREIGN KEY(PAYMENT_METHOD_TYPE_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD_TYPE(ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_CARD_PAYMENT_METHOD_TYPE_JOIN (
  PAYMENT_CARD_ID  VARCHAR(36) NOT NULL,
  PAYMENT_METHOD_TYPE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(PAYMENT_CARD_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_CARD(ID),
  FOREIGN KEY(PAYMENT_METHOD_TYPE_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD_TYPE(ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.COUPON_MANUFACTURER_JOIN (
  COUPON_ID  VARCHAR(36) NOT NULL,
  PARTY_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(COUPON_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.COUPON(ID),
  FOREIGN KEY(PARTY_ID) REFERENCES PARTY_ENTITY_GROUP.PARTY(ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.COUPON_PAYMENT_METHOD_TYPE_JOIN (
  COUPON_ID  VARCHAR(36) NOT NULL,
  PAYMENT_METHOD_TYPE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(COUPON_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.COUPON(ID),
  FOREIGN KEY(PAYMENT_METHOD_TYPE_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD_TYPE(ID)
);

CREATE TABLE PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD_PAYMENT_METHOD_TYPE_JOIN (
  PAYMENT_METHOD_ID  VARCHAR(36) NOT NULL,
  PAYMENT_METHOD_TYPE_ID VARCHAR(36) NOT NULL,
  FOREIGN KEY(PAYMENT_METHOD_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD(ID),
  FOREIGN KEY(PAYMENT_METHOD_TYPE_ID) REFERENCES PAYMENT_METHOD_ENTITY_GROUP.PAYMENT_METHOD_TYPE(ID)
);