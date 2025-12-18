environment                = "prod"
airflow_environment_name   = "Deloitte-airflow"
dag_s3_path                = "DAG/"
source_bucket_arn          = "arn:aws:s3:::airflowtest-datalake"
execution_role_arn         = "arn:aws:iam::337693406343:role/service-role/AmazonMWAA-airflowtest1-1UlG7I"
security_group_ids         = ["sg-0031fa76172eee124"]
subnet_ids                 = ["subnet-01713a7af70f16cb1", "subnet-09e1e70bca7be1488"]
environment_class          = "mw1.medium"
max_workers                = 10
min_workers                = 1

tags = {
  CSCLASS          = "Confidential"
  CSQUAL           = "Financial Information"
  COUNTRY          = "IN"
  GROUPCONTACT     = "intaxitplatform@deloitte.com"
  SECONDARYCONTACT = "anahitavarma@deloitte.com"
  FUNCTION         = "Tax"
  PRIMARYCONTACT   = "vveer@deloitte.com"
  CMS              = "IN-ITS"
  ENVIRONMENT      = "Production"
  BILLINGCODE      = "FPTN0002"
  BILLINGCONTACT   = "msirsat@deloitte.com"
  CSTYPE           = "Internal"
}
