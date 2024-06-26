# Biến đổi dữ liệu trong kho dữ liệu (Data Warehouse) sử dụng dbt (Data Build Tool) và SQL trên Google BigQuery

## Yêu cầu chi tiết

### Cài đặt
Tham khảo hướng dẫn cài đặt dbt để thiết lập môi trường làm việc của bạn.

### Nhiệm vụ
Sử dụng SQL và dbt để xây dựng mô hình Sales trên Bigquery datamart. Nghiên cứu tập dữ liệu AdventureWorks2019 và xây dựng độc lập một mô hình dữ liệu cho Module Purchase, tương tự như mô hình Sales. Vẽ sơ đồ của bạn và xây dựng mô hình trên Bigquery.

### Nguồn dữ liệu
Sử dụng SQL, Bigquery, và DBT để biến đổi dữ liệu từ nguồn: adventureworks2019.

Cơ sở dữ liệu AdventureWorks2019 được thiết kế dựa trên dữ liệu của một công ty hư cấu có tên là Adventure Works Cycles. Adventure Works Cycles là một công ty sản xuất đa quốc gia có qui mô lớn, chuyên sản xuất và kinh doanh xe đạp làm từ kim loại và các chất liệu tổng hợp. Thị trường của công ty này bao gồm cả khu vực Bắc Mỹ, Châu Âu và Châu Á.

Cơ sở dữ liệu AdventureWorks2019 bao gồm nhiều bảng dữ liệu khác nhau, mô phỏng các hoạt động kinh doanh thực tế như quản lý sản phẩm, bán hàng, giao hàng, và quản lý nhân sự

### Biến đổi dữ liệu
Thực hiện biến đổi, xử lý giá trị Null, xử lý kiểu dữ liệu,… cho từng bảng.


## Các tool được dùng trong dự án

- **dbt (Data Build Tool)**: Đây là công cụ mã nguồn mở giúp chúng ta biến đổi dữ liệu trong kho dữ liệu của mình.
- **SQL**: SQL sẽ được sử dụng để quản lý dữ liệu. Bạn sẽ cần viết các truy vấn SQL để biến đổi dữ liệu, xử lý giá trị Null, xử lý kiểu dữ liệu, v.v.
- **Google BigQuery**: Đây là kho dữ liệu không máy chủ, được quản lý hoàn toàn, giúp thực hiện các truy vấn SQL nhanh chóng. Bạn sẽ cần tạo mô hình dữ liệu của mình trên BigQuery.

## Cách sử dụng dự án này

### Bước 1: Clone project
git clone https://github.com/Khatran05082003/purchase_transform_dbt.git

### Bước 2: Create project on Google Bigquery
- Go to https://console.cloud.google.com/, create a project (if you do not have)
- Create a **Service Account** in your project, grant `BigQuery Admin` role for this Service Account
- Add key as Json and download key file

### Bước 3: VS Code
- Open your project folder
- Install dbt Power User extension
- Config your profile.yml file similar to this

dec_project2: outputs: dev: dataset: --Name-of-your-dataset job_execution_timeout_seconds: 300 job_retries: 1 keyfile: Path-to-your-service-account-file location: US method: service-account priority: interactive project: --Your-project-id threads: 4 type: bigquery target: dev

### Bước 4:  Open folder and run dbt.run, data will be transformed and load to Google Bigquery

### DEMO
![image](https://github.com/Khatran05082003/purchase_transform_dbt/assets/102920168/530a5669-19d7-4c05-87a3-ec8d4dba6f8a)

![image](https://github.com/Khatran05082003/purchase_transform_dbt/assets/102920168/5d004bce-7404-4268-95bc-b82eab3edbc4)

![model](https://github.com/Khatran05082003/purchase_transform_dbt/assets/102920168/6237c407-b804-46ac-ad78-2866c858ad60)








