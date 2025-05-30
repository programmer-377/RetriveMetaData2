public with sharing class AWSS3Authentication {
    public class AWSObjectResponseWrapper{
        public String key;
    }

    public void getListOfBuckets(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();

        request.setEndpoint('callout:AWS_S3_Dev'+ '?list-type=2&max-keys=1000');
        request.setMethod('GET');
        request.setHeader('Host', 'muthu-dev.s3.amazonaws.com');
        response = http.send(request);

        List<String> listOfAWSObjectNames = new List<String>();

        if(response.getStatusCode() == 200){
            Dom.Document doc = new Dom.Document();
            doc.load(response.getBody());

            Dom.XMLNode rootElement = doc.getRootElement();

            for(Dom.XMLNode childElement : rootElement.getChildElements()){
                for(Dom.XMLNode detailElement : childElement.getChildElements()){
                    // system.debug(detailElement.getName() + '-' + detailElement.getText());
                    if(String.isNotBlank(detailElement.getName()) && String.isNotBlank(detailElement.getText()) && detailElement.getName().equalsIgnoreCase('Key') && !detailElement.getText().endsWith('/')){
                        listOfAWSObjectNames.add(detailElement.getText());
                    }
                }
            }

            System.debug('listOfAWSObjectNames ' + listOfAWSObjectNames);
        }

        String awsAccessKeyId = 'AKIAYS2NUYP5BRW5JX2E';
        String secretKey = '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';
        Datetime now = Datetime.now().addSeconds(1800);
        Long dateTimeInTimeStamp = now.getTime()/1000;

        for (String str : listOfAWSObjectNames) {
            // String signedURL = 'GET\n\n\n' + dateTimeInTimeStamp + '\n/' + 'muthu-dev' + '\n/' + str;
            String signedURL = 'GET\n\n\n' + dateTimeInTimeStamp + '\n/' + 'muthu-dev' + '/' + str;
            Blob mac = Crypto.generateMac('HMacSHA1', blob.valueOf(signedURL), blob.valueOf(secretKey));
			String signature = EncodingUtil.base64Encode(mac);
            // signature = EncodingUtil.urlEncode(signature, 'UTF-8');
            // str = 'https://muthu-dev.s3.ap-south-1.amazonaws.com/'  + str + '?AWSAccessKeyId=' + awsAccessKeyId + '&Expires=' + dateTimeInTimeStamp + '&Signature=' + signature;
            GetSignedAWSURL aws = new GetSignedAWSURL();
            str = aws.getSignedURL(awsAccessKeyId, secretKey, 'muthu-dev', 'ap-south-1', 'https://muthu-dev.s3.ap-south-1.amazonaws.com/'  + str , str, 1600);

            System.debug('str ' + str);
        }
    }
}