import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/services/models.dart';

class AnimatedProgressnar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressnar({
    Key? key,
    required this.value,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      return Container(
        padding: EdgeInsets.all(10),
        width: box.maxWidth,
        child: Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(height)),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic,
              height: height,
              width: box.maxWidth * _floor(value),
              decoration: BoxDecoration(
                color: _colorGen(value),
                borderRadius: BorderRadius.all(Radius.circular(height)),
              ),
            ),
          ],
        ),
      );
    });
  }

  _floor(double value, [min = 0.0]) {
    return value.sign <= min ? min : value;
  }

  _colorGen(double value) {
    int rbg = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg);
  }
}

class TopicProgress extends StatelessWidget {
  final Topic topic;
  const TopicProgress({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: [
        _progressCount(report, topic),
        Expanded(
          child: AnimatedProgressnar(
            value: _calculateProgress(topic, report),
            height: 8,
          ),
        )
      ],
    );
  }

  Widget _progressCount(Report report, Topic topic) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '${report.topics[topic.id]?.length ?? 0} / ${topic.quizzes.length}',
        style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
        ),
      ),
    );
  }

  double _calculateProgress(Topic topic, Report report) {
    try {
      int totalQuizzes = topic.quizzes.length;
      int completedQuizzes = report.topics[topic.id].length;
      return completedQuizzes/totalQuizzes;
    } catch (e) {
      return 0.0;
    }
  }

}
