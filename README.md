# 📊 Olist Sales Performance Analysis (Power BI & SQL)

## 🧾 Brief Summary
An end-to-end sales performance analysis of an e-commerce business using Power BI and SQL to evaluate revenue growth, customer behavior, and delivery performance.

---

## 🔍 Overview
This project analyzes the Brazilian Olist e-commerce dataset to evaluate overall business performance.  

The analysis focuses on:
- Sales growth
- Customer retention
- Delivery efficiency  

The final output is an interactive Power BI dashboard designed for decision-makers, providing both high-level KPIs and detailed analytical insights.

---

## ❓ Problem Statements

This project answers the following business questions:

- Is the business growing over time in terms of revenue and orders?
- Is revenue growth driven by higher order volume or higher order value?
- Which product categories contribute the most to total revenue?
- How many customers are repeat customers, and how engaged are they?
- How reliable is the delivery process?
- Is on-time delivery performance improving or declining over time?

---

## 🗂 Dataset

**Source:** Brazilian E-Commerce Public Dataset by Olist  

### Tables Used:
- `olist_orders_dataset`
- `olist_order_items_dataset`
- `olist_products_dataset`
- `olist_customers_dataset`

The dataset contains information about:
- Orders
- Products
- Customers
- Pricing
- Delivery timelines

---

## 🛠 Tools & Technologies

### Power BI
- Data Modeling
- DAX Measures
- Interactive Dashboards

### SQL (MySQL)
- Data Exploration
- Aggregations & Joins
- KPI Validation

### CSV Files
Used as the final data source for Power BI.

---

##  Methods

The project followed these steps:

1. Data understanding and schema exploration  
2. Data modeling using star-schema concepts  
3. KPI creation using DAX:
   - Revenue
   - Orders
   - Average Order Value (AOV)
   - Delivery Rates
   - Customer Metrics  
4. Time-based trend analysis  
5. Customer segmentation (New vs Repeat customers)  
6. Delivery performance analysis  
7. Dashboard design and storytelling  

---

## 💡 Key Insights

- Revenue and order volume increased steadily over time.
- Average Order Value (AOV) declined, indicating growth driven mainly by higher order volume.
- Repeat customers represent a small percentage of total customers but place more orders per customer.
- Delivery success rate is high, showing strong operational reliability.
- On-time delivery performance declined over time, suggesting operational strain as the business scaled.
- A few product categories contribute a large share of total revenue.

---

## 📊 Dashboard Explanation

The Power BI dashboard consists of four pages:

### 1️⃣ Executive Overview
High-level snapshot of business health:
- Total Orders
- Total Revenue
- Average Order Value
- Delivered Orders
- Delivery Success Rate

### 2️⃣ Sales & Growth Performance
- Monthly Revenue Trend
- Monthly Order Trend
- Average Order Value Trend
- Revenue by Product Category

### 3️⃣ Customer Analysis
- Total Customers
- Repeat Customer Rate
- New vs Repeat Distribution
- Orders by Customer Type

### 4️⃣ Delivery & Operations
- Delivered Orders
- Delivery Success Rate
- On-Time Delivery Rate
- Delivery Status Distribution
- Delivery Performance Trend

---

## ▶️ How to Run This Project

1. Clone or download this repository.
2. Open `Olist_Sales_Performance.pbix` using Power BI Desktop.
3. Ensure CSV files are available inside the `Data` folder.
4. If prompted, update file paths to reconnect the data.
5. Explore the dashboard using filters and visuals.

---

## ✅ Results & Conclusion

The business shows strong revenue and order growth.  
However, customer retention remains low.

Repeat customers are more valuable due to higher engagement levels.

Delivery operations are reliable overall, but declining on-time performance highlights a potential scalability issue.

This dashboard enables stakeholders to make data-driven decisions related to:
- Marketing strategy
- Customer retention
- Logistics optimization

---

## 🚀 Future Work

- Perform cohort analysis for retention insights.
- Analyze delivery delays by region and seller.
- Include profit margin analysis using cost data.
- Automate data refresh via live database connection.
- Add revenue and demand forecasting models.

---

## 👩‍💻 Author

**Sakshi Sidharam Whandre**  
Master’s in Computer Applications (MCA)  
Aspiring Data Analyst  

🔗 LinkedIn:  
https://www.linkedin.com/in/sakshi-whandre-8a685a227
