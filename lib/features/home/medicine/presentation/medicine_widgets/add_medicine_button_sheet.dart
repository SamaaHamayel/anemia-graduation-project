// ignore_for_file: must_be_immutable

import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMedicineButtonSheet extends StatelessWidget {
   AddMedicineButtonSheet({super.key});

  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  "Add New Task",
                  style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blue.shade400),
                )),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.toString().length < 4) {
                  return 'please enter title at least 4 char';
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text('Task Title'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                label: Text('Task Description'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                width: double.infinity,
                child: Text(
                  'Select Date',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            InkWell(
              onTap: () {
                chooseDateTime(context);
              },
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    selectedDate.toString().substring(0, 10),
                    style: GoogleFonts.quicksand(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  void chooseDateTime(context) async {
    DateTime? chooseDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (chooseDate != null) {
      selectedDate = chooseDate;
      //setState(() {});
    }
  }
}
