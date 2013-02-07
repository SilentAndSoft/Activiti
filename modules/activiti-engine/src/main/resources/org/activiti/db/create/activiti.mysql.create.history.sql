-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: liquibase/activiti-history-master.xml
-- Ran at: 2/7/13 4:45 PM
-- Against: activiti@localhost@jdbc:mysql://localhost:3306/activiti?autoReconnect=true
-- Liquibase version: 2.0.3
-- *********************************************************************

-- Lock Database
-- Changeset liquibase/activiti-history-5.7.xml::13 ACT_HI_PROCINST::trademakers::(Checksum: 3:00f4974dda5b8481e5f6e214c506fdbe)
CREATE TABLE `ACT_HI_PROCINST` (`ID_` VARCHAR(64) NOT NULL, `PROC_INST_ID_` VARCHAR(64) NOT NULL, `BUSINESS_KEY_` VARCHAR(255), `PROC_DEF_ID_` VARCHAR(64) NOT NULL, `START_TIME_` datetime NOT NULL, `END_TIME_` datetime, `DURATION_` BIGINT, `START_USER_ID_` VARCHAR(255), `START_ACT_ID_` VARCHAR(255), `END_ACT_ID_` VARCHAR(255), `SUPER_PROCESS_INSTANCE_ID_` VARCHAR(64), CONSTRAINT `PK_ACT_HI_PROCINST` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.7.xml::13.1 UK_ACT_HI_PROCINST::trademakers::(Checksum: 3:7a5de961b84c19234bba6eca127b4625)
ALTER TABLE `ACT_HI_PROCINST` ADD CONSTRAINT `UK_ACT_HI_PROCINST` UNIQUE (`PROC_INST_ID_`);


-- Changeset liquibase/activiti-history-5.7.xml::13.2.2 ACT_UNIQ_HI_BUS_KEY::trademakers::(Checksum: 3:477f8ef75e72853f82728d65ba2a1de8)
ALTER TABLE `ACT_HI_PROCINST` ADD CONSTRAINT `ACT_UNIQ_HI_BUS_KEY` UNIQUE (`PROC_DEF_ID_`, `BUSINESS_KEY_`);


-- Changeset liquibase/activiti-history-5.7.xml::14 ACT_HI_ACTINST::trademakers::(Checksum: 3:c8030c5fd45f7ed7b46f4cff8d155c3c)
CREATE TABLE `ACT_HI_ACTINST` (`ID_` VARCHAR(64) NOT NULL, `PROC_DEF_ID_` VARCHAR(64) NOT NULL, `PROC_INST_ID_` VARCHAR(64) NOT NULL, `EXECUTION_ID_` VARCHAR(64) NOT NULL, `ACT_ID_` VARCHAR(255) NOT NULL, `ACT_NAME_` VARCHAR(255), `ACT_TYPE_` VARCHAR(255) NOT NULL, `ASSIGNEE_` VARCHAR(64), `START_TIME_` datetime NOT NULL, `END_TIME_` datetime, `DURATION_` BIGINT, CONSTRAINT `PK_ACT_HI_ACTINST` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.7.xml::15 ACT_HI_DETAIL::trademakers::(Checksum: 3:3e980b8625f372599ef20a63f164c107)
CREATE TABLE `ACT_HI_DETAIL` (`ID_` VARCHAR(64) NOT NULL, `TYPE_` VARCHAR(255) NOT NULL, `PROC_INST_ID_` VARCHAR(64), `TASK_ID_` VARCHAR(64), `EXECUTION_ID_` VARCHAR(64), `ACT_INST_ID_` VARCHAR(64), `NAME_` VARCHAR(255) NOT NULL, `VAR_TYPE_` VARCHAR(255), `REV_` integer, `TIME_` datetime NOT NULL, `BYTEARRAY_ID_` VARCHAR(64), `DOUBLE_` DOUBLE, `LONG_` BIGINT, `TEXT_` VARCHAR(4000), `TEXT2_` VARCHAR(4000), CONSTRAINT `PK_ACT_HI_DETAIL` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.7.xml::16 Activiti 5.1 Update ACT_HI_TASKINST::trademakers::(Checksum: 3:523f5b8367c7a9a9e23e15d4d9566088)
CREATE TABLE `ACT_HI_TASKINST` (`ID_` VARCHAR(64) NOT NULL, `PROC_DEF_ID_` VARCHAR(64), `TASK_DEF_KEY_` VARCHAR(255), `PROC_INST_ID_` VARCHAR(64), `EXECUTION_ID_` VARCHAR(64), `NAME_` VARCHAR(255), `DESCRIPTION_` VARCHAR(4000), `ASSIGNEE_` VARCHAR(64), `START_TIME_` datetime NOT NULL, `END_TIME_` datetime, `DURATION_` BIGINT, `DELETE_REASON_` VARCHAR(4000), `PRIORITY_` integer, `DUE_DATE_` datetime, `OWNER_` VARCHAR(64), `PARENT_TASK_ID_` VARCHAR(64), CONSTRAINT `PK_ACT_HI_TASKINST` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.7.xml::17 Activiti 5.4 Create ACT_HI_COMMENT::trademakers::(Checksum: 3:64408c63461e86375ea8749a2f8e606a)
CREATE TABLE `ACT_HI_COMMENT` (`ID_` VARCHAR(64) NOT NULL, `TIME_` datetime NOT NULL, `USER_ID_` VARCHAR(255), `TASK_ID_` VARCHAR(64), `PROC_INST_ID_` VARCHAR(64), `MESSAGE_` VARCHAR(4000), `TYPE_` VARCHAR(255), `ACTION_` VARCHAR(255), `FULL_MSG_` LONGBLOB, CONSTRAINT `PK_ACT_HI_COMMENT` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.7.xml::18 Activiti 5.4 Create ACT_HI_ATTACHMENT::trademakers::(Checksum: 3:5b9935f2f79596c9cf4a329833279f65)
CREATE TABLE `ACT_HI_ATTACHMENT` (`ID_` VARCHAR(64) NOT NULL, `REV_` integer, `USER_ID_` VARCHAR(255), `NAME_` VARCHAR(255), `DESCRIPTION_` VARCHAR(4000), `TYPE_` VARCHAR(255), `TASK_ID_` VARCHAR(64), `PROC_INST_ID_` VARCHAR(64), `URL_` VARCHAR(4000), `CONTENT_ID_` VARCHAR(64), CONSTRAINT `PK_ACT_HI_ATTACHMENT` PRIMARY KEY (`ID_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.7.xml::25 ACT_IDX_HI_PRO_INST_END::trademakers::(Checksum: 3:682c05c7c07325608625382a0bc48408)
CREATE INDEX `ACT_IDX_HI_PRO_INST_END` ON `ACT_HI_PROCINST`(`END_TIME_`);


-- Changeset liquibase/activiti-history-5.7.xml::26 ACT_IDX_HI_PRO_I_BUSKEY::trademakers::(Checksum: 3:d75ff4683f8a81d16012d80fea8dae27)
CREATE INDEX `ACT_IDX_HI_PRO_I_BUSKEY` ON `ACT_HI_PROCINST`(`BUSINESS_KEY_`);


-- Changeset liquibase/activiti-history-5.7.xml::27 ACT_IDX_HI_ACT_INST_START::trademakers::(Checksum: 3:a669421332d6638fb16213c6723cd3cb)
CREATE INDEX `ACT_IDX_HI_ACT_INST_START` ON `ACT_HI_ACTINST`(`START_TIME_`);


-- Changeset liquibase/activiti-history-5.7.xml::28 ACT_IDX_HI_ACT_INST_END::trademakers::(Checksum: 3:431543ec3a95f263a91adec6e84729e0)
CREATE INDEX `ACT_IDX_HI_ACT_INST_END` ON `ACT_HI_ACTINST`(`END_TIME_`);


-- Changeset liquibase/activiti-history-5.7.xml::29 ACT_IDX_HI_DETAIL_PROC_INST::trademakers::(Checksum: 3:f3eb53ae07ceb08c8d0066d00be26a4f)
CREATE INDEX `ACT_IDX_HI_DETAIL_PROC_INST` ON `ACT_HI_DETAIL`(`PROC_INST_ID_`);


-- Changeset liquibase/activiti-history-5.7.xml::30 ACT_IDX_HI_DETAIL_ACT_INST::trademakers::(Checksum: 3:bc91b120e7eaefd127f006c4f7b4edbf)
CREATE INDEX `ACT_IDX_HI_DETAIL_ACT_INST` ON `ACT_HI_DETAIL`(`ACT_INST_ID_`);


-- Changeset liquibase/activiti-history-5.7.xml::31 ACT_IDX_HI_DETAIL_TIME::trademakers::(Checksum: 3:2bdae734eb1e90701cdda40af696e68a)
CREATE INDEX `ACT_IDX_HI_DETAIL_TIME` ON `ACT_HI_DETAIL`(`TIME_`);


-- Changeset liquibase/activiti-history-5.7.xml::32 ACT_IDX_HI_DETAIL_NAME::trademakers::(Checksum: 3:0ffce2cda8e6629337f21afe03da7542)
CREATE INDEX `ACT_IDX_HI_DETAIL_NAME` ON `ACT_HI_DETAIL`(`NAME_`);


-- Changeset liquibase/activiti-history-5.9.xml::14 ACT_HI_PROCINST.DELETE_REASON_::trademakers::(Checksum: 3:54ad2c1dc9cb02bfb52a66cfc1c66aa3)
ALTER TABLE `ACT_HI_PROCINST` ADD `DELETE_REASON_` VARCHAR(4000);


-- Changeset liquibase/activiti-history-5.10.xml::9 ACT_IDX_HI_DETAIL_TASK_ID::trademakers::(Checksum: 3:97a0cbf45f348b4f4736dd3ed07bd098)
CREATE INDEX `ACT_IDX_HI_DETAIL_TASK_ID` ON `ACT_HI_DETAIL`(`TASK_ID_`);


-- Changeset liquibase/activiti-history-5.11.xml::9 Activiti 5.11 Update ACT_HI_ACTINST::trademakers::(Checksum: 3:8970a107e1f9caba608b4077cc7ad65d)
ALTER TABLE `ACT_HI_ACTINST` ADD `TASK_ID_` VARCHAR(64);

ALTER TABLE `ACT_HI_ACTINST` ADD `CALL_PROC_INST_ID_` VARCHAR(64);


-- Changeset liquibase/activiti-history-5.11.xml::9.1 Activiti 5.11 Create Index on ACT_HI_ACTINST::trademakers::(Checksum: 3:d00c20e5802342aaa5a251692bb312d1)
CREATE INDEX `ACT_IDX_HI_ACT_INST_PROCINST` ON `ACT_HI_ACTINST`(`PROC_INST_ID_`, `ACT_ID_`);


-- Changeset liquibase/activiti-history-5.11.xml::10 Activiti 5.11 Update ACT_HI_TASKINST::trademakers::(Checksum: 3:5310733ba3499bcbe6bb37cbd07f2a51)
ALTER TABLE `ACT_HI_TASKINST` MODIFY `OWNER_` VARCHAR(255);

ALTER TABLE `ACT_HI_TASKINST` MODIFY `ASSIGNEE_` VARCHAR(255);


-- Changeset liquibase/activiti-history-5.11.xml::11 Activiti 5.11 Create Table ACT_HI_VARINST::trademakers::(Checksum: 3:fb45de9d7e98d1aa782ce6d20b0d5bbc)
CREATE TABLE `ACT_HI_VARINST` (`ID_` VARCHAR(64) NOT NULL, `PROC_INST_ID_` VARCHAR(64), `EXECUTION_ID_` VARCHAR(64), `TASK_ID_` VARCHAR(64), `NAME_` VARCHAR(255) NOT NULL, `VAR_TYPE_` VARCHAR(100), `REV_` integer, `BYTEARRAY_ID_` VARCHAR(64), `DOUBLE_` DOUBLE, `LONG_` BIGINT, `TEXT_` VARCHAR(4000), `TEXT2_` VARCHAR(4000), CONSTRAINT `PK_ACT_HI_VARINST` PRIMARY KEY (`ID_`, `NAME_`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- Changeset liquibase/activiti-history-5.11.xml::11.1 Activiti 5.11 Create Index on ACT_HI_VARINST::trademakers::(Checksum: 3:8e38f0f467738b465f82b24e5ffd6c84)
CREATE INDEX `ACT_IDX_HI_PROCVAR_PROC_INST` ON `ACT_HI_VARINST`(`PROC_INST_ID_`);


-- Changeset liquibase/activiti-history-5.11.xml::11.2 Activiti 5.11 Create Index on ACT_HI_VARINST::trademakers::(Checksum: 3:073fe2780a7f3f19c1bf034800f9d3bc)
CREATE INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE` ON `ACT_HI_VARINST`(`NAME_`, `VAR_TYPE_`);


-- Changeset liquibase/activiti-history-5.12.xml::2 Activiti 5.12 Update ACT_HI_TASKINST::trademakers::(Checksum: 3:319900036855ef42da46e29d4d01c05f)
ALTER TABLE `ACT_HI_TASKINST` ADD `CLAIM_TIME_` datetime;


-- Changeset liquibase/activiti-history-5.12.xml::3 Activiti 5.12 Update ACT_HI_ACTINST assignee column size::fheremans::(Checksum: 3:7fce6782a51bfd36d2232adb3d386d14)
ALTER TABLE `ACT_RU_TASK` MODIFY `OWNER_` VARCHAR(255);


-- Release Database Lock
-- Release Database Lock
