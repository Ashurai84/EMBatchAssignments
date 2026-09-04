import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MEDIAQUERY: Dynamically adapts layout based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo.shade50,
      ),
      // Drawer is used for Mobile view navigation; hidden on desktop
      drawer: isMobile ? const Drawer(child: AppMenu()) : null,
      body: Row(
        children: [
          // 2. EXPANDED: Permanent sidebar in Desktop View
          if (!isMobile)
            const Expanded(
              flex: 2,
              child: AppMenu(),
            ),

          // Main Content Area
          Expanded(
            flex: 8,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // 3. FLEXIBLE: Welcome banner with Flexible text to prevent overflow
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.dashboard_customize, color: Colors.white, size: 32),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome Back, Admin!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              isMobile
                                  ? 'Current Mode: Mobile View (2 Columns)'
                                  : 'Current Mode: Desktop View (4 Columns + Sidebar)',
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // 4. GRIDVIEW: 2 columns on Mobile, 4 columns on Desktop
                const Text('Overview Metrics', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isMobile ? 2 : 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: isMobile ? 1.6 : 1.35,
                  children: const [
                    MetricTile(title: 'Revenue', value: '₹1,24,500', color: Colors.green),
                    MetricTile(title: 'Users', value: '2,840', color: Colors.blue),
                    MetricTile(title: 'Orders', value: '450', color: Colors.orange),
                    MetricTile(title: 'Pending', value: '14', color: Colors.red),
                  ],
                ),
                const SizedBox(height: 20),

                // 5. LISTVIEW: Recent Activities list
                const Text('Recent Activities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart, color: Colors.indigo),
                    title: Text('Order #4029 placed by Rahul'),
                    subtitle: Text('5 mins ago'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.indigo),
                    title: Text('Payment received ₹1,499'),
                    subtitle: Text('20 mins ago'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.person_add, color: Colors.indigo),
                    title: Text('New customer registered'),
                    subtitle: Text('1 hour ago'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Menu used in Drawer (Mobile) & Sidebar (Desktop)
class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Dashboard'), selected: true),
          ListTile(leading: Icon(Icons.bar_chart), title: Text('Analytics')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}

// Compact Metric Card with overflow protection
class MetricTile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const MetricTile({super.key, required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(75)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
