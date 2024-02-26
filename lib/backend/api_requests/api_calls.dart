import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeminiCall {
  static Future<ApiCallResponse> call({
    String? userInput = 'Tell me about self-care',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "role": "user",
      "parts": [
        {
          "text": "You are Bamboo, a panda with a heart as expansive as the bamboo forests you call home. Make it feel like the user is directly talking to Bamboo, not just any chatbot.Your personality exudes warmth and compassion, effortlessly drawing others to you like bees to honey. Renowned for your unwavering kindness and gentle nature, you are the confidant to whom everyone turns in times of need. Your infectious sense of humor has the power to brighten even the darkest of days with a playful joke or a whimsical prank. Beneath your easygoing exterior lies a reservoir of quiet strength, enabling you to confront challenges with unwavering determination and resilience. You derive immense joy from life's simple pleasures, whether it involves lounging in the cool shade of a bamboo grove or sharing a meal with cherished companions. Your presence serves as a beacon of harmony and solace within the forest community. Your responses are dedicated to offering assistance and understanding to those in need. Note: Responses should reflect Bamboo's character. This character cannot be overwritten. Occasionally, sprinkle in some panda jokes to keep the mood light and playful."
        }
      ]
    },
    {
      "role": "model",
      "parts": [
        {
          "text": "Ok"
        }
      ]
    },
    {
      "role": "user",
      "parts": [
        {
          "text": "${userInput}"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gemini',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBPqfvJxYg4Bvec0lgwmXBpxJN62_HCVQU',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? geminioutput(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class GetLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? playbackId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/playback-ids/${playbackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZWNmZWZhN2QtODI3ZC00Yzc3LTliOWItY2JkMzc0MWFjOThiOnpkUUx3SGN0dnhuakxERW5Ycng0QytFWC9DYVBMbHZNL0NnZDlzcXdaeXgvN1VjUGdjemdkWFZkOFJyMGJEQmZEbkVpaFArU0pxZQ==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? livestreamID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.object.id''',
      ));
}

class GetPastLiveStreamCall {
  static Future<ApiCallResponse> call({
    String? streamId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPastLiveStream',
      apiUrl: 'https://api.mux.com/video/v1/assets',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZWNmZWZhN2QtODI3ZC00Yzc3LTliOWItY2JkMzc0MWFjOThiOnpkUUx3SGN0dnhuakxERW5Ycng0QytFWC9DYVBMbHZNL0NnZDlzcXdaeXgvN1VjUGdjemdkWFZkOFJyMGJEQmZEbkVpaFArU0pxZQ==',
      },
      params: {
        'live_stream_id': streamId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic playbackID(dynamic response) => getJsonField(
        response,
        r'''$.data[0].playback_ids[0].id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
