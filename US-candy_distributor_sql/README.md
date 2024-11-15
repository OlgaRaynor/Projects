### Candy Distributor Analysys using SQL
Performance and Logistic Analysis. 
This project aimed to evaluate the 2024 Company's performance, provide recommendations for factory-to-customer shipping routes, and identify options for product lines relocations based on data-driven insights.
Primary objectives: 
- 2024 Company's performance evaluation
- which product lines have the best product margin
- determine the most and least efficient shipping routes
- recommend product lines relocation to optimize logistic routes

### Dataset
The dataset contains five CSV files:
1. **Candy_Sales**: sales details from 2021 to 2024, including order date, division, units sold, gross profit, cost, product names, and detailed customer location
2. **Candy Targets**: sales targets 2024 for product divisions
3. **Candy_Products**: division, product name, factory, unit price, and unit cost
4. **Candy_Factories**: factory name, latitude and longitude
5. **Uszips**: latitude and longitude coordinates for customers zip codes
   
Data Source: https://app.mavenanalytics.io/datasets

### Used tools
1. **Analysis**: Cleaned, filtered and formatted the data using [SQL](https://github.com/OlgaRaynor/Projects/blob/main/US-candy_distributor_sql/US_candy_distributor_project.sql), integrating key columns from multiple tables
2. **Routes analysis**: Used Tableau calculated fields to calculate distances between factofies and customers using geographic coordinates
3. **Visualization**: 1. Performance dashboard 2. Mapped factory and customer locations to identify patterns and opportunities for product lines relocation and logistic routes optimization

### Findings
- **Company's performance**: total sales goal achieved by 104%, with 27% Gr vs. PY (except one division)
- **Best product margin**: "Everlasting Gobstopper" - 80% profit margin, produced by Secret Factory and managed by "Sugar" division. Other products have product margin 78-47% , except for "Kazookles", which has a 8% margin
- **Factories**: two of five factories have share of sales less than 1%. Two factories with total share of sales 92% have the the least efficient shipping routes due to their locations
- **The most efficient shipping route**: Secret Factory, with an average shipping distance of 862 mi
- **The least efficient shipping route**: Lot's O' Nuts, with an average shipping distance of 1325 mi

### Recommendations
1. Create action plan for the "Sugar" division (which doesnt achieve sales goals)
2. Develop promotion plan for "Kazookles" product line - to increase the product margin (for example, combined sales with other products)
3. Relocate product lines into two factories with more strategic locations, decreasing the average shipping distance by 17%, this will also result to a balanced sales share across factories
