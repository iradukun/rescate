// import 'package:flutter/material.dart';
// import 'package:flutter_dialogflow/dialogflow_v2.dart';

// import 'package:response/widgets/CustomAppBar.dart';

// class HomePageDialogflow extends StatefulWidget {
//   HomePageDialogflow({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _HomePageDialogflowState createState() => _HomePageDialogflowState();
// }

// class _HomePageDialogflowState extends State<HomePageDialogflow> {
//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final TextEditingController _textController = TextEditingController();

//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).accentColor),
//       child: SafeArea(
//         bottom: true,
//         top: false,
//         left: false,
//         right: false,
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Row(
//             children: <Widget>[
//               Flexible(
//                 child: TextField(
//                   controller: _textController,
//                   onSubmitted: _handleSubmitted,
//                   decoration:
//                       InputDecoration.collapsed(hintText: "Send a message"),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                 child: IconButton(
//                     icon: Icon(Icons.send),
//                     onPressed: () => _handleSubmitted(_textController.text)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void response(query) async {
//     _textController.clear();
//     AuthGoogle authGoogle =
//         await AuthGoogle(fileJson: "assets/json/credentials.json").build();
//     Dialogflow dialogflow =
//         Dialogflow(authGoogle: authGoogle, language: Language.english);
//     AIResponse response = await dialogflow.detectIntent(query);
//     ChatMessage message = ChatMessage(
//       text: response.getMessage() ??
//           CardDialogflow(response.getListMessage()[0]).title,
//       name: "Bot",
//       type: false,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//       name: "Response Bot",
//       type: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     response(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: <Widget>[
//         CustomAppBar(),
//         Flexible(
//           child: ListView.builder(
//             padding: const EdgeInsets.all(8.0),
//             reverse: true,
//             itemBuilder: (_, int index) => _messages[index],
//             itemCount: _messages.length,
//           ),
//         ),
//         Divider(height: 1.0),
//         Container(
//           decoration: BoxDecoration(color: Theme.of(context).cardColor),
//           child: _buildTextComposer(),
//         ),
//       ]),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   ChatMessage({required this.text, required this.name, required this.type});

//   final String text;
//   final String name;
//   final bool type;

//   List<Widget> otherMessage(context) {
//     return <Widget>[
//       Container(
//         margin: const EdgeInsets.only(right: 16.0),
//         child: CircleAvatar(child: Text('B')),
//       ),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
//             Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: Text(text),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   List<Widget> myMessage(context) {
//     return <Widget>[
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             Text(this.name, style: Theme.of(context).textTheme.subtitle1),
//             Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: Text(text),
//             ),
//           ],
//         ),
//       ),
//       Container(
//         margin: const EdgeInsets.only(left: 16.0),
//         child: CircleAvatar(
//             child: Text(
//           this.name[0],
//           style: TextStyle(fontWeight: FontWeight.bold),
//         )),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: this.type ? myMessage(context) : otherMessage(context),
//       ),
//     );
//   }
// }
