import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

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
              TopProjectCard(),
              SizedBox(height: 5),
              ProjectListCard(),
              SizedBox(height: 5),
              TopCreatorsCard(),
              SizedBox(height: 5),
              PerformanceGraphCard(),
              SizedBox(height: 5),
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
      title: Text(
        'Dashboard',
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.grey[400]),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: Colors.grey[400]),
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
      onTap: () {},
    );
  }
}

class TopProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Projects',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.purple[900],
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            images[index],
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          'Technology Blockchain',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Project ${index + 1} · See project details',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        trailing: Icon(Icons.edit, color: Colors.white),
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

class TopCreatorsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Color(0xFF2B184D),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Creators',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                                fontSize: 15)),
                        SizedBox(height: 8),
                        ...List.generate(3, (index) {
                          return Text(
                            '@creator_$index',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Art Works',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                                fontSize: 15)),
                        SizedBox(height: 8),
                        ...List.generate(3, (index) {
                          return Text(
                            'Project ${index + 1}',
                            style: TextStyle(color: Colors.white),
                          );
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Rating',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                                fontSize: 15)),
                        SizedBox(height: 8),
                        ...List.generate(3, (index) {
                          return Text(
                            '9.${index * 2}',
                            style: TextStyle(color: Colors.white),
                          );
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

class PerformanceGraphCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Overall Performance',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(1, 1.5),
                      FlSpot(2, 1.4),
                      FlSpot(3, 3.4),
                      FlSpot(4, 2),
                      FlSpot(5, 2.2),
                      FlSpot(6, 1.8),
                    ],
                    isCurved: true,
                    color: Colors.deepPurple,
                    barWidth: 4,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.deepPurple.withOpacity(0.3),
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

class SpecialEventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Special Events'),
          backgroundColor: Color(0xFF2B184D),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SpecialEventsCard(),
        ),
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
            'assets/images/birthday1.jpg',
            'assets/images/birthday2.png',
          ],
        ),
        SizedBox(height: 16),
        EventCard(
          title: 'Anniversary',
          count: 3,
          peopleImages: [
            'assets/images/anniversary1.jpg',
            'assets/images/anniversary2.jpg',
            'assets/images/birthday3.jpg',
          ],
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final int count;
  final List<String> peopleImages;

  EventCard({
    required this.title,
    required this.count,
    required this.peopleImages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFF2B184D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            Text(
              'Total: $count',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
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
