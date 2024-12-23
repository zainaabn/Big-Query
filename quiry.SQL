-- This query shows a list of the daily top Google Search terms.
SELECT
   refresh_date AS Day,
   term AS Top_Term,
   rank,
   dma_name AS Region
   
   
       -- These search terms are in the top 25 in the US each day.
   
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
   rank <= 3
       -- Choose only the top term each day.
   AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 WEEK)
       -- Filter to the last 4 weeks.
      AND dma_name = 'UK'  
       


GROUP BY Day, Top_Term,Region, rank
ORDER BY Day DESC
   -- Show the days in reverse chronological order.



