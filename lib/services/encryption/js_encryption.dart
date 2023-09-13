import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

class EncryptionUtils {
  static final GCMBlockCipher _gcmCipher = GCMBlockCipher(AESFastEngine());
  static final int aesKeySize = 16;
  static final int gcmIvLength = 12;
  static final int gcmTagLength = 16;

  static final String algorithm = "AES";
  static final String secretKey = "Xa/Bc14y7+Y0wq2SFHAuovvsfvnW7PUkKncUstn9z7o=";
  static final String gcmIV = "ebd5eac2977a";

  static Uint8List _generateIv() {
    final random = Random.secure();
    final iv = Uint8List(gcmIvLength);
    for (var i = 0; i < gcmIvLength; i++) {
      iv[i] = random.nextInt(256);
    }
    return iv;
  }

  static String decodeAndPadBase64(String base64String, int targetSize) {
    // Decode the Base64 string
    final decodedBytes = base64.decode(base64String);

    // Check if the decoded bytes are already of the target size
    if (decodedBytes.length == targetSize) {
      return base64String;
    }

    // Create a new Uint8List of the target size and fill it with zeros
    final paddedBytes = Uint8List(targetSize);
    for (var i = 0; i < targetSize; i++) {
      paddedBytes[i] = 0;
    }

    // Copy the decoded bytes into the padded bytes
    final copyLength = decodedBytes.length < targetSize ? decodedBytes.length : targetSize;
    paddedBytes.setRange(0, copyLength, decodedBytes);

    // Encode the padded bytes to Base64
    return base64.encode(paddedBytes);
  }

  static Uint8List _generateKey() {
    final paddedBytes = Uint8List(aesKeySize);
    for (var i = 0; i < aesKeySize; i++) {
      paddedBytes[i] = 0;
    }
    if (paddedBytes.length != aesKeySize) {
      throw Exception("Invalid secret key length");
    }
    return Uint8List.fromList(paddedBytes);
  }

  static EncryptMainRequest encryptesApi(String? plainText) {
    final gson = Gson();
    final encryptRequest = EncryptMainRequest();
    try {
      final iv = _generateIv();
      final key = _generateKey();
      _gcmCipher.init(
        true, // Encrypt mode
        AEADParameters(
          KeyParameter(key),
          gcmTagLength * 8,
          iv,
          iv,
        ),
      );

      final plainTextBytes = utf8.encode(plainText!);
      final cipherText = _gcmCipher.process(Uint8List.fromList(plainTextBytes));
      final encodedCipherText = base64.encode(cipherText);
      final encodedIv = base64.encode(iv);
      encryptRequest.data = "$encodedCipherText::$encodedIv";
      print("Encrypted Req: $encryptRequest");
      return encryptRequest;
    } catch (e) {
      print("Error while encrypting data: $e");
    }

    return encryptRequest;
  }

  static String encryptesApiString(String? plainText) {
    final gson = Gson();

    try {
      final iv = _generateIv();
      final key = _generateKey();

      _gcmCipher.init(
        true, // Encrypt mode
        AEADParameters(
          KeyParameter(key),
          gcmTagLength * 8,
          iv,
          iv,
        ),
      );

      final plainTextBytes = utf8.encode(plainText!);
      final cipherText = _gcmCipher.process(Uint8List.fromList(plainTextBytes));

      final encodedCipherText = base64.encode(cipherText);
      final encodedIv = base64.encode(iv);

      print("Encrypted Req String: $encodedCipherText::$encodedIv");

      return "$encodedCipherText::$encodedIv";
    } catch (e) {
      print("Error while encrypting data: $e");
    }

    return "";
  }

  static String encryptes(String? plainText) {
    final gson = Gson();

    try {
      final iv = _generateIv();
      final key = _generateKey();

      _gcmCipher.init(
        true, // Encrypt mode
        AEADParameters(
          KeyParameter(key),
          gcmTagLength * 8,
          iv,
          iv,
        ),
      );

      final plainTextBytes = utf8.encode(plainText!);
      final cipherText = _gcmCipher.process(Uint8List.fromList(plainTextBytes));

      final encodedCipherText = base64.encode(cipherText);
      final encodedIv = base64.encode(iv);

      return "$encodedCipherText::$encodedIv";
    } catch (e) {
      print("Error while encrypting data: $e");
    }

    return "";
  }

  static String decryptaes(String encryptedText) {
    try {
      final split = encryptedText.split("::");
      final cipherText = base64.decode(split[0]);
      final iv = base64.decode(split[1]);
      final key = _generateKey();

      _gcmCipher.init(
        false, // Decrypt mode
        AEADParameters(
          KeyParameter(key),
          gcmTagLength * 8,
          iv,
          iv,
        ),
      );

      final decryptedBytes = _gcmCipher.process(Uint8List.fromList(cipherText));

      final decryptedText = utf8.decode(decryptedBytes);

      print("Decrypted Response: $decryptedText");

      return decryptedText;
    } catch (e) {
      print("Error while decrypting: $e");
    }

    return "";
  }
}

class EncryptMainRequest {
  String? data;

  EncryptMainRequest({this.data});

  @override
  String toString() {
    return 'EncryptMainRequest{data: $data}';
  }
}

class Gson {
  String toJson(dynamic object) {
    return jsonEncode(object);
  }
}
