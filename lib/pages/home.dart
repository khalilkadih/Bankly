import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  Wallet? wallet;

  @override
  void initState() {
    super.initState();
    _getWallet();
  }

  Future<void> _getWallet() async {
    try {
      final walletData = await WalletService().getWallet();
      setState(() {
        wallet = walletData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.blue),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.monetization_on, color: Colors.blue))
        ]),
      ),
      body: SafeArea(
        child: Column(children: [
          // app bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My-Wallet',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),

          Container(
            height: 198,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                if (wallet != null)
                  MyCard(
                    balance: wallet!.balance,
                    cardNumber: 123456789,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.blue,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  iconImagePath: 'lib/icons/save-money.png',
                  buttonText: 'Send',
                  onTap: () {
                    Navigator.pushNamed(context, 'DebitPage');
                  },
                ),
                MyButton(
                  iconImagePath: 'lib/icons/bill.png',
                  buttonText: 'Bills',
                  onTap: () {
                    Navigator.pushNamed(context, '/debit');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 0),

          const Padding(
            padding: EdgeInsets.all(35.0),
            child: Column(children: [
              MyListTile(
                iconImagePath: 'lib/icons/transactions.png',
                tileTitle: 'History',
                tileSubtitle: 'Transactions Made',
              ),

            ]),
          )
        ]),
      ),
    );
  }
}
