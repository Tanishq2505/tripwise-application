import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_wise/models/new_user_question.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuestions extends StatefulWidget {
  const StartQuestions({Key? key}) : super(key: key);

  @override
  State<StartQuestions> createState() => _StartQuestionsState();
}

class _StartQuestionsState extends State<StartQuestions> {
  PageController controller = PageController();
  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    List<Question> questionList =
        Provider.of<QuestionList>(context).questionList;
    var size = MediaQuery.of(context).size;
    print(questionList[0].options[0].selected);
    void goNextPage() {
      if (controller.page != questionList.length - 1) {
        controller.nextPage(
          duration: Duration(
            milliseconds: 500,
          ),
          curve: Curves.decelerate,
        );
      }
    }

    Widget buildPage(Question question, Size size) {
      return Center(
        child: SizedBox(
          height: size.height,
          width: size.width - 40,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    question.question,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: size.width * 0.1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: question.options[index].selected
                            ? Colors.black
                            : const Color(0xfffffbfe),
                        foregroundColor: !question.options[index].selected
                            ? Colors.black
                            : const Color(0xfffffbfe),
                      ),
                      onPressed: () {
                        question.selectOption(index);
                        setState(() {});
                        goNextPage();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            const Spacer(),
                            Text(
                              question.options[index].option,
                              style: GoogleFonts.nunito(
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              question.options[index].icon,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: question.options.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: size.height * 0.025,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    List<Widget> list =
        (questionList.map((question) => buildPage(question, size))).toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        onPressed: goNextPage,
        child: Icon(
          Icons.arrow_right,
          color: const Color(0xfffffbfe),
          size: size.width * 0.12,
        ),
      ),
      body: PageView(
        allowImplicitScrolling: false,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (ind) {
          setState(() {
            _curr = ind;
          });
        },
        children: list,
      ),
    );
  }
}
