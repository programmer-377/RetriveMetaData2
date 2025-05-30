public with sharing class AmazonS3Uitlity {
    public void getListOfBuckets(){
        String accessKey = 'AKIAYS2NUYP5LDAF3ODR';
        String secretKey = '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';
        String region = 'ap-south-1';
        String host = 's3.ap-south-1.amazonaws.com';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();

        String awsAuthorization = awsAuthorization(accessKey, secretKey, region, host);
        request.setEndpoint('https://' + host + '/');
        request.setMethod('GET');
        request.setHeader('Authorization', awsAuthorization);
        request.setHeader('Host', host);
        // request.setHeader('Content-Type', XXXXXX);
        // request.setHeader('X-Amz-Content-Sha256', XXXXXX);
        // request.setHeader('X-Amz-Date', XXXXXX);
        // request.setHeader('Authorization', XXXXXX);

        response = http.send(request);
    }

    public String awsAuthorization(String accessKey, String secretKey, String region, String host){
        return '';
    }
}