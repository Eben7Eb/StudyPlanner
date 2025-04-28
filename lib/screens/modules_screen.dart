import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  // Remove const from the constructor
  ModulesScreen({Key? key}) : super(key: key);

  final List<Course> courses = [
    Course(
      code: 'SCS2203',
      name: 'Advanced Mathematical Structures for Computing',
    ),
    Course(code: 'SCS2209', name: 'Computational Modelling'),
    Course(code: 'SCS2210', name: 'Mobile Application Development'),
    Course(code: 'SCS2211', name: 'Software Project Management'),
    Course(code: 'SCS2212', name: 'Design and Analysis of Algorithms'),
    Course(code: 'SCS2214', name: 'Group Project'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currently Registered Courses'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(courses[index].name),
                subtitle: Text(courses[index].code),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Handle course button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                CourseDetailScreen(course: courses[index]),
                      ),
                    );
                  },
                  child: Text('View Details'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Course {
  final String code;
  final String name;

  Course({required this.code, required this.name});
}

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.name), backgroundColor: Colors.blue),
      body: Center(
        child: Text(
          'Details for ${course.name} (${course.code})',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
