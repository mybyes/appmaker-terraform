resource "aws_iam_role" "secrets_access_role" {
  name = "secrets_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "secrets_policy" {
  name        = "secrets_policy"
  description = "Policy to access AWS Secrets Manager"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["secretsmanager:GetSecretValue"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "secrets_policy_attachment" {
  name       = "secrets_policy_attachment"
  roles      = [aws_iam_role.secrets_access_role.name]
  policy_arn = aws_iam_policy.secrets_policy.arn
}

output "secrets_role_arn" {
  value = aws_iam_role.secrets_access_role.arn
}

