import 'package:flutter/material.dart';
import 'package:eco_tour_indonesia/widgets/custom_grid_title.dart';

class MountainGuidePage extends StatefulWidget {
  @override
  _MountainGuidePageState createState() => _MountainGuidePageState();
}

class _MountainGuidePageState extends State<MountainGuidePage> {
  int _currentStep = 0;

  final List<String> _guideSteps = [
    'Step 1: Preparation\nPrepare all the necessary gear for the hike. Make sure to have enough water, food, and a first-aid kit.',
    'Step 2: Starting Point\nStart your hike from the designated trailhead. Follow the marked trail signs.',
    'Step 3: Midway Point\nTake a rest and hydrate yourself. Enjoy the scenery and take some pictures.',
    'Step 4: Summit\nYou have reached the summit! Take some time to enjoy the view and rest before descending.',
  ];

  void _nextStep() {
    if (_currentStep < _guideSteps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Navigate to AR page
      Navigator.pushNamed(context, '/ar_tour_page');
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jay, from now we going to guide you\nGo to any mountain, just follow our guide',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Center(
              child: CustomGridTile(
                imageUrl: 'assets/images/mountain_content.jpg',
                title: '',
                onTap: () {},
                width: 550,
                height: 250,
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 1, color: Colors.grey.shade300),
            SizedBox(height: 16),
            Text(
              _guideSteps[_currentStep],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentStep == 0
                        ? Colors.grey
                        : Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Prev',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
                ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                      _currentStep == _guideSteps.length - 1
                          ? 'AR Tour'
                          : 'Next',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Better experience\nwith AR Tour',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {
                      Navigator.pushNamed(context, '/ar_tour_page.dart');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
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
}
