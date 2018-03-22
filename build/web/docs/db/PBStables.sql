-- -----------------------------------------------------
-- Table `pbsdev`.`Cases`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`cases`;

CREATE TABLE IF NOT EXISTS `pbsdb`.`cases` (
  `CaseID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Debtor1` SMALLINT NOT NULL,
  `Debtor2` SMALLINT NULL,
  `CaseNumber` VARCHAR(45) NULL,
  `Chapter_filing` SMALLINT,
  `Joint` VARCHAR(2) NULL COMMENT '\"On\" or blank',
  `Active`  VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Status`   VARCHAR(45) NOT NULL,   
  `AssignTo` SMALLINT, 
  `CreatedByID` SMALLINT NULL COMMENT 'User ID',
  `CreatedDate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy`  SMALLINT NULL COMMENT 'User ID',
  `ModifiedDate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `FiledDate` DATE NULL,
  `priority_unsecured_claims` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `District_of_bankruptcy` VARCHAR(45) NULL COMMENT '\"No\" or blank',
  `BK_previous_8years` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Do_you_rent` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Fill_out_eviction` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"  -  Form101a',
  `Business_sole_priority` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Primarily_consumer_debts` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Primarily_business_debts` VARCHAR(3) NULL COMMENT 'If filing chapter 7, answer: \"Yes\" or \"No\"',
  `Are_you_filing_chapter7` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Can_pay_unsecured_creditors` VARCHAR(3) NULL COMMENT '\"Yes\" or \"No\"',
  `Number_creditors_owe` VARCHAR(45) NULL COMMENT 'Enter the range: Check box options \n1-49\n50-99\n100-199\netc...',
  `Value_of_assets` DOUBLE NULL COMMENT 'Enter the range:\n$0-$50,000\n$50,001-$100,000\n$100,001-$500,000\netc...',
  `Value_of_liability` DOUBLE NULL COMMENT 'Enter the range:\n$0-$50,000\n$50,001-$100,000\n$100,001-$500,000\netc...',
  `Filing_bk_legal_consequences` VARCHAR(3) NULL COMMENT '\"Yes\"  or \"No\"',
  `Filing_bk_fraud` VARCHAR(3) NULL COMMENT '\"Yes\"  or \"No\"  B101',
  `Filing_chapter11` VARCHAR(2) NULL COMMENT '\"No. - B101',
  `Filing_chapter11_not_small_bus` VARCHAR(2) NULL COMMENT 'B101 - \"Yes\"',
  `Total_realproperty_value_own` DOUBLE NULL,
  PRIMARY KEY (`CaseID`)
)ENGINE = InnoDB;
ALTER TABLE cases AUTO_INCREMENT=10001;



-- -----------------------------------------------------
-- Table `pbsdb`.`forms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`forms` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`forms` (
  `FormID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Order` SMALLINT NOT NULL,
  `Name` VARCHAR(25) NOT NULL,
  `Chapter` VARCHAR(10) NOT NULL,
  `BI` VARCHAR(2) NOT NULL,
  `Category` VARCHAR(80) NOT NULL,
  `State` VARCHAR(25) NULL,
  `Description` VARCHAR(255) NOT NULL,
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FormID`)
)ENGINE = InnoDB;
ALTER TABLE forms AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Table `pbsdb`.`checklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`checklist` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`checklist` (
  `ChecklistID` SMALLINT NOT NULL AUTO_INCREMENT,
  `CaseID` SMALLINT NOT NULL,
  `Evaluation` VARCHAR(3) NULL,
  `Filed` VARCHAR(3) NULL,
  `Debtors` VARCHAR(3) NULL,
  `Creditors` VARCHAR(3) NULL,
  `Assets` VARCHAR(3) NULL,
  `Expenses` VARCHAR(3) NULL,
  PRIMARY KEY (`ChecklistID`)
)ENGINE = InnoDB;
ALTER TABLE checklist AUTO_INCREMENT=1000;

-- -----------------------------------------------------
-- Table `pbsdb`.`Rule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`rule` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`Rule` (
  `RuleID` SMALLINT NOT NULL AUTO_INCREMENT,
  `State` VARCHAR(2) NULL,
  `Title` VARCHAR(80) NULL,
  `FED` BOOLEAN,
  `Last_update` TIMESTAMP NULL,
  PRIMARY KEY (`RuleID`)
)ENGINE = InnoDB;
ALTER TABLE rule AUTO_INCREMENT=1000;

-- -----------------------------------------------------
-- Table `pbsdb`.`statemedian`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`statemedian` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`statemedian` (
  `StateMedianID` SMALLINT NOT NULL AUTO_INCREMENT,
  `StateName` VARCHAR(2) NOT NULL,
  `Monthly` DOUBLE NOT NULL,
  `SixMonthTotal` DOUBLE NOT NULL,
  `AnnnualTotal` DOUBLE NOT NULL,
  PRIMARY KEY (`StateMedianID`)
)ENGINE = InnoDB;
ALTER TABLE statemedian AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Table `pbsdb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`Address` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`address` (
  `AddressID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Street1` VARCHAR(80) NOT NULL,
  `Street2` VARCHAR(80) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL COMMENT 'Format: xxxxx-xxxx',
  `County` VARCHAR(45) NULL,
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AddressID`)
)ENGINE = InnoDB;
ALTER TABLE address AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `pbsdb`.`Profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`profile` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`profile` (
  `ProfileID` SMALLINT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `MiddleName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Suffix` VARCHAR(3) NULL,
  `Street1` VARCHAR(80) NOT NULL,
  `Street2` VARCHAR(80) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL, 
  `WorkPhone` VARCHAR(20) NULL,
  `MobilePhone` VARCHAR(20) NULL,
  `HomePhone` VARCHAR(20) NULL,
  `Age` SMALLINT NULL,
  `Gender` VARCHAR(10) NOT NULL,
  `SocialSecurityNo` VARCHAR(15) NULL,  
  `DateOfBirth` DATE NOT NULL,
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProfileID`)
)ENGINE = InnoDB;
ALTER TABLE profile AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Table `pbsdb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`user` ;

CCREATE TABLE IF NOT EXISTS `pbsdb`.`user` (
 `UserID` SMALLINT NOT NULL AUTO_INCREMENT,
 `RoleID` SMALLINT NOT NULL,
 `UserName` VARCHAR(45) NOT NULL,
 `FullName` VARCHAR(80) NOT NULL,
 `Email` VARCHAR(80) NOT NULL,
 `Password` VARCHAR(45) NOT NULL,
 `Question1` VARCHAR(80) NULL,
 `Answer1` VARCHAR(45) NULL,
 `Question2` VARCHAR(80) NULL,
 `Answer2` VARCHAR(45) NULL,
 `Question3` VARCHAR(80) NULL,
 `Answer3` VARCHAR(45) NULL,
 `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (UserID)
)Engine=InnoDB;
ALTER TABLE user AUTO_INCREMENT=1001;


DROP TABLE IF EXISTS `pbsdb`.`Subscription` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`Subscription` (
 `SubscriptionID` SMALLINT NOT NULL AUTO_INCREMENT,
 `UserID` SMALLINT,
 `GroupID` SMALLINT,
 `RoleID`  SMALLINT,
 `EmailAddress` VARCHAR(100) ,
 `PhoneNumber` VARCHAR(100) ,
 `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (SubscriptionID),
 FOREIGN KEY (UserID) REFERENCES User(UserID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
)Engine=InnoDB;
ALTER TABLE subscription AUTO_INCREMENT=1001;

DROP TABLE IF EXISTS `pbsdb`.`role` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`role` (
 `RoleID` SMALLINT NOT NULL AUTO_INCREMENT,
 `Type` VARCHAR(45) NOT NULL,
 `Title` VARCHAR(45) NOT NULL,
 `AccessLevel` SMALLINT NOT NULL,    
 PRIMARY KEY (RoleID)
)Engine=InnoDB;
ALTER TABLE role AUTO_INCREMENT=1;

- -----------------------------------------------------
-- Table `pbsdb`.`Group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`Group` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`Group` (
 `GroupID` SMALLINT NOT NULL AUTO_INCREMENT,
 `UserID` SMALLINT,
 `Name` VARCHAR(45) NOT NULL,
 `AccessLevel` SMALLINT NOT NULL,
 PRIMARY KEY (GroupID)
)Engine=InnoDB;
ALTER TABLE group AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `pbsdb`.`Firm` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`firm` (
  `FirmID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Street` VARCHAR(85) NULL,
  `City`  VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zip` VARCHAR(10) NULL,
  `Website` VARCHAR(80) NULL COMMENT 'URL',
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FirmID`)
)ENGINE = InnoDB;
ALTER TABLE firm AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `pbsdb`.`debtor` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`debtor` (
  `DebtorID` SMALLINT NOT NULL AUTO_INCREMENT,
  `ProfileID` SMALLINT NULL,
  `NumNoLocations` INT NULL COMMENT 'live in last 3 years',
  `ReceivedCounselingCert` VARCHAR(2) NULL,
  `CertAskCounseling` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `ReceivedBriefing` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `NotRequiredReceiveBriefing` VARCHAR(2) NULL,
  `InCapacity` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `Disability` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DebtorID`)
)ENGINE = InnoDB;
ALTER TABLE debtor AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Table `pbsdb`.`Eval`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`Eval` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`Eval` (
  `EvalID` SMALLINT NOT NULL AUTO_INCREMENT,
  `CaseID` SMALLINT,
  `ZipCode` VARCHAR(12) NULL,
  `Garnishment` VARCHAR(2) NULL,
  `IllnessDisability` VARCHAR(2) NULL,
  `CreditorHarassment` VARCHAR(2) NULL,
  `Lawsuites` VARCHAR(2) NULL,
  `Repossesssion` VARCHAR(2) NULL,
  `Divorce` VARCHAR(2) NULL,
  `WhyForeclosure` VARCHAR(2) NULL,
  `LossOfIncome` VARCHAR(2) NULL,
  `CreditCards` VARCHAR(2) NULL,
  `AutoLoans` VARCHAR(2) NULL,
  `IncomeTaxes` VARCHAR(2) NULL,
  `ChildSupport` VARCHAR(2) NULL,
  `BillsForeclosure` VARCHAR(2) NULL,
  `MedicalBills` VARCHAR(2) NULL,
  `PaydayLoans` VARCHAR(2) NULL,
  `OwnRealEstate` VARCHAR(3) NULL,
  `BehindPmtRealEstate` VARCHAR(3) NULL,
  `OwnVehical` VARCHAR(3) NULL,
  `BehindPmtVehical` VARCHAR(3) NULL,
  `AssetOverThousand` VARCHAR(3) NULL,
  `EmpFullTime` VARCHAR(2) NULL,
  `EmpPartTime` VARCHAR(2) NULL,
  `SelfEmployed` VARCHAR(2) NULL,
  `PensionRetire` VARCHAR(2) NULL,
  `ChildSupportAlimony` VARCHAR(2) NULL,
  `SocialSecurity` VARCHAR(2) NULL,
  `NoIncome` VARCHAR(2) NULL,
  `Farmer` VARCHAR(2) NULL,
  `TotalIncome` NUMERIC(15,2) NULL,
  `TotalExpenses` NUMERIC(15,2) NULL,
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (EvalID)
  )ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pbsdb`.`Creditor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`Creditor` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`Creditor` (
  `CreditorID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Creditor_name` VARCHAR(45) NULL,
  `CaseID` INT NULL,
  `AddressID` INT NOT NULL,
  `Priority_amount` DOUBLE NULL,
  `Nonpriority_amount` DOUBLE NULL,
  `Total_claim` DOUBLE NULL,
  `Amount_number` VARCHAR(4) NULL,
  `Date_incurred` DATE NULL,
  `Contingent` VARCHAR(2) NULL COMMENT '\"On\" or blank',
  `Unilquidated` VARCHAR(2) NULL COMMENT '\"On\" or blank',
  `Disputed` VARCHAR(2) NULL COMMENT '\"On\" or blank',
  `Domestic_support_oblig` VARCHAR(2) NULL,
  `Taxes_certain_debt` VARCHAR(2) NULL,
  `Claims_death_injury` VARCHAR(2) NULL,
  `Other_specify` VARCHAR(2) NULL COMMENT '\"On\" or blank',
  `Other_specify_text` VARCHAR(45) NULL,
  `Claim_subject_offset` VARCHAR(3) NULL,
  `LastUpdate` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (CreditorID)
)ENGINE = InnoDB;
ALTER TABLE creditor AUTO_INCREMENT=1;


-- -----------------------------------------------------
-- Table `pbsdb`.`Business`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`Business` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`Business` (
  `BusinessID` SMALLINT NOT NULL AUTO_INCREMENT,
  `AddressID` SMALLINT NULL,
  `CaseID` SMALLINT NULL,
  `Business_ein` VARCHAR(15) NULL,
  `Health_business` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `Single_asset_real_estate` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `Stock_broker` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `Commodity_broker` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `None_of_the_above` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `Filing_chapter11_not_small_bus` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `LastDated` TIMESTAMP NULL,
  PRIMARY KEY (`BusinessID`),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
)ENGINE = InnoDB;
ALTER TABLE business AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `pbsdb`.`Realproperty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`realproperty` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`realproperty` (
  `RealpropertyID` SMALLINT NOT NULL AUTO_INCREMENT,
  `AddressID` INT NULL,
  `AssetsID` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Hazard2` VARCHAR(80) NULL,
  `Public_health_safety` VARCHAR(2) NULL COMMENT '\"No\" or blank',
  `Immediate_attention` VARCHAR(80) NULL,
  `Why_immediate_attention` VARCHAR(80) NULL,
  `Eviction` VARCHAR(2) NULL,
  `Landlord_name` VARCHAR(45) NULL,
  `Who_interest_in_property` VARCHAR(45) NULL COMMENT 'Form 106AB',
  `Hazard1` VARCHAR(80) NULL,
  `Current_value` DOUBLE NULL,
  `Current_value_own` DOUBLE NULL,
  `Community_property` VARCHAR(2) NULL COMMENT '\"No\" or blank\nForm 106AB see instruction',
  `Other_information` VARCHAR(45) NULL COMMENT 'Other information you wish to add about this item, such as local\nproperty identification number',
  PRIMARY KEY (`RealpropertyID`)
 )ENGINE = InnoDB;
ALTER TABLE realproperty AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `pbsdb`.`Fee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`fee` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`fee` (
  `FeeID` SMALLINT NOT NULL AUTO_INCREMENT,
  `CaseID` INT NOT NULL,
  `Fee_wavier` TINYINT(1) NULL COMMENT '\"On\" or Blank',
  `Fee_1st_install` DOUBLE NULL COMMENT 'Currency',
  `Fee_2nd_install` DOUBLE NULL,
  `Fee_3rd_install` DOUBLE NULL,
  `Fee_4th_install` DOUBLE NULL,
  `Fee_total` DOUBLE NULL,
  `Pay_fee_install` VARCHAR(2) NULL,
  `Request_fee_wavier` VARCHAR(2) NULL COMMENT '\"Yes\" or \"No\"',
  `Pay_entire_fee` VARCHAR(2) NULL,
  `Date_1st_install` DATE NULL,
  `Date_2nd_install` DATE NULL,
  `Date_3rd_install` DATE NULL,
  `Date_4th_install` DATE NULL,
  PRIMARY KEY (`FeeID`)
)ENGINE = InnoDB;
ALTER TABLE fee AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `pbsdb`.`Vehical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`vehicle` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`vehicle` (
  `VehicleID` INT NOT NULL,
  `AssetsID` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Make` VARCHAR(45) NULL,
  `Year` VARCHAR(4) NULL,
  `Value` DOUBLE NULL,
  `Value_own` DOUBLE NULL,
  PRIMARY KEY (`VehicleID`)
)ENGINE = InnoDB;
ALTER TABLE vehicle AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Table `pbsdb`.`Equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`equipment` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`equipment` (
  `EquipmentID` SMALLINT NOT NULL AUTO_INCREMENT,
  `AssetsID` INT NOT NULL,
  `Type` VARCHAR(45) NULL COMMENT 'Materiel\nTools\nAgricultural equipment\nList of agricultural equipment\nAudio equipment\nCamping equipment\nCapital equipment\nCricket equipment\nDiving equipment\nElectrical equipment\nEmergency vehicle equipment\nFire apparatus\nGolf equipment\nHeavy equipment (construction)\nHiking equipment\nHorse tack, also known as horse equipment\nIce hockey equipment\nLaboratory equipment\nMedical equipment\nMilitary equipment',
  `Name` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Make` VARCHAR(45) NULL,
  `Year` VARCHAR(4) NULL,
  `Value` DOUBLE NULL,
  `Value_own` DOUBLE NULL,
  `Last_update` TIMESTAMP NULL,
  PRIMARY KEY (`EquipmentID`)
)ENGINE = InnoDB;
ALTER TABLE equipment AUTO_INCREMENT=1;


-- -----------------------------------------------------
-- Table `pbsdb`.`Household`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`household` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`household` (
  `HouseholdID` SMALLINT NOT NULL AUTO_INCREMENT,
  `AssetsID` SMALLINT NOT NULL,
  `Type` VARCHAR(45) NULL COMMENT 'Jewelery\nFurniture\nTelevision\nAppliannce\n\n',
  `Name` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Make` VARCHAR(45) NULL,
  `Year` VARCHAR(4) NULL,
  `Last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Value` DOUBLE NULL,
  `Value_own` DOUBLE NULL,
  PRIMARY KEY (`HouseholdID`)
)ENGINE = InnoDB;
ALTER TABLE household AUTO_INCREMENT=1001;


-- -----------------------------------------------------
-- Table `pbsdb`.`District`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pbsdb`.`District` ;

CREATE TABLE IF NOT EXISTS `pbsdb`.`district` (
  `DistrictID` INT NOT NULL,
  `AddressID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Last_update` TIMESTAMP NULL,
  PRIMARY KEY (`DistrictID`))
ENGINE = InnoDB;
