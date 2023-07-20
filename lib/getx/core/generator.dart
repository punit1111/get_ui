import '../commands/commands_list.dart';
import '../commands/impl/help/help.dart';
import '../commands/interface/command.dart';
import '../common/utils/logger/log_utils.dart';

class GetCli {
  final List<String> _arguments;

  GetCli(this._arguments) {
    _instance = this;
  }

  static GetCli? _instance;
  static GetCli? get to => _instance;

  static List<String> get arguments => to!._arguments;

  Command findCommand() => _findCommand(0, commands);

  Command _findCommand(int currentIndex, List<Command> commands) {
    try {
      print('debug print command 0');
      print('debug print arguments $arguments');
      final currentArgument = arguments[currentIndex].split(':').first;

      print('debug print current Argument $currentArgument');
      for (var element in commands) {
        print('debug print commands ${element.commandName} ${element.alias}');
      }

      var command = commands.firstWhere((command) {
        print(
            'debug print firstWhere $currentArgument ${command.commandName} ${command.alias}');
        return command.commandName == currentArgument ||
            command.alias.contains(currentArgument);
      }, orElse: () => ErrorCommand('command not found'));
      print(
          'debug print command ${command.commandName} ${command.childrens.toSet().toString()}');
      if (command.childrens.isNotEmpty) {
        if (command is CommandParent) {
          print('debug print command 1');
          command = _findCommand(++currentIndex, command.childrens);
        } else {
          print('debug print command 2');
          var childrenCommand = _findCommand(++currentIndex, command.childrens);
          if (childrenCommand is! ErrorCommand) {
            print('debug print command 3');
            command = childrenCommand;
          }
        }
      }

      for (var element in command.childrens) {
        print('debug print final command ${command.commandName}');
        print('debug print final command ${element.commandName}');
      }

      return command;
      // ignore: avoid_catching_errors
    } on RangeError catch (_) {
      return HelpCommand();
    } on Exception catch (_) {
      rethrow;
    }
  }
}

class ErrorCommand extends Command {
  @override
  String get commandName => 'onerror';
  String error;
  ErrorCommand(this.error);
  @override
  Future<void> execute() async {
    LogService.error(error);
    LogService.info('run `get help` to help', false, false);
  }

  @override
  String get hint => 'Print on erro';

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;

  @override
  bool validate() => true;
}

class NotFoundComannd extends Command {
  @override
  String get commandName => 'Not Found Comannd';

  @override
  Future<void> execute() async {
    //Command findCommand() => _findCommand(0, commands);
  }

  @override
  String get hint => 'Not Found Comannd';

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;

  @override
  bool validate() => true;
}
