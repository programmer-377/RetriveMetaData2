public class AWSRequestSigner {

    // AWS Access Key ID
    private static final String ACCESS_KEY = 'AKIAYWEUU3PISMEECHP7';

    // AWS Secret Access Key
    private static final String SECRET_KEY = 'W+Qtpv0YQSg8Ur4AeTygpQIY05TQc/AXYABOyAXA';

    // AWS Region
    private static final String REGION = 'ap-south-1';

    // AWS Service
    private static final String SERVICE = 'lambda';

    // Generate a signed string for AWS v4 signature
    public static String generateSignedString(String method, String endpoint, String payload) {
        // Step 1: Create a Canonical Request
        String canonicalRequest = createCanonicalRequest(method, endpoint, payload);

        // Step 2: Create a String to Sign
        String stringToSign = createStringToSign(canonicalRequest);

        // Step 3: Calculate the Signature
        String signature = calculateSignature(stringToSign);

        return signature;
    }

    private static String createCanonicalRequest(String method, String endpoint, String payload) {
        // Canonical request format:
        // HTTPMethod + "\n" +
        // CanonicalURI + "\n" +
        // CanonicalQueryString + "\n" +
        // CanonicalHeaders + "\n" +
        // SignedHeaders + "\n" +
        // HexEncode(Hash(RequestPayload))

        // Note: This is a simplified example and assumes no query strings or special headers
        String canonicalURI = '/';
        String canonicalQueryString = '';
        String canonicalHeaders = 'host:' + endpoint + '\n';
        String signedHeaders = 'host';
        String hashPayload = String.valueOf(Crypto.generateDigest('SHA-256', Blob.valueOf(payload)));

        String canonicalRequest = method + '\n' +
                                  canonicalURI + '\n' +
                                  canonicalQueryString + '\n' +
                                  canonicalHeaders + '\n' +
                                  signedHeaders + '\n' +
                                  hashPayload;
        return canonicalRequest;
    }

    private static String createStringToSign(String canonicalRequest) {
        // Step 1: Hash the canonical request
        String hashedCanonicalRequest = String.valueOf(Crypto.generateDigest('SHA-256', Blob.valueOf(canonicalRequest)));

        // Step 2: Create the string to sign
        // Format: AWS4-HMAC-SHA256\n<Date>\n<Scope>\n<Hash(CanonicalRequest)>
        String datee = Datetime.now().format('yyyyMMdd') + 'T' + Datetime.now().format('HHmmss') + 'Z';
        String scope = Datetime.now().format('yyyyMMdd') + '/' + REGION + '/' + SERVICE + '/aws4_request';

        String stringToSign = 'AWS4-HMAC-SHA256\n' + datee + '\n' + scope + '\n' + hashedCanonicalRequest;
        return stringToSign;
    }

    private static String calculateSignature(String stringToSign) {
        // Step 1: Generate signing key
        Blob signingKey = generateSigningKey();

        // Step 2: Calculate the signature
        Blob signature = Crypto.generateMac('HmacSHA256', Blob.valueOf(stringToSign), signingKey);
        return String.valueOf(signature);
    }

    private static Blob generateSigningKey() {
        String datee = Datetime.now().format('yyyyMMdd');
        Blob keyDate = Crypto.generateMac('HmacSHA256', Blob.valueOf(datee), Blob.valueOf('AWS4' + SECRET_KEY));
        Blob keyRegion = Crypto.generateMac('HmacSHA256', Blob.valueOf(REGION), keyDate);
        Blob keyService = Crypto.generateMac('HmacSHA256', Blob.valueOf(SERVICE), keyRegion);
        Blob keySigning = Crypto.generateMac('HmacSHA256', Blob.valueOf('aws4_request'), keyService);
        return keySigning;
    }
}