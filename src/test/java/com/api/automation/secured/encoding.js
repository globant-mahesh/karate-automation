function encodeBasic(cred) {
    var formattedCred = cred.username + ':' + cred.password;
    var base64 = Java.type('java.util.Base64');
    var formattedCredBytes = [];
    for (let i = 0; i < formattedCred.length; i++) {
            formattedCredBytes.push(formattedCred.charCodeAt(i));
        }
    var encodedCred = base64.getEncoder().encodeToString(formattedCredBytes);
    return 'Basic ' + encodedCred;
}