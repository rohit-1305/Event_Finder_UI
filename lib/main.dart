import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventFinder(),
    );
  }
}

class EventFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0XFF263A6F),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: EventBody(),
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}

class EventBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Discover the most",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0XFF263A6F),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Amazing Event",
                    style: TextStyle(
                      fontSize: 33.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF263A6F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SearchBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Events(
                title: "Foods",
                icon: Icons.restaurant_menu,
                cardcolor: Color(0XFFfff8e5),
                iconcolor: Color(0XFFffba0a),
              ),
              Events(
                title: "Music",
                icon: Icons.mic,
                cardcolor: Color(0XFFedf1ff),
                iconcolor: Color(0XFF4c6fff),
              ),
              Events(
                title: "Charity",
                icon: Icons.favorite,
                cardcolor: Color(0XFFfeeded),
                iconcolor: Color(0XFFf95050),
              ),
              Events(
                title: "Sports",
                icon: Icons.directions_run,
                cardcolor: Color(0XFFe5f8ee),
                iconcolor: Color(0XFF00b655),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Event",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0XFF263A6F),
                  ),
                ),
                Text(
                  "See More",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Color(0XFF4c6fff),
                  ),
                ),
              ],
            ),
          ),
          ListEvents(
            date: "18 Oct 2020",
            event: "Balloon Fest",
            distance: "New York - 3.4 miles away",
            image: 'assets/images/baloon.PNG',
          ),
          ListEvents(
            date: "20 Oct 2020",
            event: "Fishing Fest",
            distance: "Florida - 5 miles away",
            image: 'assets/images/man.PNG',
          ),
          BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: Color(0XFF4c6fff),
            iconSize: 30,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_num),
                label: 'Ticket',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ListEvents extends StatelessWidget {
  final String date;
  final String event;
  final String distance;
  final String image;
  const ListEvents({
    Key key,
    this.date,
    this.event,
    this.distance,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 35),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 80,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Color(0XFF939db8)),
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF939db8)),
                      ),
                    ],
                  ),
                  Text(
                    event,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF263A6F)),
                  ),
                  Text(
                    distance,
                    style: TextStyle(fontSize: 15, color: Color(0XFF939db8)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Events extends StatelessWidget {
  final String title;
  final Color iconcolor;
  final Color cardcolor;
  final IconData icon;
  const Events({
    @required this.title,
    @required this.iconcolor,
    @required this.cardcolor,
    @required this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: cardcolor,
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  color: iconcolor,
                  size: 40,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0XFF939db8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: TextField(
          decoration: InputDecoration(
            fillColor: Color(0XFFf2f5ff),
            hintText: "Search events",
            hintStyle: TextStyle(
              color: Color(0xff8a95b6),
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0XFF6b7aa0),
              size: 35,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
