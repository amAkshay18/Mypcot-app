import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mypcot/core/utilities/constants/app_colors.dart';
import 'package:mypcot/features/home/presentation/view/bottom_nav_bar.dart';
import 'package:mypcot/features/home/presentation/view/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTimeline = 'Today';
  int _selectedIndex = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: SvgPicture.asset(
              "assets/icons/Group 919.svg",
              width: 15,
              height: 15,
            ),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Group 921.svg",
                width: 30,
                height: 30,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    "assets/icons/Group 917.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -.5,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: SvgPicture.asset(
          //       "assets/icons/Group 917.svg",
          //       width: 20,
          //       height: 20,
          //     ),
          //   ),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SvgPicture.asset(
                "assets/icons/Group 917.svg",
                width: 20,
                height: 20,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, Mypcot !!',
                        style: TextStyle(
                          fontSize: 21,
                          color: AppColors.fontColor,
                        ),
                      ),
                      Text(
                        ' here is your dashboard....',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/icons/Group 922.svg",
                    width: 44,
                    height: 44,
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildCustomCard(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('MMMM, dd yyyy').format(selectedDate),
                          style: TextStyle(
                              fontSize: 11, color: AppColors.fontColor),
                        ),
                        Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 18, color: AppColors.fontColor),
                        )
                      ]),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedTimeline,
                            items: <String>[
                              'TIMELINE',
                              'Today',
                              'Yesterday',
                              'This Week',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.fontColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedTimeline = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/Group 911.svg",
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () => _selectDate(context),
                        ),
                        Text(
                          DateFormat('MMM, yyyy').format(selectedDate),
                          style: TextStyle(
                              fontSize: 11, color: AppColors.fontColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 7; i++)
                    _buildDayOfWeek(selectedDate
                        .add(Duration(days: i - selectedDate.weekday + 1))),
                ],
              ),
              SizedBox(height: 20),
              Container(
                // width: 328,
                height: 140,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New order created',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('New Order created with Order'),
                        SizedBox(height: 15),
                        Text(
                          '09:00 AM',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.orange,
                          ),
                        ),
                        SizedBox(height: 5),
                        Icon(Icons.arrow_forward,
                            size: 12, color: AppColors.orange),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: AppColors.orange,
                        child: SvgPicture.asset(
                          "assets/icons/Group 900.svg",
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: onItemTapped,
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 8,
      //   child: SizedBox(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         _buildNavItem("assets/icons/Group 910.svg", 'Home', 0),
      //         _buildNavItem("assets/icons/Group 912.svg", 'Customers', 1),
      //         const SizedBox(width: 40), // Space for FAB
      //         _buildNavItem("assets/icons/Group 913.svg", 'Khata', 2),
      //         _buildNavItem("assets/icons/Group 914.svg", 'Orders', 3),
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.darkBlue,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildDayOfWeek(DateTime date) {
    bool isToday = DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Column(
      children: [
        Text(
          DateFormat('E\nd').format(date),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.fontColor,
          ),
        ),
        if (isToday)
          Container(
            width: 5,
            height: 5,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
      ],
    );
  }

  // Widget buildNavItem(String assetPath, String label, int index) {
  //   final bool isSelected = _selectedIndex == index;
  //   return Expanded(
  //     child: InkWell(
  //       onTap: () {
  //         setState(() {
  //           _selectedIndex = index;
  //         });
  //       },
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SvgPicture.asset(
  //             assetPath,
  //             width: 24,
  //             height: 24,
  //             colorFilter: ColorFilter.mode(
  //               isSelected
  //                   ? AppColors.fontColor
  //                   : AppColors.fontColor.withOpacity(0.5),
  //               BlendMode.srcIn,
  //             ),
  //           ),
  //           Text(
  //             label,
  //             style: TextStyle(
  //               color: isSelected
  //                   ? AppColors.fontColor
  //                   : AppColors.fontColor.withOpacity(0.5),
  //               fontSize: 12,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
