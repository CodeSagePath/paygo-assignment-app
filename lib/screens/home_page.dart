import 'package:flutter/material.dart';
import '../widgets/grid_view_static_icons.dart';
import 'package:paygo_app/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    super.initState();
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.purpleBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Hello, karthik!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "What would you like",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: AppColors.purple),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "to do today?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(126, 58, 242, 1)),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black54,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60),
                                  borderSide:
                                      const BorderSide(color: Colors.black54),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60),
                                  borderSide:
                                      const BorderSide(color: Colors.black54),
                                ),
                                hintText: "Find a nearby activity",
                                hintStyle: const TextStyle(
                                    color: Colors.black54, fontSize: 15),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              print('Menu icon pressed');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // Static Categories section
              const Padding(
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: StaticCategories(),
                ),
              ),
              const SizedBox(height: 30),
              // Image banners
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
