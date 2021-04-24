import 'package:collage_app/models/task_model.dart';
import 'package:collage_app/provider/task_provider.dart';
import 'package:collage_app/theme/color.dart';
import 'package:collage_app/views/home_Screen.dart';
import 'package:collage_app/widgets/back_button.dart';
import 'package:collage_app/widgets/my_text_field.dart';
import 'package:collage_app/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:collage_app/controllers/task_controllers.dart';

//TODO:Check why date is null when send it to firestore

class AddScreen extends StatefulWidget {
  final Task task;

  const AddScreen({Key key, this.task}) : super(key: key);
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    DateTime now = new DateTime.now();
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );

    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    //It gave me an error bc the provider was dynamic. I Changed it to Type(TaskProvider)

    @override
    void dispose() {
      titleController.dispose();
      dateController.dispose();
      startTimeController.dispose();
      endTimeController.dispose();
      descriptionController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new task',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.black87),
                        minLines: 1,
                        maxLines: 1,
                        decoration: InputDecoration(
                            labelText: "title",
                            labelStyle: TextStyle(color: Colors.black45),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                        controller: titleController,
                        onChanged: (value) {
                          taskProvider.changeTitle(value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "all fields are required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime:
                                      DateTime(now.year, now.month, now.day),
                                  onChanged: (value) {
                                taskProvider.changeDate(value);
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.ar);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.kGreen,
                              ),
                              child: Icon(
                                Icons.calendar_today,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            "Date",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2018, 3, 5),
                                    maxTime: DateTime(
                                        now.year + 20,
                                        now.month + 200,
                                        now.day + 200), onChanged: (value) {
                                  taskProvider.changeStartTime(value);
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.ar);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColors.kGreen,
                                ),
                                child: Icon(
                                  Icons.calendar_today,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              )),
                          Text(
                            "Start time",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(width: 190),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(2018, 3, 5),
                                          maxTime: DateTime(now.year + 20,
                                              now.month + 200, now.day + 200),
                                          onChanged: (value) {
                                        taskProvider.changeEndTime(value);
                                      }, onConfirm: (date) {
                                        print('confirm $date');
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.ar);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.kGreen,
                                      ),
                                      child: Icon(
                                        Icons.calendar_today,
                                        size: 20.0,
                                        color: Colors.white,
                                      ),
                                    )),
                                Text(
                                  "End time",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.black87),
                    minLines: 1,
                    maxLines: 1,
                    controller: descriptionController,
                    onChanged: (value) {
                      taskProvider.changeDescription(value);
                    },
                    decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: TextStyle(color: Colors.black45),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                taskProvider.saveTask(); //miss spelldd this as well
              },
              child: Container(
                height: 80,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: CustomColors.PrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
