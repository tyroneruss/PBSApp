Search Debtor:
SELECT DebtorID,FirstName,Middlename,LastName,Suffix,Street1,Street2,
       City,State,ZipCode,WorkPhone,MobilePhone,HomePhone,Email,
       Age,Gender,SocialSecurityNo,DateOfBirth,CaseNumber,Chapter_filing,Joint
FROM   profile p, debtor d, cases c
WHERE  d.`ProfileID` = p.`ProfileID` AND
       c.`Debtor1` = 2;

Create User:
INSERT INTO user (UserName,RoleID,Password,FullName,Email,
                  Question1,Answer1,Question2,Answer2,Question3,Answer3,LastUpdate) 
VALUES ('terryruss',3,'rhouse11','Tery Russ','terryruss@gmai.com',
        'What was the of your first car?','Mustang',
        'What was the name of your first pet?','Max',
        'What is the first name of the best friend?','Mike',now())


INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(1,GA,3386,6772,40631)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(1,'GA',3386,6772,40631)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(2,'GA',4384,8768,52610)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(3,'GA', 4652,9305,55829)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(4,'GA', 5674, 11348, 68085)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(5,'GA', 6349, 12698, 76185)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(6,'GA', 7024, 14048, 84285)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(7,'GA', 7699, 15398, 92385)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(8,'GA', 8374, 16748, 100485)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(9,'GA', 9049, 18098, 108585)

INSERT INTO statemedian (StateMedianID,StateName,Monthly,SixMonthTotal,AnnnualTotal)
    Values(10,'GA', 9724, 19448, 116685)

 
Create Case:
INSERT INTO profile (FirstName,MiddleName,LastName,Suffix,Street1, Street2,City,
                    State,ZipCode,Workphone,MobilePhone,HomePhone,Age, Gender,
                    SocialSecurityNo,DateOfBirth,LastUpdate) 
Values('Tyrone','P','Russ','Sr','2304 Kenneth Ave','null','Gulfport','Mississippi','39501',
'4048088448','4048088448','4048088448',59,'Male','222-34-4555','1958-1-2',now());


INSERT INTO debtor (ProfileID,NumNoLocations,ReceivedCounselingCert,CertAskCounseling,
                    ReceivedBriefing,NotRequiredReceiveBriefing,InCapacity,Disability,LastUpdate) 
Values((select MAX(ProfileID) from profile),1,'','','','','','',now());
 
INSERT INTO cases(AssignTo,Debtor1,Chapter_filing,Joint,Active,Status,CreatedByID,CreatedDate,ModifiedDate) 
Values(4,(select MAX(DebtorID) from debtor),7,'No','Yes','New',4,now(),now()) 

User:
INSERT INTO user (UserName,RoleID,Password,FullName,Email,Question1,
Answer1,Question2,Answer2,Question3,Answer3,LastUpdate)
VALUES ('tyroneruss',4,'rhouse11','Tyrone Russ','tyroneruss@outlook.com',
        'Security question 1?','Answer1','Security question 2?','Answer2',
        'Security question 3?','Answer3',now());

INSERT INTO user (UserName,RoleID,Password,FullName,Email,Question1,
Answer1,Question2,Answer2,Question3,Answer3,LastUpdate)
VALUES ('michealchukes',5,'rhouse11','Michael Chukes','michealchukes@outlook.com',
        'Security question 1?','Answer1','Security question 2?','Answer2',
        'Security question 3?','Answer3',now());

INSERT INTO user (UserName,RoleID,Password,FullName,Email,Question1,
Answer1,Question2,Answer2,Question3,Answer3,LastUpdate)
VALUES ('michaelruss',1,'rhouse11','Michael Russ','michaelruss@outlook.com',
        'Security question 1?','Answer1','Security question 2?','Answer2',
        'Security question 3?','Answer3',now());



CASES:
INSERT INTO cases
(Case_number,Chapter_filing,Joint,Active,Assigned_to,
CreatedBy,CreatedDate,ModifiedDate)
Values("",7,"","Yes",1001,1001,now(),now());

INSERT INTO profile (FirstName,MiddleName,LastName,Suffix,Street1,Street2,City,State,
                     ZipCode,WorkPhone,MobilePhone,HomePhone,Age,Gender,
                     SocialSecurityNo,DateOfBirth,LastUpdate)
VALUES ('Pamela','M','Russ','','1001 Parish Rd','','Jackson','Georgia','30083','(209) 554-8877','',
        '(209) 277-7654',48,'female','776-22-2727','1956-09-19',now());

INSERT INTO debtor (ProfileID,CaseID,NumNoLocations,ReceivedCounselingCert,ReceivedBriefing,
					NotRequiredReceiveBriefing,InCapacity,Disability,LastUpdate)
VALUES ((select MAX(ProfileID) from profile),(select MAX(CaseID) from cases),1,'On','On','On','','',now());




SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,
FirstName,LastName,Street1,City,State,ZipCode,Email,Assigned_to
FROM cases c, debtor d, profile p
WHERE c.`CaseID` = d.`CaseID` AND d.`ProfileID` = p.`ProfileID`
ORDER BY c.CaseID;  

INSERT INTO tempTableName(cellId,attributeId,entityRowId,value) 
SELECT DISTINCT cellId,attributeId,entityRowId, value FROM tableName;

# Setup role table
INSERT INTO role (Type,Title,AccessLevel)
Values ('Intake','Intake staff member', 1000);

INSERT INTO role (Type,Title,AccessLevel)
Values ('Admin','Administrator and technical support',2000);

