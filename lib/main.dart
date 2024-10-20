import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


// Main Application Entry
void main() {
  runApp(DashboardApp());
}

// Global Theme Configuration
class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        cardTheme: CardTheme(
          color: Colors.white,
          margin: EdgeInsets.all(8),
          elevation: 4,
        ),
      ),
      home: DashboardScreen(),
    );
  }
}

// Dashboard Screen Layout
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: DashboardDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Project Section
              TopProjectCard(),

              SizedBox(height: 5),

              // All Projects List Section
              ProjectListCard(),

              SizedBox(height: 5),

              // Top Creators Section
              TopCreatorsCard(),

              SizedBox(height: 5),

              // Performance Graph Section
              PerformanceGraphCard(),

              SizedBox(height: 5),

              // Special Events (Birthday/Anniversary) Section
              SpecialEventsCard(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF2B184D),
      title: Text('Dashboard', style: TextStyle(color: Colors.white),),
      iconTheme: IconThemeData(
        color: Colors.white, // Set menu toggle (hamburger) icon color to white
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.grey[400]),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: Colors.grey[400],),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/office.jpg"),
          ),
        ),
      ],
    );
  }
}

// Drawer Component
class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Pooja Mishra"),
            accountEmail: Text("Admin"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/office.jpg"),
            ),
            decoration: BoxDecoration(color: Color(0xFF2B184D)),
          ),
          _drawerItem(Icons.home, 'Home'),
          _drawerItem(Icons.people, 'Employees'),
          _drawerItem(Icons.check_circle, 'Attendance'),
          _drawerItem(Icons.pie_chart, 'Summary'),
          _drawerItem(Icons.settings, 'Settings'),
          _drawerItem(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Navigation logic or functionality
      },
    );
  }
}

class TopProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      height: 200, // Increase the height as per your requirement
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'), // Path to the image in assets
          fit: BoxFit.cover, // Cover the entire container
        ),
        borderRadius: BorderRadius.circular(12), // Rounded edges for the container
      ),
      child: Card(
        color: Colors.transparent, // Make the card background transparent
        elevation: 4, // Keep the card elevation for shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Same curved edges as container
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, // Vertically center the text
            children: [
              Text(
                'Top Rating Project',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Trending project with high rating',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Learn More'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B184D),
                  foregroundColor: Colors.white,// Button text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// All Projects List Card with Elevated Sub-Widgets
class ProjectListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<String> images = [
      'assets/images/project1.png',
      'assets/images/project1.png',
      'assets/images/project3.jpg',
    ];

    return Card(
      color: Color(0xFF2B184D),
      elevation: 4, // Elevation for the parent card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Curved edges for the parent card
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the overall layout
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Projects',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, color: Colors.white
              ),
            ),
            SizedBox(height: 16),
            // List of projects as sub-widgets with elevation
            Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    width: double.infinity, // Makes the sub-widget occupy full width
                    child: Card(
                      color: Colors.purple[900],
                      elevation: 3, // Elevation for sub-widgets (projects)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Curved edges for the sub-widgets
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            images[index], // Path to your image
                            width: 40, // Similar size to an icon
                            height: 40, // Similar size to an icon
                            fit: BoxFit.cover, // Ensures the image covers the container
                          ),
                        ),
                        title: Text('Technology Blockchain', style: TextStyle(color: Colors.white),),
                        subtitle: Text('Project ${index + 1} · See project details', style: TextStyle(color: Colors.grey[400]),),
                        trailing: Icon(Icons.edit, color: Colors.white), // Edit icon
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// Top Creators Card
class TopCreatorsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Set to 90% of screen width
      child: Card(
        color: Color(0xFF2B184D),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding for overall layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Creators',
                style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16),
              // Subheadings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400], fontSize: 15)),
                        SizedBox(height: 8), // Space between heading and content
                        ...List.generate(3, (index) {
                          return Text('@creator_$index', style: TextStyle(color: Colors.white,),);
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Art Works', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400], fontSize: 15)),
                        SizedBox(height: 8), // Space between heading and content
                        ...List.generate(3, (index) {
                          return Text('Project ${index + 1}', style: TextStyle(color: Colors.white),);
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Rating', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[400], fontSize: 15)),
                        SizedBox(height: 8), // Space between heading and content
                        ...List.generate(3, (index) {
                          return Text('9.${index * 2}', style: TextStyle(color: Colors.white),);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Performance Graph Card
class PerformanceGraphCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Overall Performance', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 300, // Fixed height for the graph
            padding: const EdgeInsets.all(16.0), // Padding around the chart
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true), // Display grid lines
                titlesData: FlTitlesData(show: true), // Display titles on axis
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 1), // Data points (x, y)
                      FlSpot(1, 1.5),
                      FlSpot(2, 1.4),
                      FlSpot(3, 3.4),
                      FlSpot(4, 2),
                      FlSpot(5, 2.2),
                      FlSpot(6, 1.8),
                    ],
                    isCurved: true, // Make the line curved
                    color: Color(0xFF2B184D), // Line color
                    barWidth: 3, // Width of the line
                    belowBarData: BarAreaData(
                      show: true, // Show shaded area below the graph line
                      color: Colors.purple.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SpecialEventsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventCard(
          title: 'Today Birthday',
          count: 2,
          peopleImages: [
            'assets/images/birthday1.jpg', // Image for person 1
            'assets/images/birthday2.png',  // Image for person 2
          ], // Pass the images for people having birthdays
        ),
        SizedBox(height: 16), // Space between cards
        EventCard(
          title: 'Anniversary',
          count: 3,
          peopleImages: [
            'assets/images/anniversary1.jpg',
            'assets/images/anniversary2.jpg',
            'assets/images/birthday3.jpg',
          ], // Images for people having anniversaries
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final int count;
  final List<String> peopleImages; // List of image paths for the people

  EventCard({required this.title, required this.count, required this.peopleImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Full width for mobile screens
      decoration: BoxDecoration(
        color: Color(0xFF2B184D), // Dark blue background color
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Inner padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title and emojis/icons row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.stars, color: Colors.amber, size: 24),
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.stars, color: Colors.amber, size: 24),
              ],
            ),
            SizedBox(height: 16),

            // Avatars (using people's images)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: peopleImages.map((imagePath) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 20,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Total Count Display
            Text(
              'Total: $count',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),

            // Button for Wishing
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              icon: Icon(Icons.send, color: Colors.white),
              label: Text(
                '$title Wishing',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
