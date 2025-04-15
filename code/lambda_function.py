import boto3


client_ec2 = boto3.client('ec2')

def lambda_handler(event, context):

    print('ESTE EVENTO',event)
    instance_id = 'i-02a95c382409e19ae'

    on = 'schedule-on' in event['resources'][0]
    off = 'schedule-off' in event['resources'][0]

    if on:
        client_ec2.start_instances(InstanceIds=[instance_id])
        message = 'Instancia iniciada com sucesso'
    elif off:
        client_ec2.stop_instances(InstanceIds=[instance_id])
        message = 'Instancia desligada com sucesso'
    else:   
        message = 'Nenhuma ação foi tomada'

    print(message)
    
    return {
        'statusCode': 200,
        'body': message
        }