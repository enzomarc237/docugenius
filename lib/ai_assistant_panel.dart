import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class AiAssistantPanel extends StatelessWidget {
  const AiAssistantPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AI Assistant',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Card(
                      color: Color(0xFF3B82F6),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('How to implement OAuth2 in Node.js?', style: TextStyle(color: CupertinoColors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Certainly! Here is a basic implementation of an Express server with an OAuth2 flow using `passport-google-oauth20`.'),
                          SizedBox(height: 10),
                          CodeBlock(),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Chip(label: Text('Express Docs')),
                              SizedBox(width: 8),
                              Chip(label: Text('Passport.js')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const MacosTextField(
            placeholder: 'Ask a question...',
            suffix: MacosIcon(CupertinoIcons.arrow_up_circle_fill),
          ),
        ),
      ],
    );
  }
}

class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0e111d),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        '''const express = require('express');
const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;

const app = express();

passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_CLIENT_ID,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    callbackURL: "/auth/google/callback"
  },
  (accessToken, refreshToken, profile, cb) => {
    // Find or create user
  }
));''',
        style: TextStyle(fontFamily: 'monospace', color: CupertinoColors.white),
      ),
    );
  }
}

class Chip extends StatelessWidget {
  const Chip({super.key, required this.label});
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF3B82F6).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: label,
    );
  }
}
