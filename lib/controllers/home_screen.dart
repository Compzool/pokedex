import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/widgets/constants.dart';
import 'package:pokedex/widgets/hex_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Image.asset(
                  'assets/icons/pokeball.png',
                  fit: BoxFit.contain,
                  height: 24,
                  width: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pokedex",
                  style: TextStyle(
                      fontSize: 24,
                      color: pokedexColor,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              unselectedLabelColor: unselectedLabelColor,
              labelColor: labelColor,
              indicatorColor: indicatorColor,
              indicatorWeight: 5,

              // indicator: BoxDecoration(
              //     color: Colors.green,
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              tabs: const [
                Tab(
                  child: Text(
                    'All Pokemon',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Favorites',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('people')),
                Center(child: Text('Person'))
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
