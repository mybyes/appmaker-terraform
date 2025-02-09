resource "aws_s3_bucket_policy" "appmaker_fe_policy" {
  bucket = aws_s3_bucket.appmaker_fe.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.appmaker_fe.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

