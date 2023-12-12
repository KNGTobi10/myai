import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetResponseCall {
  static Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? prompt = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{
  "messages": [
    {
      "role": "user",
      "content": "$prompt. Return a response that could be read allowed in a total of about 15-20 seconds in $language (language code)"
    }
  ],
  "model": "gpt-3.5-turbo-instruct-0914",
  "max_tokens": 100
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetResponse',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreatingChatCall {
  static Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? imageUrl = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-4-vision-preview",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "$text"
        },
        {
          "type": "image_url",
          "image_url": {
            "url": "$imageUrl"
          }
        }
      ]
    }
  ],
  "max_tokens": 300
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreatingChat',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GettingResponseCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? prompt = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{
  "messages": [
    {
      "role": "user",
      "content": "$prompt. Return a response that could be read allowed in a total of about 13-15 seconds in $language (language code)"
    }
  ],
  "model": "gpt-4-1106-preview",
  "web_access": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GettingResponse',
      apiUrl: 'https://chatgpt-42.p.rapidapi.com/gpt4',
      callType: ApiCallType.POST,
      headers: {
        'X-RapidAPI-Key': 'e378632801msh497bfc19c953900p15867fjsn4bb6bc4d7cf8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.result''',
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
