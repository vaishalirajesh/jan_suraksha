import 'dart:async';

import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/utils/file_util.dart';

import '../request/tg_request.dart';
import 'mock_mapping_vo.dart';

class TGMockService {
  static late Map<String, TGMockMappingVO> _mockMappings;
  static bool applyMock = false;

  static Future<void> loadMockMappings(String mockMappingsFile) async {
    TGLog.d("TGMockService.loadMockMappings()");
    TGLog.d("Loading... " + mockMappingsFile);
    _mockMappings = {};

    if (mockMappingsFile.length >= 0) {
      List jsonList = await FileUtil.readJsonFileAsList(mockMappingsFile);
      List<TGMockMappingVO> mappingList =
          jsonList.map<TGMockMappingVO>((json) => TGMockMappingVO.fromJson(json)).toList();

      _mockMappings = {};
      for (TGMockMappingVO mockMappingVO in mappingList) {
        await _saveMockMapping(mockMappingVO);
      }
    }
  }

  static Future _saveMockMapping(TGMockMappingVO mockMappingVO) async {
    if (mockMappingVO.applyMock == null && !mockMappingVO.applyMock!) return;

    mockMappingVO.successString = "";
    mockMappingVO.errorString = "";
    if (mockMappingVO.successFile != null)
      mockMappingVO.successString = await FileUtil.readFile(mockMappingVO.successFile!);
    if (mockMappingVO.errorFile != null) mockMappingVO.errorString = await FileUtil.readFile(mockMappingVO.errorFile!);
    _mockMappings[
            _generateHash(TGRequest.prepareUrl(TGRequest.defaultBaseUrl, mockMappingVO.uri), mockMappingVO.method!)] =
        mockMappingVO;

    TGLog.d("_mockMappings-------->" + _mockMappings.toString());
  }

  static TGMockMappingVO? getMockMappingVO(String url, String method) {
    String hash = _generateHash(url, method);
    return _mockMappings[hash];
  }

  static bool? shouldApplyMock(String uri, String method) {
    if (!applyMock) return false;

    String hash = _generateHash(TGRequest.prepareUrl(TGRequest.defaultBaseUrl, uri), method);
    if (_mockMappings.containsKey(hash)) {
      TGMockMappingVO? mockMappingVO = _mockMappings[hash];
      if (mockMappingVO != null) return mockMappingVO.applyMock;
    }

    // Unable to find mock mapping entry
    return false;
  }

  static String _generateHash(String url, String method) {
    return _trimUrl(url) + "_" + method;
  }

  static String _trimUrl(String? url) {
    if (url == null) return "";
    if (url.contains("?")) url = url.substring(0, url.indexOf("?"));
    if (url.endsWith("/")) url = url.substring(0, url.lastIndexOf("/"));
    return url;
  }
}
