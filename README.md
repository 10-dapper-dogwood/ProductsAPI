# Products API <sup id="a1">[1](#f1)</sup>
## A Project for Hack Reactor SF133
*by*
[Audree Steinberg](https://github.com/audreee)
,
[Sam Berston](https://github.com/samuelberston)
, and
[Nilai Patel](https://github.com/nilaip96)

---

## Technologies Used
1. Express.js
2. Node
3. PostGres
4. MySQL
5. Docker
6. NGINX
7. Loader.io
8. NewRelic
9. Artillery
10. Amazon EC2
11. Amazon S3 

### Overview of Complete API
![alt text](https://github.com/10-dapper-dogwood/ProductsAPI/blob/main/Screen%20Shot%202021-04-10%20at%2011.24.13%20AM.png?raw=true)


---

## Overview
For our System Design Cap-Stone at Hack Reactor our team was tasked with building a back-end that can handle 3000+ clients per second with response times of 50ms at every endpoint for a eCommerce website. Data was cleaned before inserted into the database and query times were optimized to <1ms per query. The API's were made through Express and deployed on an Amazon EC2 instance. Data migration was implemented using Amazon S3. Testing was done through loader.io and artillery. CPU and Memory usage was monitored on each of the EC2 instances using NewRelic. Docker was used for easy deployment of API. NGINX was used for load-balancing clients. Overall this was a super fun project and we are very proud of what we were able to accomplish.

Our team divided responsibilities as follows:

**Audree Steinberg**\
*Questions and Answers*
Link of Repo can be found in:\
[Here](https://github.com/10-dapper-dogwood/QuestionsAPI)

<br>

**Nilai Patel**\
*Products Overview*
Link of Repo can be found in:\
[Here](https://github.com/10-dapper-dogwood/ProductsAPI)

<br>

**Sam Berston**\
*Ratings and Reviews*
Link of Repo can be found in:\
[Here](https://github.com/10-dapper-dogwood/ReviewsAPI)

<br>
<br>
<br>

---





<b id="f1">1</b> Credits to Audree, Nils, and Sam. [↩](#a1)
