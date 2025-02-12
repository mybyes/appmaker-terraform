resource "aws_iam_role" "rds_access_role" {
  name = "rds_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "rds.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "rds_policy" {
  name        = "rds_policy"
  description = "Policy for RDS access"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["rds:DescribeDBInstances", "rds:Connect"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "rds_policy_attachment" {
  name       = "rds_policy_attachment"
  roles      = [aws_iam_role.rds_access_role.name]
  policy_arn = aws_iam_policy.rds_policy.arn
}

output "rds_role_arn" {
  value = aws_iam_role.rds_access_role.arn
}

