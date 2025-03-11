// import 'package:aquaflow/services/loginapi.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ChatScreen1 extends StatefulWidget {
//   final dynamic resId;
//   const ChatScreen1({super.key, this.resId});

//   @override
//   State<ChatScreen1> createState() => _ChatScreen1State();
// }

// class _ChatScreen1State extends State<ChatScreen1> {
//   List<Map<String, dynamic>> messages = [];
//   final dio = Dio();
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     getMessages(); // Fetch messages initially
//   }

//   Future<void> sendMessage(String message) async {
//     // Show message instantly in UI
//     final newMessage = {
//       'sender': loginId,
//       'text': message,
//     };

//     setState(() {
//       messages.add(newMessage);
//     });

//     _scrollToBottom(); // Scroll to bottom

//     try {
//       final response = await dio.post(
//         '$baseUrl/chat/$loginId/${widget.resId}',
//         data: {'message': message},
//       );

//       print("Server Response: ${response.data}");

//       if (response.statusCode == 201) {
//         print('Message sent successfully');
//         await getMessages(); // Optional: Refresh to get all latest messages
//       } else {
//         print('Failed to send message. Status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//     }
//   }

//   Future<void> getMessages() async {
//     try {
//       final response = await dio.get('$baseUrl/chat/$loginId/${widget.resId}');
//       print(response);
//       if (response.statusCode == 200) {
//         print('Messages fetched successfully');
//         setState(() {
//           messages = List<Map<String, dynamic>>.from(response.data);
//         });
//         _scrollToBottom();
//       } else {
//         print('Failed to fetch messages. Status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching messages: $e');
//     }
//   }

//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: const Text('AQUA FLOW',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         actions: [
//           IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(16.0),
//               children: messages.map((message) {
//                 final sender = message['sender'];
//                 final text = message['text'];
//                 final isSender = sender == loginId;

//                 return MessageBubble(
//                   sender: sender.toString(),
//                   text: text.toString(),
//                   isSender: isSender,
//                 );
//               }).toList(),
//             ),
//           ),
//           ChatInputField(onSend: sendMessage),
//         ],
//       ),
//     );
//   }
// }

// class MessageBubble extends StatelessWidget {
//   final String sender;
//   final String text;
//   final bool isSender;

//   const MessageBubble({
//     super.key,
//     required this.sender,
//     required this.text,
//     required this.isSender,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         decoration: BoxDecoration(
//           color: isSender ? Colors.blue : Colors.grey[700],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment:
//               isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Text(sender,
//                 style: const TextStyle(color: Colors.white70, fontSize: 12)),
//             const SizedBox(height: 4),
//             Text(text, style: const TextStyle(color: Colors.white)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChatInputField extends StatefulWidget {
//   final Function(String) onSend;
//   const ChatInputField({super.key, required this.onSend});

//   @override
//   State<ChatInputField> createState() => _ChatInputFieldState();
// }

// class _ChatInputFieldState extends State<ChatInputField> {
//   final TextEditingController controller = TextEditingController();

//   void _handleSend() {
//     final text = controller.text.trim();
//     if (text.isNotEmpty) {
//       widget.onSend(text);
//       controller.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[900],
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: 'Type...',
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 filled: true,
//                 fillColor: Colors.grey[800],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           CircleAvatar(
//             backgroundColor: Colors.blue,
//             child: IconButton(
//               icon: const Icon(Icons.send, color: Colors.white),
//               onPressed: _handleSend,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:aquaflow/services/loginapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatScreen1 extends StatefulWidget {
  final dynamic resId;
  const ChatScreen1({super.key, this.resId});

  @override
  State<ChatScreen1> createState() => _ChatScreen1State();
}

class _ChatScreen1State extends State<ChatScreen1> {
  List<Map<String, dynamic>> messages = [];
  final dio = Dio();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  Future<void> sendMessage(String message) async {
    try {
      final response = await dio.post(
        '$baseUrl/chat/$loginId/${widget.resId}',
        data: {'message': message},
      );

      if (response.statusCode == 201) {
        await getMessages();
      } else {
        print('Failed to send message. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Future<void> getMessages() async {
    try {
      final response = await dio.get('$baseUrl/chat/$loginId/${widget.resId}');
      if (response.statusCode == 200) {
        setState(() {
          messages = List<Map<String, dynamic>>.from(response.data);
        });
        _scrollToBottom();
      } else {
        print('Failed to fetch messages. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'AQUA FLOW',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSender = message['sender'].toString() == loginId.toString();

                return MessageBubble(
                  text: message['message'],
                  timestamp: message['timestamp'],
                  isSender: isSender,
                );
              },
            ),
          ),
          ChatInputField(onSend: sendMessage),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String timestamp;
  final bool isSender;

  const MessageBubble({
    super.key,
    required this.text,
    required this.timestamp,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[700],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              timestamp.substring(11, 16), // shows "HH:mm"
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatefulWidget {
  final Function(String) onSend;
  const ChatInputField({super.key, required this.onSend});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController controller = TextEditingController();

  void _handleSend() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text);
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _handleSend,
            ),
          ),
        ],
      ),
    );
  }
}
