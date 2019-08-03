package asp_assignment4

import java.security.PrivateKey
import java.security.PublicKey

class RSAController {

    def index() { }

    /***
     * Modified from https://smartcodeschool.blogspot.com/2014/10/rsa-example.html
     */
    def encrypt(){
        try {
            // Check if the pair of keys are present else generate those.
            if (!EncryptionUtil.areKeysPresent()) {
                // Method generates a pair of keys using the RSA algorithm and stores it
                // in their respective files
                EncryptionUtil.generateKey();
            }

            final String originalText = params.originalText
            ObjectInputStream inputStream = null;

            // Encrypt the string using the public key
            inputStream = new ObjectInputStream(new FileInputStream(EncryptionUtil.PUBLIC_KEY_FILE));
            final PublicKey publicKey = (PublicKey) inputStream.readObject();
            final byte[] cipherText = EncryptionUtil.encrypt(originalText, publicKey);

            // Decrypt the cipher text using the private key.
            inputStream = new ObjectInputStream(new FileInputStream(EncryptionUtil.PRIVATE_KEY_FILE));
            final PrivateKey privateKey = (PrivateKey) inputStream.readObject();
            final String plainText = EncryptionUtil.decrypt(cipherText, privateKey);

            render view: "index", model:[results:[original:originalText,encrypted:new String(cipherText),decrypted:plainText]]

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
