# Either provide credentials and engine/database explicitly, or provide
# `secrets_manager_secret_name` which must contain a JSON string with keys
# like: username, password, engine (or engine_name), database (or database_name)
# Example Secret value: { "username":"user", "password":"pwd", "engine":"sqlserver", "database":"GSTPlusAnalytics" }
endpoint_id        = "bolton-gst-analytics"
secrets_manager_secret_name = "Bolton_DMS_user"
server_name        = "in-bolton-uat-db.cqd9d5qa5zwv.ap-south-1.rds.amazonaws.com"
port               = 1433
tags = {
  Environment = "Prod"
}
