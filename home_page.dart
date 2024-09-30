import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  final String userName;

  // Accept userName in the constructor
  HomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi: $userName'),  // Display the user's name
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.person),  // Profile icon
            onPressed: () {
              // Navigate to ProfilePage when clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),  // Navigate to ProfilePage
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Upcoming Schedule Section
              Text(
                'Upcoming Schedule',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              UpcomingScheduleCard(
                doctorName: 'Dr. Rashmika Sharma',
                specialty: 'Psychiatrist',
                dateTime: 'Jan 28, 12:25 am',
              ),
              UpcomingScheduleCard(
                doctorName: 'Dr. Mayank Prakash',
                specialty: 'Gynecologist',
                dateTime: 'Jan 18, 12:00 pm',
              ),
              SizedBox(height: 20),
              // Categories Section
              Text(
                'Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CategoriesGrid(),
              SizedBox(height: 20),
              // Top Doctors Section
              Text(
                'Top Doctors',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TopDoctorCard(
                  doctorName: 'Dr. Rahul Sharma',
                  specialty: 'Dental',
                  ratings: 585),
              TopDoctorCard(
                  doctorName: 'Dr. Monika Goyal',
                  specialty: 'Surgeon',
                  ratings: 698),
            ],
          ),
        ),
      ),
    );
  }
}

class UpcomingScheduleCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String dateTime;

  UpcomingScheduleCard(
      {required this.doctorName, required this.specialty, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorName,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(specialty),
                Text(dateTime, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        CategoryCard(title: 'Specialists'),
        CategoryCard(title: 'Quick Test'),
        CategoryCard(title: 'Neurologist'),
        CategoryCard(title: 'Cardiology'),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;

  CategoryCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final int ratings;

  TopDoctorCard(
      {required this.doctorName, required this.specialty, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctorName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(specialty),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(' $ratings'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
