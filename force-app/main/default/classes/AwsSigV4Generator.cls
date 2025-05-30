public class AwsSigV4Generator {

    public static String getAmzDate() {
        return Datetime.now().formatGmt('yyyyMMdd\'T\'HHmmss\'Z\'');
    }

    public static String getDateStamp() {
        return Datetime.now().formatGmt('yyyyMMdd');
    }

    public static String hash(String text) {
        Blob b = Crypto.generateDigest('SHA-256', Blob.valueOf(text));
        return EncodingUtil.convertToHex(b).toLowerCase();
    }

    public static Blob hmacSHA256(Blob key, String data) {
        return Crypto.generateMac('HmacSHA256', Blob.valueOf(data), key);
    }

    public static String generateAuthorizationHeader(
        String accessKey,
        String secretKey,
        String region,
        String service,
        String method,
        String host,
        String canonicalUri,
        String payload,
        String amzDate,
        String dateStamp
    ) {
        String signedHeaders = 'host;x-amz-date';
        String canonicalQueryString = '';
        String canonicalHeaders = 'host:' + host + '\n' + 'x-amz-date:' + amzDate + '\n';
        String payloadHash = hash(payload);

        String canonicalRequest = method + '\n' +
                                  canonicalUri + '\n' +
                                  canonicalQueryString + '\n' +
                                  canonicalHeaders + '\n' +
                                  signedHeaders + '\n' +
                                  payloadHash;

        String canonicalRequestHash = hash(canonicalRequest);
        String credentialScope = dateStamp + '/' + region + '/' + service + '/aws4_request';

        String stringToSign = 'AWS4-HMAC-SHA256\n' +
                              amzDate + '\n' +
                              credentialScope + '\n' +
                              canonicalRequestHash;

        // Derive the signing key
        Blob kSecret = Blob.valueOf('AWS4' + secretKey);
        Blob kDate = hmacSHA256(kSecret, dateStamp);
        Blob kRegion = hmacSHA256(kDate, region);
        Blob kService = hmacSHA256(kRegion, service);
        Blob kSigning = hmacSHA256(kService, 'aws4_request');

        Blob signature = hmacSHA256(kSigning, stringToSign);
        String signatureHex = EncodingUtil.convertToHex(signature).toLowerCase();

        String authorizationHeader = 'AWS4-HMAC-SHA256 ' +
                                     'Credential=' + accessKey + '/' + credentialScope + ', ' +
                                     'SignedHeaders=' + signedHeaders + ', ' +
                                     'Signature=' + signatureHex;

        return authorizationHeader;
    }
}