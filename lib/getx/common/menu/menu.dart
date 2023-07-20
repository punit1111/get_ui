import 'package:get_ui/getx/input_dialog.dart';

class Menu {
  final List<String> choices;
  final String title;

  Menu(this.choices, {this.title = ''});

  Answer choose() {
    // final dialog = CLI_Dialog(listQuestions: [
    //   [
    //     {'question': title, 'options': choices},
    //     'result'
    //   ]
    // ]);

    // final answer = dialog.ask();
    // final result = answer['result'] as String;
    print("");
    //final result = menu(prompt: title, options: choices, defaultOption: choices[0]);
    showInputDialog(title: 'title');
    final result = '';
    final index = choices.indexOf(result);

    return Answer(result: result, index: index);
  }
}

class Answer {
  final String result;
  final int index;

  const Answer({required this.result, required this.index});
}
