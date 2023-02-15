import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionList extends ChangeNotifier {
  late final List<Question> _questionList;

  List<Question> get questionList => _questionList;

  QuestionList() {
    _questionList = [
      Question(
        "Preferable food choice?",
        [
          Option(
            "Veg",
            CupertinoIcons.tree,
          ),
          Option(
            "Non veg",
            FontAwesomeIcons.drumstickBite,
          ),
        ],
      ),
      Question(
        "Preferable travelling choice? ",
        [
          Option(
            "Alone",
            CupertinoIcons.person_fill,
          ),
          Option(
            "Group",
            CupertinoIcons.person_3_fill,
          ),
        ],
      ),
      Question(
        "Likable travelling location?",
        [
          Option(
            "Mountains",
            FontAwesomeIcons.mountain,
          ),
          Option(
            "Beaches",
            FontAwesomeIcons.umbrellaBeach,
          ),
          Option(
            "Cities",
            FontAwesomeIcons.city,
          ),
          Option(
            "Islands",
            FontAwesomeIcons.earthOceania,
          ),
        ],
      ),
      Question(
        "Preferable travel area type?",
        [
          Option(
            "Rural",
            FontAwesomeIcons.mountainSun,
          ),
          Option(
            "Urban",
            FontAwesomeIcons.city,
          ),
        ],
      ),
      Question(
        "Like travelling to new places?",
        [
          Option(
            "Yes",
            FontAwesomeIcons.check,
          ),
          Option(
            "No",
            FontAwesomeIcons.xmark,
          ),
        ],
      ),
    ];
  }
}

class Question extends ChangeNotifier {
  late final String _question;
  late final List<Option> _options;
  Question(String question, List<Option> options) {
    _question = question;
    _options = options;
  }

  String get question => _question;
  List<Option> get options => _options;

  void selectOption(int index) {
    for (Option i in _options) {
      i.selected = false;
    }
    _options[index].selected = true;
    notifyListeners();
  }
}

class Option extends ChangeNotifier {
  late final String _option;
  late final IconData _icon;
  late bool _selected;

  Option(String option, IconData icon, [bool? selected]) {
    _option = option;
    _icon = icon;
    _selected = selected ?? false;
  }

  String get option => _option;
  IconData get icon => _icon;
  bool get selected => _selected;

  set selected(bool selected) {
    _selected = selected;
    notifyListeners();
  }
}
