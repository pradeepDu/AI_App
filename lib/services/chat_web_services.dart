import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final ChatWebService _instance = ChatWebService.internal();
  factory ChatWebService() => _instance;
  ChatWebService.internal();

  WebSocket? _socket;
  final _searchResultController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _contentController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  String _getWebSocketUrl() {
    if (kIsWeb) {
      return 'ws://localhost:8000/ws/chat';
    } else {
      // For Android emulator; ensures connection to host machine
      return 'ws://10.0.2.2:8000/ws/chat';
    }
  }

  void connect() {
    // Close any existing connection
    _socket?.close();
    try {
      _socket = WebSocket(Uri.parse(_getWebSocketUrl()));
      _socket!.messages.listen(
        (message) {
          final data = json.decode(message);
          if (data['type'] == 'search_results') {
            _searchResultController.add(data);
          } else if (data['type'] == 'content') {
            _contentController.add(data);
          }
        },
        onError: (err) {
          // Handle errors as needed
        },
        onDone: () {
          // Connection closed
        },
      );
    } catch (e) {
      // Handle exception as needed
    }
  }

  void chat(String query) {
    if (_socket == null) {
      connect();
      Future.delayed(Duration(seconds: 1), () {
        if (_socket != null) {
          _socket!.send(json.encode({"query": query}));
        }
      });
    } else {
      _socket!.send(json.encode({"query": query}));
    }
  }

  void dispose() {
    _socket?.close();
    _searchResultController.close();
    _contentController.close();
  }
}
