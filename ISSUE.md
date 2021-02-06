### Title
Pagination support for companies (and customers) list pages.

### Description
As of now, all the companies are fetched at once and displayed on a single page. The customers listing page works the same way. However, this is not scalable going forward with the increase in number of companies (and customers) on our system. This would result in slow page loads and would eventually cause page load failures.
Thus, we would need to support pagination in both companies and customers listing pages.

### Acceptance Criteria
+ Companies listing page should support pagination.
+ Customers listing page should support pagination.
+ Each page would be limited to 25 records.
+ "Show more" button should be displayed at the bottom if there are more records to be loaded.
+ "No more records to load." should be displayed at the end after the last page is loaded.
+ The companies by default would be sorted by alphabetical order of their names.
+ The customers by default would be sorted by alphabetical order of their names.
+ If there are no records to load, it should gracefully handled by displaying a message "No records found.".
+ Total number of records should also be displayed on initial page load.
  
    For Companies listing page, it should be <total_companies> companies.

        Example: 562 companies. 

    For Customers listing page, it should be <total_companies> companies.

        Example: 130 customers.