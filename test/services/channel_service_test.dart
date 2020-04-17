import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:rocket_chat_connector_flutter/models/new/channel_new.dart';
import 'package:rocket_chat_connector_flutter/models/response/channel_new_response.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';

import '../scenarios/data/new/channel_new_data.dart';
import '../scenarios/data/response/channel_new_response_data.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  HttpService httpServiceMock;
  ChannelService channelService;

  ChannelNew channelNew = ChannelNewData.getById(1);

  setUp(() async {
    httpServiceMock = HttpServiceMock();
    channelService = ChannelService(httpServiceMock);
  });

  test ('create channel', () async {
    Response response = Response(jsonEncode(ChannelNewResponseData.getMapById(1)), 200);
    when(httpServiceMock.post("/api/v1/channels.create", jsonEncode(channelNew.toMap())))
        .thenAnswer((_) => Future(() => response));

    ChannelNewResponse channelNewResponse = await channelService.create(channelNew);
    expect(channelNewResponse.success, true);
  });
}