INSERT INTO role (Type,Title,AccessLevel)
Values ('ParaLegal','Para legal employee',3000);

INSERT INTO role (Type,Title,AccessLevel)
Values ('Manager','Manager - access to all records',4000);

INSERT INTO role (Type,Title,AccessLevel)
Values ('Attorney','Attorney at Law',5000);


select *
from caseuser cu, debtor d, profile p, pbsdb.case c
where cu.UserID = 1005 AND d.`CaseID` = cu.`CaseID`
      AND d.`ProfileID` = p.`ProfileID`; 

select *
from caseuser cu, debtor d, profile p
where d.`CaseID` = cu.`CaseID` and cu.CaseID = 1
      AND d.`ProfileID` = p.`ProfileID`; 

User create account:
INSERT INTO user (UserName,Password,FullName,EmailAddress,Question1,
Answer1,Question2,Answer2,Question3,Answer3,LastUpdate)
VALUES ('moliver','password1','Melzetta Oliver','moliver@russlawgroup.com',
        'Security question 1?','Answer1','Security question 2?','Answer2',
        'Security question 3?','Answer3',now());

INSERT INTO profile (FirstName,MiddleName,LastName,Suffix,Street1,Street2,City,State,
                     ZipCode,WorkPhone,MobilePhone,HomePhone,Age,Gender,
                     SocialSecurityNo,DateOfBirth,LastUpdate)
VALUES ('Pamela','M','Russ','','1001 Parish Rd','','Jackson','Mississippi','35903','(209) 554-8877','',
        '(209) 277-7654',48,'female','776-22-2727','1956-09-19',now());


String 	Query = "INSERT INTO profile (FirstName,LastName,Suffix,Street1,Street1,City,State,
		Query = Query + " ZipCode,WorkPhone,MobilePhone,HomePhone,Age,SocialSecurityNo,DateOfBirth,LastUpdate)";
		Query = Query + " VALUES ('" + FN + "','" + MN + "','" + LN + "','" + SX + "','" + ST1 + "','" + ST2 + "','"; 
		Query = Query + " + CT + "','" + ST + "','" + ZP +  "','" + AG +  "','" + SN +  "','" + DB + "',now())";

Query = INSERT INTO profile (AddressID,FirstName,MiddleName,LastName,
Query = Query + " Suffix,WorkPhone,MobilePhone,HomePhone,Age,SocialSecurityNo,DateOfBirth,LastUpdate)
Query = Query + " VALUES ((select MAX(Address) from address),'" + FN + "','" + MN + "','" + LN + "','" + SF + "','" + 

Type = 'Staff','Client Manager','Administrator','Attorney'
Title =
					 
INSERT INTO role (RoleID,Type,Title,CreateDate)
VALUES (1000,'Staff','Client Manager','Administrator','Attorney',now());
		
		
INSERT INTO address (Street1,Street2,City,State,ZipCode,LastUpdate)
VALUES ('2992 Charles St','','Richmomd','CA','92922',now());
					 
INSERT INTO profile (FirstName,MiddleName,LastName,Suffix,,Street1,Street1,City,State,
                     ZipCode,WorkPhone,MobilePhone,HomePhone,Age,
                     SocialSecurityNo,DateOfBirth,LastUpdate)
VALUES ('Tyrone','Paul','Russ','III','(404) 441-1124','(404) 422-1124','(404) 441-1223',80,'561-22-2727',02/02/1937,now());


INSERT INTO debtor (ProfileID,CaseID,Debtor,NumNoLocations,ReceivedCounselingCert,ReceivedBriefing,
					NotRequiredReceiveBriefing,InCapacity,Disability,LastUpdate)
VALUES (1001,0,1,1,'On','On','On','','',now());


select d.DebtorID, p.FirstName, p.LastName, p.WorkPhone
from debtor d, profile p
where d.ProfileID = p.ProfileID;

            String Query = "UPDATE debtor d, profile p, address a ";
            Query = Query + " SET p.FirstName='" + FN + "',";
            Query = Query + " p.MiddleName='" + MN + "',";
            Query = Query + " p.LastName='" + FN + "',";  
            Query = Query + " p.Suffix='" + SF + "',";
            Query = Query + " p.WorkPhone='" + WP + "',";   
            Query = Query + " p.MobilePhone='" + MP + "',";
            Query = Query + " p.HomePhone='" + HP + "',";  
            Query = Query + " p.Age=" + AGE + ","; 
            Query = Query + " p.SocialSecurityNo='" + SSN + "',";  
            Query = Query + " p.DateOfBirth=" + DOB + "',";   
            Query = Query + " a.Street1='," + STR1 + "',";   
            Query = Query + " a.Street2='," + STR2 + "',";   
            Query = Query + " a.City='" + CTY + "',";  
            Query = Query + " a.State='," + ST + "',";   
            Query = Query + " a.ZipCode='," + ZP + "'";   
            Query = Query + " WHERE d.ProfileID=p.ProfileID ";
            Query = Query + " AND p.AddressID = a.AddressID AND d.DebtorID =" + ID;          

DATE_FORMAT(column_name, '%d/%m/%Y')

            String  Query = "select d.DebtorID, p.FirstName, p.LastName, p.Suffix, p.WorkPhone,p.MobilePhone,";
                    Query = Query + "p.HomePhone, p.Age, a.Street1, a.Street2, a.City, a.State, a.ZipCode";
                    Query = Query + " from debtor d, profile p, address a ";
                    Query = Query + "where d.ProfileID = p.ProfileID AND p.AddressID = a.AddressID";
					
