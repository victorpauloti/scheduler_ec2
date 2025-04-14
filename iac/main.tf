resource "aws_lambda_function" "on_off_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_name
  role          = aws_iam_role.iam_lambda.arn
  handler       = var.lambda_handler

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.lambda_runtime

  #layers = [aws_lambda_layer_version.lambda_layer.arn]

  environment {
    variables = var.lambda_environment_variables
  }

  tags = merge({ "Name" = "${var.lambda_name}_${var.env}" }, var.tags)

}

# grants permission to the CloudWatch event rule to invoke the Lambda function
resource "aws_lambda_permission" "lambda-on" {
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ec2_instance.arn
}
resource "aws_lambda_permission" "lambda-off" {
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.off_ec2_instance.arn
}
# resource "aws_lambda_layer_version" "lambda_layer" {
#   filename   = "../../code/layer/lambda_layer.zip"
#   layer_name = var.layer_name
#   #compatible_architectures = "x86_64"
#   source_code_hash = filebase64sha256("../../code/layer/lambda_layer.zip")

#   compatible_runtimes = ["python3.12"]
# }