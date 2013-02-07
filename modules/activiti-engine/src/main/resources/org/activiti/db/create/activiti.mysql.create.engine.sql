-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: liquibase/activiti-engine-master.xml
-- Ran at: 2/7/13 4:45 PM
-- Against: activiti@localhost@jdbc:mysql://localhost:3306/activiti?autoReconnect=true
-- Liquibase version: 2.0.3
-- *********************************************************************

-- Lock Database
-- Changeset liquibase/activiti-engine-5.7.xml::1 ACT_GE_PROPERTY::trademakers::(Checksum: 3:83f2873b901c7b7afc736a20ceb73e37)
CREATE TABLE `ACT_GE_PROPERTY` (`NAME_` VARCHAR(64) NOT NULL, `VALUE_` VARCHAR(300), `REV_` integer, CONSTRAINT `PK_ACT_GE_PROPERTY` PRIMARY KEY (`NAME_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::1.2 ACT_GE_PROPERTY::trademakers::(Checksum: 3:f6a317a310eb5e906132095b1d639964)
INSERT INTO `ACT_GE_PROPERTY` (`NAME_`, `REV_`, `VALUE_`) VALUES ('next.dbid', 1, '1');


-- Changeset liquibase/activiti-engine-5.7.xml::2 ACT_GE_BYTEARRAY::trademakers::(Checksum: 3:b48fe09474942a2896e649d4e62013bd)
CREATE TABLE `ACT_GE_BYTEARRAY` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `NAME_` VARCHAR(255), `DEPLOYMENT_ID_` VARCHAR(64), `BYTES_` LONGBLOB, CONSTRAINT `PK_ACT_GE_BYTEARRAY` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::3 ACT_RE_DEPLOYMENT::trademakers::(Checksum: 3:859f758c2809fd95df1390f020759dfe)
CREATE TABLE `ACT_RE_DEPLOYMENT` (`ID_` VARCHAR(64) NOT NULL, `NAME_` VARCHAR(255), `DEPLOY_TIME_` datetime, CONSTRAINT `PK_ACT_RE_DEPLOYMENT` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::4 ACT_RU_EXECUTION::trademakers::(Checksum: 3:f2ca762861642585cd9d4efb4e0d615c)
CREATE TABLE `ACT_RU_EXECUTION` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `PROC_INST_ID_` VARCHAR(64), `BUSINESS_KEY_` VARCHAR(255), `PARENT_ID_` VARCHAR(64), `PROC_DEF_ID_` VARCHAR(64), `SUPER_EXEC_` VARCHAR(64), `ACT_ID_` VARCHAR(255), `IS_ACTIVE_` TINYINT, `IS_CONCURRENT_` TINYINT, `IS_SCOPE_` TINYINT, CONSTRAINT `PK_ACT_RU_EXECUTION` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::4.1.2 ACT_UNIQ_RU_BUS_KEY::trademakers::(Checksum: 3:6cabb0e25ad66ce335a4f8c87c443de7)
ALTER TABLE `ACT_RU_EXECUTION` ADD CONSTRAINT `ACT_UNIQ_RU_BUS_KEY` UNIQUE (`PROC_DEF_ID_`, `BUSINESS_KEY_`);


-- Changeset liquibase/activiti-engine-5.7.xml::5 ACT_RU_JOB::trademakers::(Checksum: 3:a223eaebfa40dba7a96adf81d33bb217)
CREATE TABLE `ACT_RU_JOB` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `TYPE_` VARCHAR(255) NOT NULL, `LOCK_EXP_TIME_` datetime, `LOCK_OWNER_` VARCHAR(255), `EXCLUSIVE_` TINYINT, `EXECUTION_ID_` VARCHAR(64), `PROCESS_INSTANCE_ID_` VARCHAR(64), `RETRIES_` integer, `EXCEPTION_STACK_ID_` VARCHAR(64), `EXCEPTION_MSG_` VARCHAR(4000), `DUEDATE_` datetime, `REPEAT_` VARCHAR(255), `HANDLER_TYPE_` VARCHAR(255), `HANDLER_CFG_` VARCHAR(4000), CONSTRAINT `PK_ACT_RU_JOB` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::9 ACT_RE_PROCDEF::trademakers::(Checksum: 3:609c48cf7fb4893a5a912ac03c5f2b82)
CREATE TABLE `ACT_RE_PROCDEF` (`ID_` VARCHAR(64) NOT NULL, `CATEGORY_` VARCHAR(255), `NAME_` VARCHAR(255), `KEY_` VARCHAR(255), `VERSION_` integer, `DEPLOYMENT_ID_` VARCHAR(64), `RESOURCE_NAME_` VARCHAR(4000), `DGRM_RESOURCE_NAME_` VARCHAR(4000), `HAS_START_FORM_KEY_` TINYINT, CONSTRAINT `PK_ACT_RE_PROCDEF` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::10 ACT_RU_TASK::trademakers::(Checksum: 3:f87c4eb14cba58dd66945dcd3bf6f813)
CREATE TABLE `ACT_RU_TASK` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `EXECUTION_ID_` VARCHAR(64), `PROC_INST_ID_` VARCHAR(64), `PROC_DEF_ID_` VARCHAR(64), `NAME_` VARCHAR(255), `DESCRIPTION_` VARCHAR(4000), `TASK_DEF_KEY_` VARCHAR(255), `ASSIGNEE_` VARCHAR(64), `PRIORITY_` integer, `CREATE_TIME_` datetime, `OWNER_` VARCHAR(64), `DELEGATION_` VARCHAR(64), `DUE_DATE_` datetime, `PARENT_TASK_ID_` VARCHAR(64), CONSTRAINT `PK_ACT_RU_TASK` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::11 ACT_RU_IDENTITYLINK::trademakers::(Checksum: 3:f20aec42922c781ba235d0d21783c03a)
CREATE TABLE `ACT_RU_IDENTITYLINK` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `GROUP_ID_` VARCHAR(64), `TYPE_` VARCHAR(255), `USER_ID_` VARCHAR(64), `TASK_ID_` VARCHAR(64), CONSTRAINT `PK_ACT_RU_IDENTITYLINK` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::12 ACT_RU_VARIABLE::trademakers::(Checksum: 3:c768b53964b08823174893a4535d143b)
CREATE TABLE `ACT_RU_VARIABLE` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `TYPE_` VARCHAR(255) NOT NULL, `NAME_` VARCHAR(255) NOT NULL, `EXECUTION_ID_` VARCHAR(64), `PROC_INST_ID_` VARCHAR(64), `TASK_ID_` VARCHAR(64), `BYTEARRAY_ID_` VARCHAR(64), `DOUBLE_` DOUBLE, `LONG_` BIGINT, `TEXT_` VARCHAR(4000), `TEXT2_` VARCHAR(4000), CONSTRAINT `PK_ACT_RU_VARIABLE` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.7.xml::21 ACT_IDX_EXEC_BUSKEY::trademakers::(Checksum: 3:6e4fc0d34c346a21e11966c81263ace7)
CREATE INDEX `ACT_IDX_EXEC_BUSKEY` ON `ACT_RU_EXECUTION`(`BUSINESS_KEY_`);


-- Changeset liquibase/activiti-engine-5.7.xml::22 ACT_IDX_TASK_CREATE::trademakers::(Checksum: 3:f237247c56ad5af0dbbd1568f2cd09da)
CREATE INDEX `ACT_IDX_TASK_CREATE` ON `ACT_RU_TASK`(`CREATE_TIME_`);


-- Changeset liquibase/activiti-engine-5.7.xml::23 ACT_IDX_IDENT_LNK_USER::trademakers::(Checksum: 3:497d4d4eddc6b4d9dbd8f6d8abb222bf)
CREATE INDEX `ACT_IDX_IDENT_LNK_USER` ON `ACT_RU_IDENTITYLINK`(`USER_ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::24 ACT_IDX_IDENT_LNK_GROUP::trademakers::(Checksum: 3:9b03e22ef5d9f5961b2453b7db5fc6a8)
CREATE INDEX `ACT_IDX_IDENT_LNK_GROUP` ON `ACT_RU_IDENTITYLINK`(`GROUP_ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::51 ACT_FK_BYTEARR_DEPL::trademakers::(Checksum: 3:fbebf8fdd4ad06c67da4a8c14fda628e)
ALTER TABLE `ACT_GE_BYTEARRAY` ADD CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::52 ACT_FK_EXE_PROCINST::trademakers::(Checksum: 3:06eddbe55cb6d5917dec7045809d96b5)
-- Changeset liquibase/activiti-engine-5.7.xml::52.1 ACT_FK_EXE_PROCINST MySQL::trademakers::(Checksum: 3:89a98b8dfec11689e07746e4e2930e73)
alter table ACT_RU_EXECUTION add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_) references ACT_RU_EXECUTION (ID_) on delete cascade on update cascade;


-- Changeset liquibase/activiti-engine-5.7.xml::53 ACT_FK_EXE_PARENT::trademakers::(Checksum: 3:b8c2607c87be7b7368fb6c2c0d5af881)
ALTER TABLE `ACT_RU_EXECUTION` ADD CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::54 ACT_FK_EXE_SUPER::trademakers::(Checksum: 3:c0883e51216970df5a3fb4ff93388d82)
ALTER TABLE `ACT_RU_EXECUTION` ADD CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::57 ACT_FK_TSKASS_TASK::trademakers::(Checksum: 3:be7abbf398f05eadf79c78ff7a377491)
ALTER TABLE `ACT_RU_IDENTITYLINK` ADD CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::58 ACT_FK_TASK_EXE::trademakers::(Checksum: 3:5afe12bf1349a6b516062de31955fc58)
ALTER TABLE `ACT_RU_TASK` ADD CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::59 ACT_FK_TASK_PROCINST::trademakers::(Checksum: 3:b7e947a4126db8bd28b24105e0289c2e)
ALTER TABLE `ACT_RU_TASK` ADD CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::60 ACT_FK_TASK_PROCDEF::trademakers::(Checksum: 3:25ece10f364a958400ac6f2ae43dd36d)
ALTER TABLE `ACT_RU_TASK` ADD CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::62 ACT_FK_VAR_EXE::trademakers::(Checksum: 3:b208208780b3b8a4bf56f8786a9fe153)
ALTER TABLE `ACT_RU_VARIABLE` ADD CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::63 ACT_FK_VAR_PROCINST::trademakers::(Checksum: 3:d51e276ea59e3fa22cdb608b5fc42787)
ALTER TABLE `ACT_RU_VARIABLE` ADD CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::64 ACT_FK_VAR_BYTEARRAY::trademakers::(Checksum: 3:d9e957a154929aabc2ab452a2167cbee)
ALTER TABLE `ACT_RU_VARIABLE` ADD CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`);


-- Changeset liquibase/activiti-engine-5.7.xml::65 ACT_FK_JOB_EXCEPTION::trademakers::(Checksum: 3:1363cc07c8aad1d229c513714892e870)
ALTER TABLE `ACT_RU_JOB` ADD CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`);


-- Changeset liquibase/activiti-engine-5.9.xml::10 ACT_GE_BYTEARRAY.GENERATED_::trademakers::(Checksum: 3:e7aa1c5b1e1d90db4ff8813367f63e2b)
ALTER TABLE `ACT_GE_BYTEARRAY` ADD `GENERATED_` TINYINT;

UPDATE `ACT_GE_BYTEARRAY` SET `GENERATED_` = '0';


-- Changeset liquibase/activiti-engine-5.9.xml::11 ACT_RU_EXECUTION.IS_EVENT_SCOPE_::trademakers::(Checksum: 3:636068d01179fac833a50f959a1705b0)
ALTER TABLE `ACT_RU_EXECUTION` ADD `IS_EVENT_SCOPE_` TINYINT;

ALTER TABLE `ACT_RU_EXECUTION` ADD `SUSPENSION_STATE_` integer;

UPDATE `ACT_RU_EXECUTION` SET `IS_EVENT_SCOPE_` = '0';

UPDATE `ACT_RU_EXECUTION` SET `SUSPENSION_STATE_` = '1';


-- Changeset liquibase/activiti-engine-5.9.xml::12 ACT_RE_PROCDEF.REV_::trademakers::(Checksum: 3:4f3075476cef091ad911da0dc433f67f)
ALTER TABLE `ACT_RE_PROCDEF` ADD `REV_` integer;

ALTER TABLE `ACT_RE_PROCDEF` ADD `SUSPENSION_STATE_` integer;

UPDATE `ACT_RE_PROCDEF` SET `REV_` = '1';

UPDATE `ACT_RE_PROCDEF` SET `SUSPENSION_STATE_` = '1';


-- Changeset liquibase/activiti-engine-5.9.xml::13 ACT_RU_EVENT_SUBSCR::trademakers::(Checksum: 3:588b43d021970be80b963e34030e8dbc)
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `EVENT_TYPE_` VARCHAR(255) NOT NULL, `EVENT_NAME_` VARCHAR(255), `EXECUTION_ID_` VARCHAR(64), `PROC_INST_ID_` VARCHAR(64), `ACTIVITY_ID_` VARCHAR(64), `CONFIGURATION_` VARCHAR(255), `CREATED_` datetime NOT NULL, CONSTRAINT `PK_ACT_RU_EVENT_SUBSCR` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.9.xml::13.1 ACT_IDX_EVENT_SUBSCR_CONFIG_::trademakers::(Checksum: 3:4727158000ce80228e36eeeeacde778c)
CREATE INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_` ON `ACT_RU_EVENT_SUBSCR`(`CONFIGURATION_`);


-- Changeset liquibase/activiti-engine-5.9.xml::13.2 ACT_FK_EVENT_EXEC::trademakers::(Checksum: 3:89c7edd01a11df64670a084cdbdba5a5)
ALTER TABLE `ACT_RU_EVENT_SUBSCR` ADD CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`);


-- Changeset liquibase/activiti-engine-5.9.xml::13.3 ACT_IDX_EVENT_SUBSCR::trademakers::(Checksum: 3:c21de54dca4df301cf2d2728d4493667)
CREATE INDEX `ACT_IDX_EVENT_SUBSCR` ON `ACT_RU_EVENT_SUBSCR`(`EXECUTION_ID_`);


-- Changeset liquibase/activiti-engine-5.10.xml::2 ACT_RU_EXECUTION.CACHED_END_STATE::trademakers::(Checksum: 3:542126dedd8688a1570754caf4b0e08e)
ALTER TABLE `ACT_RU_EXECUTION` ADD `CACHED_ENT_STATE_` integer;

UPDATE `ACT_RU_EXECUTION` SET `CACHED_ENT_STATE_` = '7';


-- Changeset liquibase/activiti-engine-5.10.xml::3 ACT_RU_IDENTITYLINK.PROC_DEF_ID::trademakers::(Checksum: 3:95e90f215874e3218980aa5778b08f43)
ALTER TABLE `ACT_RU_IDENTITYLINK` ADD `PROC_DEF_ID_` VARCHAR(64);


-- Changeset liquibase/activiti-engine-5.10.xml::4 ACT_RE_PROCDEF_KEY_NOT_NULL::trademakers::(Checksum: 3:703fa27685f96e11b44f2fb06f93c71c)
ALTER TABLE `ACT_RE_PROCDEF` MODIFY `KEY_` VARCHAR(255) NOT NULL;


-- Changeset liquibase/activiti-engine-5.10.xml::5 ACT_IDX_VARIABLE_TASK_ID::trademakers::(Checksum: 3:1cd13424f9824745a27294484af45543)
CREATE INDEX `ACT_IDX_VARIABLE_TASK_ID` ON `ACT_RU_VARIABLE`(`TASK_ID_`);


-- Changeset liquibase/activiti-engine-5.10.xml::6 ACT_IDX_ATHRZ_PROCEDEF::trademakers::(Checksum: 3:da26bc8e0c11ee20ecc2b888b80ad5e7)
CREATE INDEX `ACT_IDX_ATHRZ_PROCEDEF` ON `ACT_RU_IDENTITYLINK`(`PROC_DEF_ID_`);


-- Changeset liquibase/activiti-engine-5.10.xml::7.1 ACT_UNIQ_PROCDEF::trademakers::(Checksum: 3:24667cea47a828e6b3d0769139c5c5f1)
ALTER TABLE `ACT_RE_PROCDEF` ADD CONSTRAINT `ACT_UNIQ_PROCDEF` UNIQUE (`KEY_`, `VERSION_`);


-- Changeset liquibase/activiti-engine-5.10.xml::8 ACT_FK_ATHRZ_PROCEDEF::trademakers::(Checksum: 3:e564b59a699f37b53facf903128652fe)
ALTER TABLE `ACT_RU_IDENTITYLINK` ADD CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`);


-- Changeset liquibase/activiti-engine-5.11.xml::2 Activiti 5.11 Update ACT_RE_DEPLOYMENT::trademakers::(Checksum: 3:2645c0a8ee212fea7c089a048e636670)
ALTER TABLE `ACT_RE_DEPLOYMENT` ADD `CATEGORY_` VARCHAR(255);


-- Changeset liquibase/activiti-engine-5.11.xml::3 Activiti 5.11 Create Table ACT_RE_MODEL::trademakers::(Checksum: 3:4179568ffc754a0c4f7ce20383680a7a)
CREATE TABLE `ACT_RE_MODEL` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `NAME_` VARCHAR(255), `KEY_` VARCHAR(255), `CATEGORY_` VARCHAR(255), `CREATE_TIME_` datetime, `LAST_UPDATE_TIME_` datetime, `VERSION_` integer, `META_INFO_` VARCHAR(4000), `DEPLOYMENT_ID_` VARCHAR(64), `EDITOR_SOURCE_VALUE_ID_` VARCHAR(64), `EDITOR_SOURCE_EXTRA_VALUE_ID_` VARCHAR(64), CONSTRAINT `PK_ACT_RE_MODEL` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-engine-5.11.xml::3.1 Activiti 5.11 Add Constraint to ACT_RE_MODEL::trademakers::(Checksum: 3:cae7d16cb90ee31151344b7fccc8d75d)
ALTER TABLE `ACT_RE_MODEL` ADD CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`);


-- Changeset liquibase/activiti-engine-5.11.xml::3.2 Activiti 5.11 Add Constraint to ACT_RE_MODEL::trademakers::(Checksum: 3:03a82868bf06a980c0edc0985e40f13c)
ALTER TABLE `ACT_RE_MODEL` ADD CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`);


