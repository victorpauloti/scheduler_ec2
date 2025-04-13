resource "aws_iam_role" "iam_lambda" {
  name = "iam_${var.lambda_name}_${var.env}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
  tags = merge({ "Name" = "iam_${var.lambda_name}_${var.env}" })
}

## policies attacchemt
resource "aws_iam_role_policy" "iam_policy_log_groups" {
  name = "${var.lambda_name}_${var.env}"
  role = aws_iam_role.iam_lambda.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogGroup"
        ],
        "Resource" : "arn:aws:logs:*:*:*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },

	{
			"Sid": "OnOffec2",
			"Effect": "Allow",
			"Action": [
				"ec2:StartInstances",
				"ec2:StopInstances"
			],
			"Resource": [
				"arn:aws:ec2:*:137232752941:instance/i-02a95c382409e19ae",
			]
		}
	]

  })


}