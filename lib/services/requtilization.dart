import '../model/comman/PayLoad.dart';
import 'encryption/encdec/extra.dart';
import 'encryption/js_encryption.dart';

Future<PayLoad> getPayLoad(dynamic request, String url) async {
  var encryptData = AesGcmEncryptionUtils.encryptNew(request);

  return PayLoad(data: encryptData, uri: url);
}
