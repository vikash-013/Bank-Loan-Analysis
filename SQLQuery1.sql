USE [bank loan DB];
SELECT*FROM bank_loan_data

--Total_Loan_Application 

SELECT COUNT(id) AS Total_Loan_Application FROM bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--Total_Funded_Amount

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--Total_Amount_received

SELECT SUM(total_payment) AS Total_Amount_received FROM bank_loan_data

 SELECT SUM(total_payment) AS MTD_Total_Amount_received FROM bank_loan_data
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_received FROM bank_loan_data
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

 --Avg_Interest_Rate

 SELECT ROUND(AVG(int_rate),4) *100 AS Avg_Interest_Rate FROM bank_loan_data

 SELECT ROUND(AVG(int_rate),4) *100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

 SELECT ROUND(AVG(int_rate),4) *100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

 -- Avg_DTI

 SELECT ROUND(AVG(dti),4)*100 AS Avg_DTI FROM bank_loan_data

 SELECT ROUND(AVG(dti),4)*100 AS MTD_Avg_DTI FROM bank_loan_data
 WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

  SELECT ROUND(AVG(dti),4)*100 AS PMTD_Avg_DTI FROM bank_loan_data
 WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

 --GOOD LOAN AND BAD LOAN 
 SELECT
        (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
		/
		COUNT(id) AS Good_loan_percentage
		FROM bank_loan_data 

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status= 'Fully Paid' OR loan_status= 'current'

SELECT SUM(loan_amount) AS Good_Loan_funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'current'
 
 SELECT SUM(total_payment) AS Good_Loan_received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'current'
 
 --bad loan 

 SELECT COUNT(id) AS Bad_loan_Applications FROM bank_loan_data
 WHERE loan_status = 'charged off'
 
 SELECT SUM(total_payment) AS Bad_loan_amount_received FROM bank_loan_data
 WHERE loan_status = 'charged off'

 --loan status 
SELECT 
    loan_status,
	COUNT(id) AS Total_loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate *100) AS Interst_Rate ,
	AVG(dti*100) AS DTI

FROM
    bank_loan_data
GROUP BY 
    loan_status

SELECT 
    loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount

FROM
    bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY 
    loan_status

--Dashboard 2
SELECT 
      DATENAME(MONTH,issue_date) AS Month_Name,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY DATENAME(MONTH,issue_date)
ORDER BY DATENAME(MONTH,issue_date)


SELECT 
      MONTH(issue_date) AS Month_Number,
      DATENAME(MONTH,issue_date) AS Month_Name,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY   MONTH(issue_date) ,DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date)



SELECT 
      address_state,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY   address_state
ORDER BY address_state


SELECT 
      address_state,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY   address_state
ORDER BY COUNT (id) DESC

SELECT 
      term,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY term
ORDER BY term

SELECT 
      emp_length,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY  emp_length
ORDER BY  emp_length



SELECT 
      emp_length,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY  emp_length
ORDER BY  COUNT(ID) DESC


SELECT 
      purpose,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY  purpose
ORDER BY  COUNT(ID) DESC


SELECT 
      home_ownership,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
      
GROUP BY  home_ownership
ORDER BY  COUNT(ID) DESC

SELECT 
      home_ownership,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM
  bank_loan_data
 WHERE grade = 'A'  AND address_state = 'CA'   
GROUP BY  home_ownership
ORDER BY  COUNT(ID) DESC

