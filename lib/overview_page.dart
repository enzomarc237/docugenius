import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, Alex!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Current Project: API Integration'),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: RecentQuestions(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: SuggestedDocs(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ActiveIntegrations(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class RecentQuestions extends StatelessWidget {
  const RecentQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Questions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          child: Column(
            children: [
              const ListTile(
                leading: Icon(CupertinoIcons.chevron_left_slash_chevron_right),
                title: Text('How to implement OAuth2 in Node.js?'),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.chart_bar),
                title: Text('What\'s the best way to handle state in React?'),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.ant),
                title: Text('Example of a GET request with Axios'),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SuggestedDocs extends StatelessWidget {
  const SuggestedDocs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suggested Docs',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          child: Column(
            children: [
              const ListTile(
                leading: Icon(CupertinoIcons.doc_text),
                title: Text('Stripe API Authentication Guide'),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.doc_text),
                title: Text('React Hooks Quickstart'),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.doc_text),
                title: Text('Deploying Node.js on Vercel'),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActiveIntegrations extends StatelessWidget {
  const ActiveIntegrations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Active Integrations',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuAcz3tJal5SSp4L2sq6e_7D3Z8q04HuG0sL6j6FoFOJpimJTgZBaUdN8IR5rF_43GonOLcq2Kzf7Q-6Ny9kSfa868h0VF0QKKbL_VQTYh_ZJTJvu-Y4huEgJIsxarsx-_0pvCIhNgCf0BgoHHtvai_8DaR7xZgzZY45_HXUljlUlWolcg_JzWMPI7uopfXsuslujp3Tj6hxTJvBQogl6BONAE6gP8KI5lTo7xe1QCFM_ijLRqEV9Ptx0FoyoWX9wYlP0cqywN3MJtsx', width: 24, height: 24),
                    const SizedBox(width: 8),
                    const Text('GitHub'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuCM7I6YnRaMh3udBy9v3QybKo9BqhI7dNiVSF_RdYSX1O_7Hrb4ZoAEX3HFYTC-7B33vCFzXKMwDEzLDhS0-gA5BwnGUTgHJy0mYTGs9li39E1w_b7f_IoJktLX-cZxz3O-Lmjts8PXYHogLODe2WFP40t-q_GpuV1jsQ4iFYYJIpzTr-nhu7KbWsj9kTCyvE6XqRq-nqkP8sIugdyauAKBi8yqWVhNbPbON810qRJPTx11DHqPRUFmeIN_nxGcG8hDmhB1qXlW1AsL', width: 24, height: 24),
                    const SizedBox(width: 8),
                    const Text('Slack'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuATl7l3bPBBFsQcIUokCXAmWXBAdDsEvUZjH9l_BujHmUQBTo8Ppm7aXs71FtHNa_p0-qbz10ovKlgNcO0i-OVY1a7pSYVjcmCtTzLB56X_wRBOwy7viH3QBEfFutn5TBdxGsdge2JrCu-YORzFN4d-HgjZx7pVK3pkxGasvsn1cQTsCI1MZ4ZU41trL5tYq7qJbCYCfLIH41FrmDkqmqsBlElzcewwGAPms6VH9MBT3FTbHYTwQ2vbBBv6_xZMXAP28_xY2eMLzsfs', width: 24, height: 24),
                    const SizedBox(width: 8),
                    const Text('Jira'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
