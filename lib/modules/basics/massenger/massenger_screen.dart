import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais'),
            radius: 25.0,
                          ),
            SizedBox(
              width: 15.0,
            ),
            Text(
                'Chats',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
          ),
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
          
                child: Row(
                  children: [
                    Icon(
                        Icons.search
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 15.0
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index)=> buildStoryItem(),
                  itemCount: 7,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15.0,
                  ),
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index)=> SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 15),
            ],
          ),
        ),
      ),

    );
  }


//  1. build item
// 2. build list
// 3. add item to list

  Widget buildChatItem() =>Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais'),
            radius: 25.0,
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 6.0,
              backgroundColor: Colors.greenAccent,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed Gamal',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello there! whats up?! Hello there! whats up?!Hello there! whats up?!Hello there! whats up?!Hello there! whats up?!Hello there! whats up?!',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 2.5,
                  ),
                ),
                Text(
                  '08.00 pm',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    ],
  );

  Widget buildStoryItem() => Container(
    width: 50.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais'),
              radius: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.greenAccent,
              ),
            ),
          ],
        ),
        Text(
          'Ahmed Gamal Saad',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}
