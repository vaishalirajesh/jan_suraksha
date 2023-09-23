import '../model/comman/PayLoad.dart';
import 'encryption/encdec/aesGcmEncryption.dart';

Future<PayLoad> getPayLoad(dynamic request, String url) async {
  var encryptData = AesGcmEncryptionUtils.encryptNew(request);

  return PayLoad(data: encryptData, uri: url);
}

Future<ReqPlainPayLoad> getPlainPayLoad(dynamic request, String url) async {
  return ReqPlainPayLoad(request, uri: url);
}
