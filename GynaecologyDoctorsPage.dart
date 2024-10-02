import 'package:flutter/material.dart';

class GynaecologyDoctorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gynaecology Doctors'),
      ),
      body: Center(
        child: Text('List of Gynaecology Doctors'),
      ),
    );
  }
}

class PathologyDoctorsPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Ananya Patel",
      specialty: "Gynaecology",
      address: "1234 Health Street, Ahmedabad, Gujarat",
      rating: 4.5,
      reviews: [
        "Dr. Ananya is very knowledgeable and attentive. Highly recommend!",
      ],
    ),
    Doctor(
      name: "Dr. raj patel",
      specialty: "Clinical Gynaecology",
      address: "5678 Wellness Road, Surat, Gujarat",
      rating: 4.8,
      reviews: [
        "The best experience I've had with a doctor.",
      ],
    ),
    Doctor(
      name: "Dr. manali patel",
      specialty: "Gynaecology",
      address: "9101 Cure Lane, Vadodara, Gujarat",
      rating: 4.7,
      reviews: [
        "She took the time to answer all my questions.",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gynaecology Doctors'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index]);
        },
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String address;
  final double rating;
  final List<String> reviews;

  Doctor({
    required this.name,
    required this.specialty,
    required this.address,
    required this.rating,
    required this.reviews,
  });
}

class DoctorCard extends StatefulWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true; // Change to true when mouse enters
      }),
      onExit: (_) => setState(() {
        _isHovered = false; // Change to false when mouse exits
      }),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5), // Glowing effect color
                    spreadRadius: 3,
                    blurRadius: 15,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doctor.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              Text(
                widget.doctor.specialty,
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
              SizedBox(height: 8.0),
              Text(
                "Address: ${widget.doctor.address}",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    "Rating: ${widget.doctor.rating} ⭐",
                    style: TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.orange),
                ],
              ),
              SizedBox(height: 8.0),
              Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...widget.doctor.reviews.map((review) => Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text("• $review", style: TextStyle(color: Colors.black87)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
