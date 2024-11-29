+++
title = "The Problem with Notifications on Chromium-Based Browsers on macOS"
date = "2024-06-01"
+++

If you're a web developer working with notifications on Chromium-based browsers on macOS, you might have encountered some puzzling behavior. Specifically, when trying to display notifications with `requireInteraction = true`, you might find that no notifications appear unless certain conditions are met. Here’s what’s going on:

### Two Applications, One Issue

Chromium-based browsers (like Chrome, Brave, and Edge) register two different applications in macOS: **Chromium** and **Chromium Helper (Alerts)**. This dual registration is the root of the problem.

### `requireInteraction = true` and Notification Permissions

When you set `requireInteraction = true` in your notification code, you expect the notification to stay visible until the user interacts with it. However, in Chromium browsers on macOS, these notifications won’t show up at all unless **Chromium Helper (Alerts)** has the necessary permissions in the macOS notification settings.

### Steps to Fix the Issue

To ensure your notifications display correctly, follow these steps:

1. **Open System Preferences on macOS.**
2. **Navigate to Notifications.**
3. **Find and select Chromium Helper (Alerts).**
4. **Enable the necessary permissions.**

### Tips for Firefox and Safari Users

While dealing with notifications, also ensure that users set the notification permissions for Firefox and Safari to "Alerts" to achieve sticky notifications. This ensures notifications behave as expected, staying visible until the user interacts with them.

### Conclusion

Understanding and configuring notification settings on macOS is crucial for developers aiming to deliver a seamless user experience. Ensure you adjust the permissions for **Chromium Helper (Alerts)** and educate your users about setting notifications to "Alerts" on other browsers for consistent, sticky notifications. Happy coding!