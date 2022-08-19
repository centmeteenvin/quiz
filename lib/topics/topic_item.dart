import 'package:flutter/material.dart';
import 'package:quiz/services/models.dart';
import 'package:quiz/shared/progress_bar.dart';
import 'package:quiz/topics/drawer.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.img,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => TopicScreen(topic: topic)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/covers/${topic.img}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      topic.title,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: TopicProgress(
                  topic: topic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Topic topic;
  const TopicScreen({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 1000,
          child: ListView(
            children: [
              Hero(
                tag: topic.img,
                child: Image.asset('assets/covers/${topic.img}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  topic.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                topic.description,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              QuizList(topic: topic),
            ],
          ),
        ),
      ),
    );
  }
}
