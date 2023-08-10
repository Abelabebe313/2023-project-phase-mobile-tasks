# TO DO APP

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

## Day 8: Task 1
- Task 1: Project Setup

   ![Screenshot (200)](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/abee7a77-5f9e-4d18-9aa5-506c09cc95c8)

  
- Task 2: Implement Models
  Define Task model
  
      class TaskModel extends MyTask {
      const TaskModel({
        required String id,
        required String name,
        required DateTime dueDate,
        required String description,
        bool isCompleted = false,
      }) : super(
        id: id,
        name: name,
        dueDate: dueDate,
        description: description,
        isCompleted: completed,
      );

  From JSON
  
      factory TaskModel.fromJson(Map<String, dynamic> json) {
        return TaskModel(
          id: json['id'],
          name: json['name'],
          dueDate: DateTime.parse(json['dueDate']),
          description: json['description'],
          isCompleted: json['isCompleted'],
        );
      }

To JSON

      Map<String, dynamic> toJson() {
        return {
          'id': id,
          'name': name,
          'dueDate': dueDate.toIso8601String(),
          'description': description,
          'isCompleted': isCompleted,
        };
      }
    }

- Task 3: Documentation
    I wrote documentation in clear and comprehensive way


## Day 7: Task 1
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
  ![Screenshot (198)](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/894709b5-b36f-4f42-b482-9c9cbf698364)

                  Checkbox(
                      value: task['isCompleted'],
                      onChanged: (bool? value) {
                        setState(() {
                          task['isCompleted'] = value ?? false;
                        });
                      },
                    ),
  
- Clean Architecture:
  ![Screenshot (199)](https://github.com/Abelabebe313/2023-project-phase-mobile-tasks/assets/88794322/6d98a72f-ab17-49db-b399-861b293e06dd)
  
- Error Handling and Either Type:

       class TaskRepositoryImpl implements TaskRepository {
            @override
            Future<Either<Failure, List<Task>>> getTasks() async {
              try {
                // TODO: Implement data retrieval logic from local storage
                // For example, fetch tasks from a database or a file
                List<Task> tasks = []; // Replace with actual data retrieval
                  return Right(tasks);
                } catch (e) {
                  return Left(DataRetrievalFailure());
                }
              }
        
          @override
          Future<Either<Failure, void>> addTask(Task task) async {
            try {
              // TODO: Implement data addition logic to local storage
              // For example, save task to a database or a file
              // Replace the following line with actual data addition logic
              return Right(null);
            } catch (e) {
              return Left(DataModificationFailure()); // Handle data addition error
            }
          }
        
          @override
          Future<Either<Failure, void>> updateTask(Task task) async {
            try {
              // TODO: Implement data update logic in local storage
              // For example, update task in a database or a file
              // Replace the following line with actual data update logic
              return Right(null);
            } catch (e) {
              return Left(DataModificationFailure()); //
            }
          }
        
          @override
          Future<Either<Failure, void>> completeTask(String taskId) async {
            try {
              // TODO: Implement task completion logic in local storage
              // For example, mark task as completed in a database or a file
              // Replace the following line with actual task completion logic
              return Right(null);
            } catch (e) {
              return Left(DataModificationFailure());
            }
          }
        }
## Day 7: Task 2
  - Entities
        
          class Task extends Equatable {
            final String id;
            final String name;
            final DateTime dueDate;
            final String description;
            final bool isCompleted;
            
          const Task({
            required this.id,
            required this.name,
            required this.dueDate,
            required this.description,
            this.isCompleted = false,
          });
        
          factory Task.completed({
            required String id,
            required String name,
            required DateTime dueDate,
            required String description,
          }) {
            return Task(
              id: id,
              name: name,
              dueDate: dueDate,
              description: description,
              isCompleted: true,
            );
          }
        
          @override
          List<Object?> get props =>
              [id, name, dueDate, description, isCompleted];
        }

  - View All UseCases
      to_do_app\lib\features\TODO app\domain\usecases\view_all_task.dart
    
        class ViewAllTasks implements UseCase<List<MyTask>, NoParams> {
          final TaskRepository repository;
          
          ViewAllTasks(this.repository);
        
          @override
          Future<Either<Failure, List<MyTask>>> call(NoParams params) async {
            return await repository.getTasks();
          }
        }
        
        class NoParams extends Equatable {
          @override
          List<Object> get props => [];
        }
  - View specific Task use case
        to_do_app\lib\features\TODO app\domain\usecases\view_one_task.dart

        class ViewOneTask implements UseCase<MyTask, String> {
          final TaskRepository repository;
        
          ViewOneTask(this.repository);
        
          @override
          Future<Either<Failure, MyTask>> call(String taskId) async {
            return await repository.getOneTask(taskId);
          }
        }
  - Create new Task use case
       to_do_app\lib\features\TODO app\domain\usecases\create_task.dart
    
        class CreateTask implements UseCase<void, MyTask> {
          final TaskRepository repository;
        
          CreateTask(this.repository);
        
          @override
          Future<Either<Failure, void>> call(MyTask task) async {
            return await repository.addTask(task);
          }
        }


  
