
package org.example;

import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;

public class SFIssuePlayGround {

    public static void main(String args[]) throws NoSuchAlgorithmException, KeyStoreException, CertificateEncodingException {
        System.out.println(KeyManagerFactory.getDefaultAlgorithm());
        TrustManagerFactory factory = TrustManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
        factory.init((KeyStore)null);
        TrustManager[] var4 = factory.getTrustManagers();
        System.out.println(var4.length);
        X509TrustManager ret = null;
        int var5 = var4.length;
        int var6;
        for(var6 = 0; var6 < var5; ++var6) {
            TrustManager tm = var4[var6];
            if (tm instanceof X509TrustManager) {
                ret = (X509TrustManager)tm;
                break;
            }
        }
        X509Certificate[] var14 = ret.getAcceptedIssuers();
        var6 = var14.length;
        for(int var15 = 0; var15 < var6; ++var15) {
            X509Certificate cert = var14[var15];
            System.out.println(cert);
        }



    }
}
