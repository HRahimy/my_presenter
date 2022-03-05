# Hamza Rahimy portfolio site

A Flutter app primarily targeting web to show my portfolio. I wanted the source code to be available
for free for anyone wanting to build something similar.

## Hosting the site on firebase

### Prerequisites

1. A [Firebase](https://console.firebase.google.com/u/0/) account and a suitable project where you'd
   be hosting the site.
2. Install the [Firebase CLI](https://firebase.google.com/docs/cli).
3. Activate the [FlutterFire CLI](https://firebase.flutter.dev/docs/overview).
4. You are logged in as the desired user in the [Firebase CLI](https://firebase.google.com/docs/cli)
   .

### Steps

1. Make sure you're in the project root directory.
2. Run `firebase init`.
    1. When asked which firebase features you want to activate, select the one that
       says `Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys`
    2. When asked for the public directory, set it to `build/web`
    3. When asked if you want to configure as a single-page app, answer `yes`
    4. Answer No when asked if you want to set up automatic builds and deploys with GitHub.
    5. Select the desired project when asked.
3. Run `flutterfire configure`.
    1. Select only `web` option when asked which platform you want to add configuration support for.
4. Build the web app: `flutter build web --web-renderer html`
    - We'll be using the html web rendered since the default CanvasKit renderer has issues loading
      emojis. See [here](https://github.com/flutter/flutter/issues/76248) to learn more.
5. Deploy the web app: `firebase deploy`
