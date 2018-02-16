BEGIN
	IF			OBJECT_ID('u_users', 'U') IS NOT NULL
	DROP TABLE	u_users

	CREATE TABLE	u_users(
					[user_id] INT NOT NULL,
					first_name VARCHAR (40),
					middle_name VARCHAR (30),
					last_name VARCHAR (30),
					[date] DATETIME NOT NULL,
					CONSTRAINT pk_userid PRIMARY KEY ([user_id])
	);
END


BEGIN
	IF			OBJECT_ID('u_spend_type', 'U') IS NOT NULL 
	DROP TABLE	u_spend_type; 

	CREATE TABLE	u_spend_type(
					spend_type_id INT NOT NULL,
					spend_type_description VARCHAR(20) NOT NULL,
					CONSTRAINT spend_type_id PRIMARY KEY (spend_type_id)
	);
END

BEGIN

DELETE FROM u_spend_type

INSERT INTO		u_spend_type (spend_type_id, spend_type_description)
VALUES			(1, 'shelter'),
				(2, 'food'),
				(3, 'trasportation'),
				(4, 'others'),
				(5, 'savings'),
				(6, 'insurance')
END