-- Changeset liquibase/activiti-engine-5.11.xml::3.3 Activiti 5.11 Add Constraint to ACT_RE_MODEL::trademakers::(Checksum: 3:8e7bb028ee670cb7487412736fb31eba)
ALTER TABLE `ACT_RE_MODEL` ADD CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`);


-- Changeset liquibase/activiti-engine-5.11.xml::4 Activiti 5.11 Update ACT_RU_JOB::trademakers::(Checksum: 3:95d5d4704f5b6b454fdda3b74153b184)
ALTER TABLE `ACT_RU_JOB` ADD `PROC_DEF_ID_` VARCHAR(64);


-- Changeset liquibase/activiti-engine-5.11.xml::5 Activiti 5.11 Update ACT_RE_PROCDEF::trademakers::(Checksum: 3:5f7d01ea3c4e4aa5114337ed803e8fef)
ALTER TABLE `ACT_RE_PROCDEF` ADD `DESCRIPTION_` VARCHAR(4000);

ALTER TABLE `ACT_RE_PROCDEF` MODIFY `VERSION_` integer NOT NULL;


-- Changeset liquibase/activiti-engine-5.11.xml::6 Activiti 5.11 Update ACT_RU_TASK::trademakers::(Checksum: 3:7c0645022c6a9c83eea31ef8215871e3)
ALTER TABLE `ACT_RU_TASK` ADD `SUSPENSION_STATE_` integer;

UPDATE `ACT_RU_TASK` SET `SUSPENSION_STATE_` = '1';

ALTER TABLE `ACT_RU_TASK` MODIFY `OWNER_` VARCHAR(255);

ALTER TABLE `ACT_RU_TASK` MODIFY `ASSIGNEE_` VARCHAR(255);


-- Changeset liquibase/activiti-engine-5.11.xml::7 Activiti 5.11 Add Constraint to ACT_RU_EXECUTION::trademakers::(Checksum: 3:f546586b1f9fe030e866f4db640a1177)
ALTER TABLE `ACT_RU_EXECUTION` ADD CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`);


-- Changeset liquibase/activiti-engine-5.11.xml::8 Activiti 5.11 Update ACT_RU_IDENTITYLINK::trademakers::(Checksum: 3:2223fe871100a2441dde70984c5b0c30)
ALTER TABLE `ACT_RU_IDENTITYLINK` MODIFY `GROUP_ID_` VARCHAR(255);

ALTER TABLE `ACT_RU_IDENTITYLINK` MODIFY `USER_ID_` VARCHAR(255);


-- Changeset liquibase/activiti-engine-master.xml::1 Activiti 5.12 Update Schema Versions::trademakers::(Checksum: 3:6516d14069326092475dad969a886a41)
INSERT INTO `ACT_GE_PROPERTY` (`NAME_`, `REV_`, `VALUE_`) VALUES ('schema.version', 1, '5.12-SNAPSHOT');

INSERT INTO `ACT_GE_PROPERTY` (`NAME_`, `REV_`, `VALUE_`) VALUES ('schema.history', 1, 'create(5.12-SNAPSHOT)');


-- Release Database Lock
-- Release Database Lock
