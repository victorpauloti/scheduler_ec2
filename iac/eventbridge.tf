## regra para ligar ec2
resource "aws_cloudwatch_event_rule" "ec2_instance" {
  name        = "schedule-on"
  description = "start instance EC2 with lambda lambda-schedule-turn-off-ec2-hom"
  # cron(minutes hours day-of-month month day-of-week year)
  schedule_expression = "cron(00 10 ? * MON-FRI *)"
}
## regra oara desligar ec2
resource "aws_cloudwatch_event_rule" "off_ec2_instance" {
  name        = "schedule-off"
  description = "start instance EC2 with lambda lambda-schedule-turn-off-ec2-hom"

  # cron(minutes hours day-of-month month day-of-week year)
  schedule_expression = "cron(00 21 ? * MON-FRI *)"

}
# triger ONN
resource "aws_cloudwatch_event_target" "event_lambda" {
  rule      = aws_cloudwatch_event_rule.ec2_instance.name
  target_id = "run-scheduled-ON-every-day"
  arn       = aws_lambda_function.on_off_lambda.arn
  #role_arn  = ""
}
# triger OFF
resource "aws_cloudwatch_event_target" "off_ec2_instance" {
  rule      = aws_cloudwatch_event_rule.off_ec2_instance.name
  target_id = "run-scheduled-OFF-every-day"
  arn       = aws_lambda_function.on_off_lambda.arn
  #role_arn  = ""
}

# resource "aws_sns_topic_policy" "default" {
#   arn    = aws_sns_topic.aws_logins.arn
#   policy = data.aws_iam_policy_document.sns_topic_policy.json
# }

# data "aws_iam_policy_document" "action_lambda_policy" {
#   statement {
#     effect  = "Allow"
#     actions = ["SNS:Publish"]

#     principals {
#       type        = "Service"
#       identifiers = ["events.amazonaws.com"]
#     }

#     resources = [aws_sns_topic.aws_logins.arn]
#   }
# }