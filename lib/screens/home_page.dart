import 'package:flutter/material.dart';
import 'package:eco_tour_indonesia/widgets/custom_grid_title.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'hello, ',
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: 'jay',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Icon(Icons.notifications, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'featured',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '3 Enrolled featured',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomGridTile(
                    imageUrl: 'assets/images/artour.jpg',
                    title: 'AR Tour',
                    onTap: () {
                      showCameraPermissionDialog(context);
                    },
                    width: 180,
                    height: 80,
                  ),
                  SizedBox(width: 8),
                  CustomGridTile(
                    imageUrl: 'assets/images/eco_tour.jpg',
                    title: 'ECO Tour',
                    onTap: () {
                      Navigator.pushNamed(context, '/eco_tracker_page.dart');
                    },
                    width: 180,
                    height: 80,
                  ),
                  SizedBox(width: 8),
                  CustomGridTile(
                    imageUrl: 'assets/images/community.jpg',
                    title: 'Guide',
                    onTap: () {
                      Navigator.pushNamed(context, '/interactiveGuide');
                    },
                    width: 180,
                    height: 80,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Most Popular',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '4 Destination on this week, hit the most coolest place',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                CustomGridTile(
                  imageUrl: 'assets/images/bali.jpg',
                  title: 'Bali',
                  onTap: () {
                    // Handle tap
                  },
                  width: 189,
                  height: 100,
                ),
                CustomGridTile(
                  imageUrl: 'assets/images/lombok.jpg',
                  title: 'Lombok',
                  onTap: () {
                    // Handle tap
                  },
                  width: 189,
                  height: 100,
                ),
                CustomGridTile(
                  imageUrl: 'assets/images/yogyakarta.jpg',
                  title: 'Yogyakarta',
                  onTap: () {
                    // Handle tap
                  },
                  width: 189,
                  height: 100,
                ),
                CustomGridTile(
                  imageUrl: 'assets/images/jakarta.jpg',
                  title: 'Jakarta',
                  onTap: () {
                    // Handle tap
                  },
                  width: 189,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/profile_page.dart');
          }
        },
      ),
    );
  }

  void showCameraPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Open Camera"),
          content: Text("This app needs access to your camera to proceed."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ar_tour_page.dart');
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
