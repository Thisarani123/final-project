import 'package:detectnew/fruitinfo.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:detectnew/Messages.dart'; // Replace with the correct import path

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          // Navigate to the friutinfo page when you click anywhere on the chat page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => friutinfo()),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: null, // Set title to null to remove AMBOT text
            flexibleSpace: Scene(),
          ),
          body: Container(
            width: double.infinity,
            height: 750,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/chatbotbackground.png',
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: <Color>[
                  Color.fromARGB(223, 15, 187, 9),
                  Color.fromARGB(19, 128, 142, 128),
                ],
                stops: <double>[0, 1],
              ),
            ),
            child: Column(
              children: [
                Expanded(child: MessagesScreen(messages: messages)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  color: Color.fromARGB(255, 105, 172, 231),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    double fem = MediaQuery.of(context).size.width / 414;
    double ffem = fem * 0.97;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/ellipse-8.png',
                ),
              ),
            ),
            width: 420 * fem,
            height: 150 * fem,
            child: Stack(
              children: [
                Positioned(
                  left: 70 * fem,
                  top: 0.08,
                  child: Align(
                    child: SizedBox(
                      width: 95 * fem,
                      height: 100 * fem,
                      child: Image.asset(
                        'assets/images/chatbot.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 215 * fem,
                  top: 10 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 98 * fem,
                      height: 30 * fem,
                      child: Text(
                        'Chatbot',
                        style: TextStyle(
                          fontSize: 24.5 * ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.9 * ffem / fem,
                          color: Color.fromARGB(255, 249, 249, 251),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 165 * fem,
                  top: 40 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 235 * fem,
                      height: 50 * fem,
                      child: Text(
                        'How can I help you?',
                        style: TextStyle(
                          fontSize: 24 * ffem,
                          color: Color.fromARGB(255, 5, 4, 4),
                          fontWeight: FontWeight.w800,
                          height: 2 * ffem / fem,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
