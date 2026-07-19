import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:go_router/go_router.dart';
import '../router.dart' show resetRouterBootstrap;
import '../signals.dart';

class WaiverScreen extends StatefulWidget {
  const WaiverScreen({super.key});

  @override
  State<WaiverScreen> createState() => _WaiverScreenState();
}

class _WaiverScreenState extends State<WaiverScreen> {
  String _waiverText = 'Loading waiver...';
  bool _isLoading = true;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadWaiver();
  }

  Future<void> _loadWaiver() async {
    try {
      final text = await rootBundle.loadString('assets/waiver.md');
      if (mounted) {
        setState(() {
          _waiverText = text;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _waiverText =
              'Error loading waiver document. Please contact support.';
          _isLoading = false;
        });
      }
      log.severe('Failed to load waiver asset', e);
    }
  }

  Future<void> _acceptWaiver() async {
    setState(() {
      _isSubmitting = true;
    });

    try {
      // Calling our new endpoint
      await client.member.acceptWaiver();

      if (mounted) {
        // Clear stale bootstrap so the redirect re-runs _performBootstrap
        // with the freshly-accepted waiver date.
        resetRouterBootstrap();
        GoRouter.of(context).go('/');
      }
    } catch (e) {
      log.severe('Failed to accept waiver', e);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save waiver: $e')));
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _declineWaiver() async {
    await sessionManager.signOutDevice();
    if (mounted) {
      GoRouter.of(context).go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Required Waiver'),
        automaticallyImplyLeading: false, // Force user to act
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(child: Markdown(data: _waiverText)),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _isSubmitting
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                onPressed: _declineWaiver,
                                child: const Text('Decline & Logout'),
                              ),
                              FilledButton(
                                onPressed: _acceptWaiver,
                                child: const Text('I Accept'),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
