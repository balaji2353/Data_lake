resource "aws_iam_role" "s3_target_role" {
  count = var.existing_role_arn == null ? 1 : 0

  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "dms.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "s3_target_policy" {
  count = var.existing_role_arn == null ? 1 : 0

  name = "${var.iam_role_name}-policy"
  role = aws_iam_role.s3_target_role[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}

resource "aws_dms_s3_endpoint" "target" {
  endpoint_id             = var.endpoint_id
  endpoint_type           = "target"
  bucket_name             = var.bucket_name

  service_access_role_arn = var.existing_role_arn != null ? var.existing_role_arn : aws_iam_role.s3_target_role[0].arn

  tags = var.tags
}
