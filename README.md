# Employee_Analysis

## Overview
Help a company better understand their employee structure by conducting 3 data analyses.
- Determine employees who are eligible for retirement.
  
- Select employees who are qualified for the mentorship program.
  
- Identify employees who are more likely to leave, and then the company could design new methods to retain those employees.

## 1.Employees for Retirement

### Approach
Eligible employees for retirement with the most recent titles.

![截屏2021-10-01 下午3 39 54](https://user-images.githubusercontent.com/88747464/135682449-50779d8a-5e88-4fbc-ab11-40ab53d52e37.png)

Total number of employees in the company.

![截屏2021-10-01 下午3 29 36](https://user-images.githubusercontent.com/88747464/135681898-5b895cd1-1c21-477b-b2e0-d726b63043e2.png)

### Findings
Total number of retiring employees.

![截屏2021-10-01 下午3 28 18](https://user-images.githubusercontent.com/88747464/135681886-6fb77dac-3119-4725-ae7b-aaaf87fe20fb.png)

- The company still has about 70% of its employees left.

## 2.Employees for Mentorship Program

### Findings
Total number of eligible employees for mentorship.
  
![截屏2021-10-01 下午3 44 33](https://user-images.githubusercontent.com/88747464/135682859-34763712-9d8d-4f13-9702-5f09c79f3ce9.png)

- Only 1549 employees were born in 1965, which is too few for mentoring around 90,000 new employees in the future.

Thus, employees with the following requirements could be eligible for mentoring:

![截屏2021-10-01 下午4 29 38](https://user-images.githubusercontent.com/88747464/135682632-d32b3bef-0f39-4337-b8df-6c65ee91293d.png)

- Was born in 1956, since the oldest to retire was born in 1955;
- Started to work in the company between 1980 to 2000, which should have enough experience for mentoring;
- Still work in the company.

## 3.Employees who tend to leave

### Exploratory data analysis

- Perform exploratory data analysis through various visualizations to understand the features that mostly cause employees to leave.

`EmployeeCount`, `Standardhours`, and `Over18` are not effective, since they do not change from one employee to another.

![1](https://user-images.githubusercontent.com/88747464/188317729-a67dd724-e7a4-4dc0-8ef6-a2018b95e6ff.png)

There are about 237 or 16% of the employees left the company.

![2](https://user-images.githubusercontent.com/88747464/188317742-77feeaa0-deb5-44a0-8b47-5d88bcd25882.png)

Stayed employees have a higher average on:
`Age`, `DailyRate`, `EnvironmentSatisfaction`, `JobLevel`, `JobSatisfaction`, `MonthlyIncome`, `StockOptionLevel`, `TotalWorkingYears`, `YearsAtCompany`, `YearsInCurrentRole`, and `YearsWithCurrManager`.

Stayed employees have a lower average on:
`DistanceFromHome`,	`NumCompaniesWorked`,	and `OverTime`.

![Screen Shot 2022-09-04 at 9 43 28 AM](https://user-images.githubusercontent.com/88747464/188317751-9c7673a8-e0fd-4abc-8f71-7e9465f1a838.png)
![Screen Shot 2022-09-04 at 9 43 41 AM](https://user-images.githubusercontent.com/88747464/188317754-812e04a6-a6c4-4914-b5c8-fe585fd8ab41.png)
![Screen Shot 2022-09-04 at 9 43 55 AM](https://user-images.githubusercontent.com/88747464/188317758-33957616-50e3-4d80-aa0b-4e0882f67bd4.png)

Strongly Correlated:
- `JobLevel`, `TotalWorkingYears`, and `MonthlyIncome`
- `YearsAtcompany`, `YearsWithCurrManager`, and `YearsInCurrentRole`
- `Age` and `TotalWorkingYears`.

![3](https://user-images.githubusercontent.com/88747464/188317762-1eb4204c-30db-44c3-a17a-9a82ff19c6fb.png)

Employees who tend to leave are:
- Sales Representatives
- Single
- Less experienced (lower job level)

![5](https://user-images.githubusercontent.com/88747464/188317776-9ddc93c5-04f9-4b9a-88ea-402bb68843a8.png)

![7](https://user-images.githubusercontent.com/88747464/188317783-a302bdee-0fac-495c-8577-cdd14f797b68.png)

Younger employees tend to leave, most are around 29 - 31 years old.

![4](https://user-images.githubusercontent.com/88747464/188317768-0aff6711-aa2f-4b32-8ccc-eb26bb216e45.png)

The longer distance from home, the fewer employees work in the company.

![6](https://user-images.githubusercontent.com/88747464/188317780-06473642-f5a9-41da-954e-f9b6cb80ef88.png)

On average, female employees have a higher monthly income than males.

![8](https://user-images.githubusercontent.com/88747464/188317792-cc8beb9a-5222-4508-99c8-21011658f239.png)

From the above visualization, Sales Representatives tend to leave compared to the other jobs. 

They also have the lowest monthly income compared to the other jobs, this might be one of the reasons.

![9](https://user-images.githubusercontent.com/88747464/188317806-d1aa44e3-d532-4908-a5de-e5e71cd12592.png)

### Deep Learning Model

- Conduct a deep learning model to classify employees most likely to leave.

**Model Summary**

![Screen Shot 2023-04-09 at 9 54 56 PM](https://user-images.githubusercontent.com/88747464/230810170-92138355-8408-4adc-9d09-f06068d26573.png)

![Screen Shot 2023-04-09 at 9 55 45 PM](https://user-images.githubusercontent.com/88747464/230810250-3115b270-c2c6-418a-a182-c406201c455c.png)

![Screen Shot 2023-04-09 at 9 56 11 PM](https://user-images.githubusercontent.com/88747464/230810264-0e50a3ca-5200-4c36-9621-fd77eb29b00e.png)

**Confusion Matrix**

![Screen Shot 2023-04-09 at 9 56 53 PM](https://user-images.githubusercontent.com/88747464/230810347-d0a9e695-4221-4fa7-bd6c-a5d65c821718.png)

**Classification Report**

![Screen Shot 2023-04-09 at 9 57 02 PM](https://user-images.githubusercontent.com/88747464/230810357-c7026890-fa06-4fb4-b439-ac9b1555df08.png)

### Summary

Overall, the below factors could be helpful for the company to determine which employees might leave.

`Age`, `DailyRate`, `EnvironmentSatisfaction`, `JobSatisfaction`, `MonthlyIncome`, `StockOptionLevel`, `TotalWorkingYears`, `YearsAtCompany`, `DistanceFromHome`,	`NumCompaniesWorked`,	and `OverTime`.

The deep learning model achieved 86% accuracy. 

The better KPI would be the **F1 score**, which is the overall Measure of a model’s accuracy that combines precision and recall.

### Resources

https://www.udemy.com/course/data-science-for-business-6-real-world-case-studies/

