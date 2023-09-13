import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';
import 'package:uuid/uuid.dart';

import 'encrypt.dart';

class AesGcmEncryptionUtils {
  static final String ENCRYPT_ALGO = 'AES/GCM/NoPadding';
  static final int TAG_LENGTH_BIT = 128;
  static final int IV_LENGTH_BYTE = 16;
  static final int AES_KEY_BIT = 256;

  static final String key = 'Xa/Bc14y7+Y0wq2SFHAuovvsfvnW7PUkKncUstn9z7o=';
  static final String ALGO_AES = 'AES';

  static final utf8 = Utf8Codec();

  static Uint8List encrypt(Uint8List pText, Uint8List secret, Uint8List iv) {
    final encrypter = GCMBlockCipher(AESFastEngine())..init(true, ParametersWithIV(KeyParameter(secret), iv));
    final encryptedText = encrypter.process(Uint8List.fromList(pText));
    return Uint8List.fromList(encryptedText);
  }

  static String encryptNew(String plainText) {
    final iv = Uuid().v4().replaceAll('-', '').substring(16);
    final encData = encrypt(Uint8List.fromList(utf8.encode(plainText)), Uint8List.fromList(base64.decode(key)),
        Uint8List.fromList(utf8.encode(iv)));

    final encryptedData = base64.encode(encData);
    final result = '$encryptedData::$iv';

    return base64.encode(utf8.encode(result));
  }

  static String decryptNew(String encodedStr) {
    final split = utf8.decode(base64.decode(encodedStr)).split('::');
    final sKey = Key(Uint8List.fromList(base64.decode(key)));
    final decryptedData = decrypt(
        base64.decode(split[0]), Uint8List.fromList(base64.decode(key)), Uint8List.fromList(utf8.encode(split[1])));
    return utf8.decode(decryptedData);
  }

  // static Uint8List encryptWithPrefixIV(Uint8List pText, Key secret, Uint8List iv) {
  //   final cipherText = encrypt(pText, secret, iv);
  //   final cipherTextWithIv = Uint8List.fromList([...iv, ...cipherText]);
  //   return cipherTextWithIv;
  // }
  //
  static Uint8List decrypt(Uint8List cText, Uint8List secret, Uint8List iv) {
    final encrypter = GCMBlockCipher(AESFastEngine())
      ..init(
        false,
        ParametersWithIV(KeyParameter(secret), iv),
      );
    final decryptedText = encrypter.process(cText);
    return Uint8List.fromList(decryptedText);
  }

  // static String decryptWithPrefixIV(Uint8List cText, Key secret) {
  //   final bb = ByteData.sublistView(cText.buffer);
  //   final iv = bb.getUint8List(0, IV_LENGTH_BYTE);
  //   final cipherText = bb.getUint8List(IV_LENGTH_BYTE);
  //   final plainText = decrypt(cipherText, secret, iv);
  //   return utf8.decode(plainText);
  // }

  // static Uint8List getRandomNonce() {
  //   final nonce = Uint8List(IV_LENGTH_BYTE);
  //   final secureRandom = SecureRandom('AES/CTR/AUTO-SEED-PRNG')..seed(KeyParameter(Uint8List(32)));
  //   secureRandom.nextBytes(nonce);
  //   return nonce;
  // }

  // static Key getAESKey() {
  //   final keyGen = KeyGenerator('AES')
  //     ..init(ParametersWithRandom(ParametersWithIV(KeyParameter(Uint8List(32)), getRandomNonce())));
  //   return keyGen.generateKey();
  // }

  // static Uint8List decryptSecretKey(String data, String privatekeyPath) {
  //   final encryptedData = base64.decode(data);
  //   final privateKey = getPrivatekey(privatekeyPath);
  //   final cipher = RSAEngine()..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));
  //   final encryptedByte = cipher.process(Uint8List.fromList(encryptedData));
  //   return Uint8List.fromList(encryptedByte);
  // }

  // static Uint8List decryptSecretKeyByPublicKey(String data, String publickeyPath) {
  //   final encryptedData = base64.decode(data);
  //   final publicKey = getPublicKey(publickeyPath);
  //   final cipher = RSAEngine()..init(false, PublicKeyParameter<RSAPublicKey>(publicKey));
  //   final decryptedByte = cipher.process(Uint8List.fromList(encryptedData));
  //   return Uint8List.fromList(decryptedByte);
  // }

  // static String encryptSecretKey(String data, String publickeyPath) {
  //   final plaintext = Uint8List.fromList(utf8.encode(data));
  //   final publicKey = getPublicKey(publickeyPath);
  //   final cipher = RSAEngine()..init(true, PublicKeyParameter<RSAPublicKey>(publicKey));
  //   final encryptedByte = cipher.process(plaintext);
  //   return base64.encode(Uint8List.fromList(encryptedByte));
  // }
  //
  // static String encryptSecretKeyByPrivateKey(String data, String privatekeyPath) {
  //   final plaintext = Uint8List.fromList(utf8.encode(data));
  //   final privateKey = getPrivatekey(privatekeyPath);
  //   final cipher = RSAEngine()..init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));
  //   final encryptedByte = cipher.process(plaintext);
  //   return base64.encode(Uint8List.fromList(encryptedByte));
  // }

  // static RSAPrivateKey getPrivatekey(String key) {
  //   final keySpec = PKCS8EncodedKeySpec(Uint8List.fromList(base64.decode(key)));
  //   final keyFactory = KeyFactory('RSA');
  //   final privateKey = keyFactory.generatePrivate(keySpec);
  //   return privateKey as RSAPrivateKey;
  // }
  //
  // static RSAPublicKey getPublicKey(String publickeyCert) {
  //   final keyFactory = KeyFactory('RSA');
  //   final publicKey =
  //       keyFactory.generatePublic(RSAPublicKeyParameter(Uint8List.fromList(base64.decode(publickeyCert))));
  //   return publicKey as RSAPublicKey;
  // }

  static void main() {
    final encData =
        AesGcmEncryptionUtils.encryptNew('\t This is developed by Sandip Bhetariya' + '   ' + '\n' + '\t' + '®');
    print(encData);
    print('Dec Data : $encData');
    final decData = AesGcmEncryptionUtils.decryptNew(encData);
    print('Dec Data : $decData');
  }

  static String getKey() {
    return key;
  }
}
