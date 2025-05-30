public class AwsLambdaInvoker {

    public static void invokeLambda() {
        String accessKey = 'AKIAYWEUU3PISMEECHP7';
        String secretKey = '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';
        String region = 'ap-south-1';
        String service = 'lambda';
        String method = 'POST';
        String host = 'vvqv6eveiguuzktqihfj27uk2y0cgqxt.lambda-url.ap-south-1.on.aws/';
        String canonicalUri = '/?Lam6&Action=InvokeAsync';
        String payload = '{"bucket" : "mathanb1", "key" : "test-3.txt"}';

        String amzDate = AwsSigV4Generator.getAmzDate();
        String dateStamp = AwsSigV4Generator.getDateStamp();

        String authorization = AwsSigV4Generator.generateAuthorizationHeader(
            accessKey, secretKey, region, service,
            method, host, canonicalUri, payload, amzDate, dateStamp
        );

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://' + host + canonicalUri);
        req.setMethod(method);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('x-amz-date', amzDate);
        req.setHeader('Authorization', authorization);
        req.setBody(payload);

        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug('Status: ' + res.getStatus());
        System.debug('Response: ' + res.getBody());
    }
}