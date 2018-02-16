BEGIN
	IF			OBJECT_ID('u_cutoff_header', 'U') IS NOT NULL 
	DROP TABLE	u_cutoff_header; 

	CREATE TABLE	u_cutoff_header(
					cutoff_id INT NOT NULL,
					[user_id] INT NOT NULL,
					regular_basic_pay DECIMAL,
					phil_health DECIMAL,
					pag_ibig DECIMAL,
					sss DECIMAL,
					withholding_tax DECIMAL,
					deduction DECIMAL,
					[start_date] DATETIME NOT NULL,
					[end_date] DATETIME NOT NULL,
					CONSTRAINT pk_cutoffid PRIMARY KEY (cutoff_id),
					CONSTRAINT fk_cutoffusers FOREIGN KEY ([user_id]) REFERENCES u_users([user_id])
					);
END

BEGIN
	IF			OBJECT_ID('u_cutoff_detail', 'U') IS NOT NULL 
	DROP TABLE	u_cutoff_detail; 

	CREATE TABLE	u_cutoff_detail(
					cutoff_id INT NOT NULL,
					spend_type_id INT NOT NULL,
					amount DECIMAL,
					[date] DATETIME,
					CONSTRAINT fk_cutoffheaderdetail FOREIGN KEY (cutoff_id) REFERENCES u_cutoff_header(cutoff_id),
					CONSTRAINT fk_cutoffspendtype FOREIGN KEY (spend_type_id) REFERENCES u_spend_type(spend_type_id)
	);
END
