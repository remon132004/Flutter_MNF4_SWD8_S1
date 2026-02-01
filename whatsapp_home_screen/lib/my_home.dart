import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.camera_alt_outlined, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.search_outlined, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customText(icon: Icons.lock, text: "Locked", count: 2),
              customText(icon: Icons.archive_outlined, text: "Archived"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return customChat(
                    name: names[index],
                    message: "message",
                    time: times[index],
                    url:imageUrls[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customText({int? count, required IconData icon, required String text}) {
  return Row(
    children: [
      Icon(icon, color: Colors.green, size: 25),
      SizedBox(width: 15),
      Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      Spacer(),
      if (count != null) Text("$count", style: TextStyle(color: Colors.green)),
    ],
  );
}

customChat({
  required String name,
  required String message,
  required String time,
  required String url,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage(url)),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(message),
          ],
        ),
        Spacer(),
        Text(time),
      ],
    ),
  );
}

List<String> names = [
  "Messi",
  "Luna",
  "Milo",
  "Oliver",
  "Bella",
  "Leo",
  "Nala",
  "Simba",
  "Coco",
  "Max",
  "Lily",
  "Charlie",
  "Daisy",
  "Rocky",
  "Misty",
  "Shadow",
];
List<String> imageUrls = [
  
  "https://i.pinimg.com/736x/dd/a1/5d/dda15dc41be4d3ade36d1dfb50e9333a.jpg"
  "https://i.pinimg.com/736x/0b/97/6f/0b976f0a7aa1aa43870e1812eee5a55d.jpg",
  "https://i.pinimg.com/736x/fa/0c/12/fa0c12e9aa0e5f6124e10c9dec188ded.jpg",
  "https://i.pinimg.com/736x/4f/a7/57/4fa757cddb577ce8245fd121cd7d1e37.jpg",
  "https://i.pinimg.com/736x/4a/9e/05/4a9e0546879447531b4674c63cad8b75.jpg",
  "https://i.pinimg.com/736x/70/98/91/709891f06ecfe7260fbcc88787cf59ce.jpg",
  "https://i.pinimg.com/736x/c7/60/ca/c760ca532d5ef53eaef78f403123b901.jpg",
  "https://i.pinimg.com/736x/c5/59/cf/c559cf3859ef3becd627f60b7f187ff0.jpg",
  "https://i.pinimg.com/736x/75/bc/24/75bc242ba089ce055849c7ec8be91772.jpg",
  "https://i.pinimg.com/736x/52/18/e9/5218e9a1fe3cf5c3672bd3f78601cd8b.jpg",
  "https://i.pinimg.com/736x/1b/54/a5/1b54a5fb9e5717ef1081009f92c978a1.jpg",
];
List<String> times = [
  "08:15 AM",
  "09:30 AM",
  "10:00 AM",
  "11:45 AM",
  "12:20 PM",
  "01:05 PM",
  "02:40 PM",
  "03:10 PM",
  "04:55 PM",
  "05:30 PM",
  "06:00 PM",
  "07:25 PM",
  "08:10 PM",
  "09:45 PM",
  "10:00 PM",
];