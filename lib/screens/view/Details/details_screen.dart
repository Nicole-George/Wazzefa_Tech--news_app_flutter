import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.content,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final String description;
  final String author;
  final String publishedAt;
  final String content;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  Future<void> speak(String text) async {
    if (isSpeaking) {
      await flutterTts.pause();
      setState(() {
        isSpeaking = false;
      });
    } else {
      await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);

      setState(() {
        isSpeaking = true;
      });
    }
  }

  Future<void> pause() async {
    await flutterTts.pause();
    setState(() {
      isSpeaking = false;
    });
  }

  // Future<void> resume() async {
  //   await flutterTts();
  //   setState(() {
  //     isSpeaking = true;
  //   });
  // }

  Future<void> stop() async {
    await flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2b3868),
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Color(0xff2b3868),
                child: const Icon(Icons.chevron_left, color: Colors.white),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.newspaper_sharp,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          widget.publishedAt,
                          style: const TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff2b3868),
                            ),
                            onPressed: () {
                              speak(widget.content);
                            },
                            child: Text("Start",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff2b3868),
                          ),
                          onPressed: () {
                            pause();
                          },
                          child: Text("Pause",style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(widget.content),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
