-- Count and avg by gender
 WITH data1 AS (
    SELECT
        `Gender`, 
        COUNT(`Patient ID`) AS patient_count,
        ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
    FROM health_ocd.ocd_patient_dataset
    GROUP BY `Gender`
)
    SELECT
        Gender, 
        COUNT('Patient ID') AS patient_count,
        ROUND(AVG('Y-BOCS Score (Obsessions)'), 2) AS avg_obs_score
    FROM health_ocd.ocd_patient_dataset
    GROUP BY Gender



-- Sum and count by gender
SELECT 
    SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) AS count_female,
    SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END) AS count_male,
    ROUND((SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) / 
           (SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) + 
            SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END)) * 100), 2) AS pct_female,
    ROUND((SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END) / 
           (SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) + 
            SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END)) * 100), 2) AS pct_male
FROM (
    SELECT
        `Gender`, 
        COUNT(`Patient ID`) AS patient_count,
        ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
    FROM health_ocd.ocd_patient_dataset
    GROUP BY `Gender`
) AS subquery;



-- count and avg obsession score by ethinicity

SELECT
        Ethnicity, 
        COUNT(`Patient ID`) AS patient_count,
        ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
    FROM health_ocd.ocd_patient_dataset
    GROUP BY Ethnicity
    ORDER BY patient_count;
    
    -- no. of people diagnosed with ocd monthly
    -- alter table health_ocd.ocd_patient_dataset
    -- modify `OCD Diagnosis Date` date;
    
    SELECT
    DATE_FORMAT(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') AS month,
    COUNT(`Patient ID`) AS patient_count
FROM health_ocd.ocd_patient_dataset
GROUP BY month
ORDER BY month;

  -- most common obsession type
  
  SELECT
  `Obsession Type`,
  count(`Patient ID`) AS patient_count,
  round(avg(`Y-BOCS Score (Obsessions)`),2) AS obs_score
  FROM health_ocd.ocd_patient_dataset
  GROUP BY 1
  ORDER BY 2;

-- most common compulsion type and avg obsession score
  SELECT
  `Compulsion Type`,
  count(`Patient ID`) AS patient_count,
  round(avg(`Y-BOCS Score (Obsessions)`),2) AS obs_score
  FROM health_ocd.ocd_patient_dataset
  GROUP BY 1
  ORDER BY 2;
    
