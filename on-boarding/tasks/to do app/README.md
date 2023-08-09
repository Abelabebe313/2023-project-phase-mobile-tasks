# to_do_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
![Screenshot (190)](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/2600eeae-457d-47f1-9d5e-ee6264eca733)
![Taskdetail](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/91ab941b-39cf-4f3b-83df-379ce925b829)
![Screenshot (191)](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/8abb4a7d-5c0e-4c16-b7da-e90763eee8f8)
![create task](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/cf7b4e19-e6c6-4110-802b-fae37069cc98)

![test widget](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/bfa1feb3-f4af-4ffb-a846-fc97b9cf1fd6)

# Day 7: Task 1
- Set Due Date Feature
  ![Screenshot (197)](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/da10e965-b00a-43e5-9130-15ddca82f48c)

                    IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: HexColor('#EE6F57'),
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
  
   void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
- Mark Task as Completed Feature:
- Clean Architecture:
