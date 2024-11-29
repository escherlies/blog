+++
title = "TIL: Creating Deep Links for Microsoft Teams Tabs with @microsoft/teams-js"
date = 2024-07-11
tags = ["TIL"]
+++

**TIL**: Generating deep links to specific tabs in Microsoft Teams apps using the Teams JavaScript SDK.

Steps
1. Fetch Context: Retrieve entityId and channelId using app.getContext().
2. Get Tab Info: Use pages.tabs.getTabInstances() to get the appId of the tab.
3. Build Context: Create a context object with the subEntityId and other parameters.
4. Construct URL: Combine the appId, entityId, and context into the required Teams deep link format.

# Resources

[Deep Link Documentation](https://learn.microsoft.com/en-us/microsoftteams/platform/concepts/build-and-test/deep-link-application?tabs=teamsjs-v2#configure-deep-link-to-browse-within-your-app-manually)

# Code

```ts
import { app, pages } from "@microsoft/teams-js"

/**
 * Generates a deep link to a specific tab within a Microsoft Teams application.
 * 
 * @param {string} [subEntityId] - Optional. An identifier for a specific item within the tab. This
 *                                 is used to navigate to a particular content or page within the tab.
 *                                 When generating a URL for deep linking, continue to use subEntityId
 *                                 as the parameter name in the URL. When configuring the tab, the context
 *                                 object refers to the subEntityId as page.subPageId.
 * 
 * @returns {Promise<string>} - A promise that resolves to a deep link URL to the tab.
 */
export async function getTeamsAppDeepLink(subEntityId?: string): Promise<string> {
  // Get entityId and channelId from the app context
  const appContext = await app.getContext()
  const entityId = appContext.page.id
  const channelId = appContext.channel?.id

  // Get the appId of the tabs instance
  const { teamTabs } = await pages.tabs.getTabInstances()
  const appId = (teamTabs[0] as any).appId // Type is not defined in the SDK

  const options = {
    channelId: channelId,
    // An ID for the item within the tab. When generating a URL for deep linking,
    // continue to use subEntityId as the parameter name in the URL. When configuring
    // the tab, the context object refers to the subEntityId as page.subPageId.
    subEntityId: subEntityId
  }
  const context = encodeURIComponent(JSON.stringify(options))

  return `https://teams.microsoft.com/l/entity/${appId}/${entityId}?context=${context}`
}

